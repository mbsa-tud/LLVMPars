#include <stdio.h>

int main() {
    int n1, n2, n3, gcd;

    n1 = 15;
    n2 = 25;

    n3 = n2;

    for (int i = 1; i <= n1; i++) {
        // for (int i = 1; (i <= n1) && (i <= n2); ++i) { - does not work double condition
        // Checks if i is factor of both integers
        if (n1 % i == 0 && n2 % i == 0) {
            gcd = i;
        }
    }

    return 0;
}