#include <stdio.h>

int main() {
    int number, originalNumber, remainder, result = 0;

    number = 1634;

    originalNumber = number;

    while (originalNumber != 0) {
        remainder = originalNumber % 10;
        result += remainder * remainder * remainder;
        originalNumber /= 10;
    }

    return 0;
}