#include "json.hpp"

#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"

#include <fstream>
#include <iomanip>
#include <sstream>
#include <string>
#include <iostream>
#include <vector>

using namespace llvm;
using json = nlohmann::json;

// The pass goes through the LLVM IR structure of the given software.
// For each function in the module.
// For each basic block in the function.
// For each instruction in the basic block.

namespace {
struct DepmPass : public ModulePass {
    static char ID;
    DepmPass() : ModulePass(ID) {}

    int const_id = 0;
    int anon_id = 0;
    int bb_seq = 0;

    Function *hook;
    Instruction *print_ins;

    std::string prev_ins;

    json bb_names; // A json with basic block names in the IR and DEPM

    virtual bool runOnModule(Module &M) {
        int f_id = 0;
        int bb_id = 0;
        int ins_id = 0;

        json model;

        Constant *hookFunc;
        LLVMContext &ctx = M.getContext();

        // Insert print function after each basic block to generate a sequence
        // of their execution
        std::vector<Type *> print_args;
        print_args.push_back(Type::getInt32Ty(ctx));
        ArrayRef<Type*> argsRef(print_args);

        FunctionType *putsType = FunctionType::get(Type::getInt32Ty(ctx),
                                                   argsRef, false);
        hookFunc = M.getOrInsertFunction("print", putsType);

        hook = cast<Function>(hookFunc);
        hook->setCallingConv(llvm::CallingConv::C);
        assert(hook->arg_begin() != hook->arg_end());
        Argument *ArgI = hook->arg_begin();
        ArgI->setName("Int");

        for (auto& F : M) {
            std::string f_name = F.getName();
            json f_model;
            json j;
            bb_names[f_name] = j;
            model[f_name] = getFuncModel(&F, f_id);
            if (model[f_name].is_null()) {
                model.erase(f_name);
                bb_names.erase(f_name);
            }
            else {
                f_id++;
            }
        }

        write_json(model, "model");
        write_json(bb_names, "bb_names");

        return true;
    }

    json getFuncModel(Function *F, int f_id) {
        // Returns a json of the given function
        json f_model;
        std::string f_name = F->getName();
        int bb_id = 0;

        LLVMContext &ctx = F->getContext();

        for (auto& BB : *F) {
            std::stringstream ss;
            ss << "F" << f_id << "_" << f_name << "_" << "BB" << bb_id;
            std::string bb_name = ss.str();
            f_model[bb_name] = getBbModel(&BB, bb_name);
            prev_ins = "";

            std::string bbnm = BB.getName();
            bb_names[f_name][bbnm][bb_name] = bb_seq;

            bb_id++;
            bb_seq++;
        }

        return f_model;
    }

    json getBbModel(BasicBlock *BB, std::string bb_name) {
        // Returns a json of the given basic block
        json bb_model;
        int ins_id = 0;
        for (auto& I : *BB) {
            if (ins_id == 0) {
                Value *arg_for_print = ConstantInt::get(
                    Type::getInt32Ty(BB->getContext()), bb_seq);
                print_ins = CallInst::Create(hook, arg_for_print, "");
                BB->getInstList().insert(BB->begin(), print_ins);
            }
            std::string i_name = I.getOpcodeName();
            std::stringstream ss;
            ss << bb_name << "_" << "INS" << ins_id << "_" << i_name;
            std::string ins_name = ss.str();
            bb_model[ins_name] = getInsModel(&I, ins_name);
            if (prev_ins != "") {
                bb_model[prev_ins]["cf_outputs"].push_back(ins_name);
            }
            prev_ins = ins_name;
            ins_id++;
        }

        return bb_model;
    }

    json getInsModel(Instruction *I, std::string ins_name) {
        // Returns a json of the given instruction
        std::string f_name = I->getFunction()->getName();
        json ins_model;

        ins_model["cf_outputs"] = {};
        ins_model["df_inputs"] = {};
        ins_model["df_outputs"] = {};
        ins_model["call"] = "";

        if (I->hasName()) {
            std::string i_name = I->getName();
            std::stringstream ss;
            ss << f_name << "_%" << i_name;
            std::string data_name = ss.str();
            ins_model["df_outputs"].push_back(data_name);
        }

        if (I->getOpcode() == Instruction::Store) {
            std::string data_name = getDataName(I->getOperand(0), f_name);
            ins_model["df_inputs"].push_back(data_name);

            for (int i = 1; i < I->getNumOperands(); i++) {
                data_name = getDataName(I->getOperand(i), f_name);
                ins_model["df_outputs"].push_back(data_name);
            }
        }
        else if (I->getOpcode() == Instruction::Call) {
            json call;
            std::string data_name;
            CallInst *callinst = cast<CallInst>(I);
            Function *calledfun = callinst->getCalledFunction();
            ins_model["call"]  = calledfun->getName();
            for (int i = 0; i < I->getNumOperands() - 1; i++) {
                data_name = getDataName(I->getOperand(i), f_name);
                ins_model["df_inputs"].push_back(data_name);
            }
        }
        else {
            for (int i = 0; i < I->getNumOperands(); i++) {
                Value *operand = I->getOperand(i);
                std::string data_name = getDataName(operand, f_name);
                if (data_name != "") {
                    ins_model["df_inputs"].push_back(data_name);
                }
                if (operand->getType()->isLabelTy()) {
                    std::string bbnm = operand->getName();
                    ins_model["cf_outputs"].push_back(bbnm);
                }
            }
        }
        return ins_model;
    }

    std::string getDataName(Value *operand, std::string f_name) {
        // Returns data name depends on data type
        std::string data_name;
        if (operand->getType()->isLabelTy()) {
            return data_name;
        }
        else if (operand->hasName()) {
            std::string o_name = operand->getName();
            std::stringstream ss;
            if (isa<GlobalVariable>(operand)) {
                ss << "@" << o_name;
            }
            else {
                ss << f_name << "_%" << o_name;
            }
            data_name = ss.str();
        }
        else {
            std::stringstream ss;
            if (isa<Constant>(operand)) {
                ss << f_name << "_Constant" << const_id;
                const_id++;
            }
            else {
                ss << f_name << "_Anon" << anon_id;
                anon_id++;
            }
            data_name = ss.str();
        }
        return data_name;
    }

    std::vector<std::string> getFuncArgs(Function *calledfun) {
        // Gets function args
        std::vector<std::string> args;
        for (Function::arg_iterator arg = calledfun->arg_begin(),
             arg_e = calledfun->arg_end(); arg != arg_e; ++arg) {
            std::string arg_name = arg->getName();
            std::stringstream ss;
            std::string calledfun_name = calledfun->getName();
            ss << calledfun_name << "_%" << arg_name;
            args.push_back(ss.str());
        }
        return args;
    }

    void write_json(json j, std::string name) {
        // Writes json file.
        std::ofstream o(name + ".json");
        o << std::setw(4) << j << std::endl;
    }
};
}

char DepmPass::ID = 0;
static RegisterPass<DepmPass> X("depm_pass", "DEPM Pass",
                                false /* Only looks at CFG */,
                                false /* Analysis Pass */);
