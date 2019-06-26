#include <stdio.h>

int main() {
    long long n;
    int count = 0;

    n = 132131;

    while(n != 0) {
        n /= 10;
        ++count;
    }
}