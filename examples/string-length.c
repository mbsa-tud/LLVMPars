#include <stdio.h>
#include <string.h>

int main() {
    char s[1000], i;

    strcpy(s, "nqfwbfwiebfeuifbewuibfuwebwqqqqq");

    for(i = 0; s[i] != '\0'; ++i);  // i - length

    return 0;
}