"""
LLVMParser class
"""

import os
import re

from collections import Counter
from skidmarks import serial_test

from OpenErrorPro.epl_logger import Logger
from OpenErrorPro.epl_model import Model
from OpenErrorPro.epl_xml import XML


class LLVMParser:
    """
    Creates a DEPM.
    """
    def __init__(self, src_model, bb_names, seq):
        """
        LLVMParser init function.

        Args:
            src_model: model.json
            bb_names: bb_names.json
            seq: sequence.txt
        """
        self.src_model = src_model
        self.bb_names = bb_names
        self.seq = seq
        self.logger = Logger()
        self.models = {}
        self.model_cf = {}
        self.model_data = {}

        self.parse()

    def parse(self):
        """
         Model generation.
        """
        for f_name in self.src_model:
            self.model_cf[f_name] = []
            self.model_data[f_name] = []
            self.models[f_name] = self.get_model(f_name)

        self.set_cf_jumps()

    def get_model(self, f_name):
        """
        Generates a model of the given function.

        Args:
            f_name: Function name.

        Returns:
            OpenErrorPro.epl_model of the function.
        """
        model = Model(self.logger)
        if self.src_model[f_name] is None:
            return model
        for bb in self.src_model[f_name]:
            model.add_element(bb)
            model.elements[bb]['sub_model'] = self.get_ins_model(f_name, bb)

            # set initial element
            if 'BB0' in bb:
                model.set_initial_element(bb)

        model = self.set_bb_data(model, f_name)
        model = self.set_bb_cf(model, f_name)
        model = self.set_cf_cmds(model, f_name)

        return model

    def get_ins_model(self, f_name, bb):
        """
        Creates a model of the given basic block.
        Args:
            f_name: Function name.
            bb: Basic block name.

        Returns:
            OpenErrorPro.epl_model of the basic block.
        """
        sub_model = Model(self.logger)
        for ins in self.src_model[f_name][bb]:
            sub_model.add_element(ins)

            # set initial element
            if 'INS0' in ins:
                sub_model.set_initial_element(ins)

            inputs = self.src_model[f_name][bb][ins]['df_inputs']
            outputs = self.src_model[f_name][bb][ins]['df_outputs']
            if inputs:
                sub_model, gdata = self.set_ins_data(sub_model, ins, inputs, 0)
                for data in gdata:
                    self.model_data[f_name].append((data, bb, 0))
            if outputs:
                sub_model, gdata = self.set_ins_data(sub_model, ins, outputs, 1)
                for data in gdata:
                    self.model_data[f_name].append((data, bb, 1))

            cf_outputs = self.src_model[f_name][bb][ins]['cf_outputs']
            sub_model, bb_cf = self.set_ins_cf(ins, sub_model, cf_outputs)
            self.get_bb_cf(f_name, bb, bb_cf)

        return sub_model

    def set_ins_cf(self, ins, sub_model, cf_outputs):
        """
        Sets control flow between instructions in the given function.

        Args:
            ins: Instruction name.
            bb: Basic block name.
            sub_model: OpenErrorPro.epl_model of the basic block.
            f_name: Function name.
            cf_outputs: A list with cf outputs. It can be an instruction or a
             basic block.

        Returns:
            A tuple with OpenErrorPro.epl_model of the basic block with control
            flow and a list with output basic blocks.
        """
        bb_cf = []
        if not cf_outputs:
            return sub_model, bb_cf

        for output in cf_outputs:
            if re.match(r'^F\d+_\w+_BB\d+_INS\d+_\w+$', output):
                if output in sub_model.elements:
                    sub_model.add_control_flow(ins, output)
                else:
                    sub_model.add_element(output)
                    sub_model.add_control_flow(ins, output)
            else:
                bb_cf.append(output)

        return sub_model, bb_cf

    def get_bb_cf(self, f_name, bb, bb_cf):
        """
        Puts control flow between basic blocks to the self.

        Args:
            f_name: Function name.
            bb: Basic block name.
            bb_cf: A list with output basic blocks
        """
        for output in bb_cf:
            if output in self.bb_names[f_name]:
                cf_target = next(iter(self.bb_names[f_name][output]))
                self.model_cf[f_name].append((bb, cf_target))

    def set_bb_cf(self, model, f_name):
        """
        Sets control flow between basic blocks in the given function.

        Args:
            model: OpenErrorPro.epl_model of the function.
            f_name: Function name.

        Returns:
            OpenErrorPro.epl_model of the function with control flow.
        """
        if f_name in self.model_cf:
            for cf in self.model_cf[f_name]:
                model.add_control_flow(cf[0], cf[1])
        return model

    def set_cf_cmds(self, model, f_name):
        """
        Sets cfc and epc commands for basic blocks that have two or more
        control flow outputs.

        Args:
            model: OpenErrorPro.epl_model of the function.
            f_name: Function name.
        Returns:
            OpenErrorPro.epl_model of the function with cf commands.
        """
        for bb_name, bb in model.elements.items():
            if len(bb['cf_outputs']) > 1:
                # get the basic block sequence id
                bb_seq = [self.bb_names[f_name][x][bb_name]
                          for x in self.bb_names[f_name]
                          if bb_name in self.bb_names[f_name][x]]
                if bb_seq is not None:
                    cfc, epc, is_stoch = self.get_cf_cmds(bb_name, bb_seq[0])
                    bb['cf_prism_commands'] = cfc
                    bb['ep_prism_commands'] = epc

                    # add increment if stochastic
                    if is_stoch:
                        model.add_data('i')
                        model.add_data_flow('i', bb_name)
                        model.add_data_flow(bb_name, 'i')

        return model

    def set_ins_data(self, sub_model, ins, df, typ):
        """
        Sets data and data flow instruction level in the given sub model.

        Args:
            sub_model: OpenErrorPro.epl_model of the basic block.
            ins: Instruction name.
            df: List of data.
            typ: input or output.

        Returns:
            A tuple of the sub model with data and data flow and related global
            data list.
        """
        global_data = []
        for data in df:
            data = self.fix_data_name(data)
            sub_model.add_data(data)

            if typ == 0:  # input
                sub_model.add_data_flow(data, ins)
            else:  # output
                sub_model.add_data_flow(ins, data)
                cmd = self.get_ep_cmd(ins, data)
                # get an error propagation command for the instruction
                sub_model.elements[ins]['ep_prism_commands'].append(cmd)

            # collect data of the model to apply it at the basic block level
            if 'GLOBAL' in data:
                global_data.append(data)

        return sub_model, global_data

    def set_bb_data(self, model, f_name):
        """
        Adds data and data flow between basic blocks in the given model.
        If a data appears in a few basic blocks it should be duplicated at the
        basic block level.

        Args:
            model: OpenErrorPro.epl_model of the function.
            f_name: Function name.

        Returns:
            The given model with basic blocks data and data flow.
        """
        for bb_data in self.model_data[f_name]:
            model.add_data(bb_data[0])
            if bb_data[2] == 0:
                model.add_data_flow(bb_data[0], bb_data[1])
            else:
                model.add_data_flow(bb_data[1], bb_data[0])

        return model

    @staticmethod
    def fix_data_name(data_name):
        """
        Replaces invalid symbols in the given data name.

        Args:
            data_name: Data name.

        Returns:
            Fixed data name.
        """
        if '%' in data_name:
            data_name = data_name.replace('%', 'LOCAL_')
        if '@' in data_name:
            data_name = data_name.replace('@', 'GLOBAL_')
        if '.' in data_name:
            data_name = data_name.replace('.', '_')

        return data_name

    def set_cf_jumps(self):
        """
        Puts a called function model to the sub model of the call instruction.
        """
        for model, basic_blocks in self.src_model.items():
            for basic_block, ins in basic_blocks.items():
                for ins_name, ins_data in ins.items():
                    call = ins_data['call']
                    if call and call in self.models:
                        self.models[model].elements[basic_block][
                            'sub_model'].elements[ins_name]['sub_model'] = \
                            self.models[call]


    @staticmethod
    def get_ep_cmd(element, df_output):
        """
        Generates a ep_prism_command for the given instruction
        and the data output.

        Args:
            element: A name of an instruction element.
            df_output: An output data name.

        Returns:
            A generated command in str format.
        """
        def_prob = 0.1  # default probability
        errors = {
            'alloca': 0.01,
            'store': 0.02,
            'load': 0.03,
            'icmp': 0.04,
            'add': 0.05,
            'fmul': 0.06,
            'fsub': 0.07,
        }

        ins_name = [x for x in errors if x in element]
        if ins_name:
            error = ins_name[0]
            cmd = "true -> {0}:({1}'=ok)+{2}:({1}'=error);".format(
                1 - errors[error], df_output, errors[error])
        else:
            cmd = "true -> {0}:({1}'=ok)+{2}:({1}'=error);".format(
                1 - def_prob, df_output, def_prob)

        return cmd

    def get_cf_cmds(self, bb_name, bb_seq_id):
        """
        Generates cfc and epc commands for basic blocks that have two or more
        control flow outputs. Distinguish between stochastic and deterministic
        control flow transitions via the application of the serial test to the
        sequence to check it for randomness.

        Args:
            bb_name: Basic block name.
            bb_seq_id: Basic block sequence id.

        Returns:
            A tuple with lists of cfc and epc commands.
        """
        cfcs = []
        epcs = []
        is_stoch = False
        if bb_seq_id in self.seq:
            seq = self.seq[bb_seq_id]
            if len(seq) < 2:
                return cfcs, epcs, is_stoch

            bb_seq = self.get_bb_seq()
            test = serial_test(seq)
            if self.is_stochastic(test['p']):  # Stochastic
                for i, j in enumerate(seq):
                    cf_new = bb_seq[int(j)]
                    cfcs.append("(cf={}) & (i={}) -> (cf'={});".format(
                        bb_name, i, cf_new))
                epcs.append("(i<{}) -> (i'+1);".format(len(seq)))
                is_stoch = True
            else:  # Deterministic
                counter = Counter(seq)
                if len(counter) < 2:
                    cf_new = bb_seq[int(seq[0])]
                    cfcs.append("(cf={}) -> (cf'={});".format(bb_name, cf_new))
                else:
                    prob = next(iter(counter.values())) / len(seq)
                    cf_new = []
                    for i in counter:
                        cf_new.append(bb_seq[int(i)])
                    cfcs.append("(cf={}) -> {}:(cf'={}) + {}:(cf'={});".format(
                        bb_name, prob, cf_new[0], 1 - prob, cf_new[1]))

        return cfcs, epcs, is_stoch

    def get_bb_seq(self):
        """
        Generates a dict mapping basic block name and corresponding sequence id.

        Returns:
            {0: 'F0_main_BB0}
        """
        bb_seq = {}
        for bb_ir in self.bb_names.values():
            for bb in bb_ir.values():
                bb_name = next(iter(bb))
                if bb_name is not None:
                    bb_seq[bb[bb_name]] = bb_name
        return bb_seq

    @staticmethod
    def is_stochastic(prob):
        """
        Deceides between stochastic and deterministic.

        Args:
            prob: An error probability

        Returns:
            Bool
        """
        if prob < 0.5:
            return True
        else:
            return False

    def save(self, filename, f_name='main'):
        """
        Saves the model to an XML.

        Args:
            filename: A name of the file.
            f_name: A name of the initial function.
        """
        if f_name in self.models:
            cwd = os.getcwd()
            xml = XML()
            xml.save(self.models[f_name],
                     os.path.join(cwd, '{}.xml'.format(filename)))
