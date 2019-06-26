#include <stdio.h>
#include <stdbool.h>

int main() {
    int number;
    bool result;

    number = 101;

    // True if the number is perfectly divisible by 2
    if(number % 2 == 0)
        result = true;
    else
        result = false;

    return 0;
}