#include <stdio.h>

int main() {
    int n, i;
    float num[100] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}, sum = 0.0, average;

    n = 10;

    for (i = 0; i < n; ++i) {
        sum += num[i];
    }

    average = sum / n;

    return 0;
}