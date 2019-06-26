#include <stdio.h>

int main() {

    int n, i;
    unsigned long long factorial = 1;

    n = 5;

    for (i = 1; i <= n; ++i) {
        factorial *= i;              // factorial = factorial*i;
    }

    return 0;
}