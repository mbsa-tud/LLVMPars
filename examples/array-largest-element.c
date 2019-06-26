#include <stdio.h>

int main() {
    int i, n = 10;
    float arr[100] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}, result;

    // Loop to store largest number to arr[0]
    for (i = 1; i < n; ++i) {
       // Change < to > if you want to find the smallest element
       if (arr[0] < arr[i])
           arr[0] = arr[i];
    }
    result = arr[0];

    return 0;
}