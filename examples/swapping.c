#include <stdio.h>

int main() {
    double firstNumber, secondNumber, temporaryVariable;

    firstNumber = 1;
    secondNumber = 2;

    // Value of firstNumber is assigned to temporaryVariable
    temporaryVariable = firstNumber;

    // Value of secondNumber is assigned to firstNumber
    firstNumber = secondNumber;
    secondNumber = temporaryVariable;

    return 0;
}