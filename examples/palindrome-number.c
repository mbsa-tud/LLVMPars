#include <stdio.h>
#include <stdbool.h>

int main() {
    int n, reversedInteger = 0, remainder, originalInteger;
    bool result;

    n = 525;

    originalInteger = 525;

    // reversed integer is stored in variable
    while (n != 0) {
        remainder = n % 10;
        reversedInteger = reversedInteger * 10 + remainder;
        n /= 10;
    }

    // palindrome if orignalInteger and reversedInteger are equal
    if (originalInteger == reversedInteger)
        result = true;
    else
        result = false;

    return 0;
}
