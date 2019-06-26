## How to start

### Get LLVM

- download LLVM from http://releases.llvm.org/download.html

- setup the path to the llvm bin folder in the run.sh file (line 4):
```markdown
LLVM_BIN_DIR=~/llvm7/bin
```

### Install python3 libs
```markdown
sudo apt-get install python3-colorama
sudo apt-get install skidmarks
```

### Run
- source code should be placed in the project root directory
- setup the filename of the source code (line 3):

```markdown
FILE=flugsteuerung
```

- setup the path to the input data if required (line 32):

```markdown
${LLVM_BIN_DIR}/lli print_${FILE}1.bc data/input.txt
```

- setup instruction level probabilities if required (parser.py:303 line)
```markdown
errors = {
    'alloca': 0.01,
    'store': 0.02,
    'load': 0.03,
    'icmp': 0.04,
    'add': 0.05,
    'fmul': 0.06,
    'fsub': 0.07,
}
```

- run

```markdown
./run.sh
```
