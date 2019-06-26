#!/usr/bin/env bash

FILE=flugsteuerung
LLVM_BIN_DIR=~/llvm7/bin

echo "Compiling DEPM Pass..."
${LLVM_BIN_DIR}/clang -c pass/pass.cpp -o pass/pass.o \
    `${LLVM_BIN_DIR}/llvm-config --cxxflags` -fPIC -fno-rtti
${LLVM_BIN_DIR}/clang -shared pass/pass.o -o pass/pass.so \
    `${LLVM_BIN_DIR}/llvm-config --ldflags`  -fPIC

echo "Compiling print function..."
${LLVM_BIN_DIR}/clang -c -emit-llvm print/print.c -o print/print.bc

echo "Compiling source code..."
#rm -rf ${FILE}
mkdir ${FILE}
${LLVM_BIN_DIR}/clang ${FILE}.c -c -emit-llvm -o ${FILE}/${FILE}.bc
cd ${FILE}
rm sequence.txt

echo "Giving names to unnamed data in the LLVM IR code..."
${LLVM_BIN_DIR}/opt -instnamer -S ${FILE}.bc -o ${FILE}.ll

echo "DEPM pass..."
${LLVM_BIN_DIR}/opt -load ../pass/pass.so -depm_pass <${FILE}.ll> ${FILE}1.bc

echo "Linking..."
${LLVM_BIN_DIR}/llvm-link ../print/print.bc ${FILE}1.bc -o print_${FILE}1.bc

echo "Generating sequence of instructions..."
${LLVM_BIN_DIR}/lli print_${FILE}1.bc data/input.txt

echo "Creating DEPM..."
python3 ../c2depm.py

echo "Done!"
