"""c2depm"""
import json
import os

from parser import LLVMParser


def load_sequence():
    """
    Loads generated sequence.txt file into a dict.

    Returns:
        A dict with basic blocks sequence id where the id is a key and a list of
        ids that executes after the basic block as a value. Example:

        {0: [1, 1, 1, 2, 1, 2, 2],
         1: [3, 3, 3],
         2: [4]}
    """
    seq_path = 'sequence.txt'
    seq_list = [line.rstrip('\n') for line in open(seq_path, 'r')]
    sequence = {}

    for i, seq in enumerate(seq_list[:-1]):
        cur_seq = int(seq)
        next_seq = int(seq_list[i + 1])
        if cur_seq in sequence:
            sequence[cur_seq].append(next_seq)
        else:
            sequence[cur_seq] = []
            sequence[cur_seq].append(next_seq)

    return sequence


def run():
    """
    Run function.
    """
    print(os.getcwd())
    with open('model.json') as model_file:
        model = json.load(model_file)

    with open('bb_names.json') as bb_file:
        bb_names = json.load(bb_file)

    seq = load_sequence()

    depm = LLVMParser(model, bb_names, seq)
    depm.save('c_to_DEPM')


if __name__ == '__main__':
    run()
