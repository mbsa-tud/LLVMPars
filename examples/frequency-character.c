#include <stdio.h>
#include <string.h>

int main() {
   char str[1000], ch;
   int i, frequency = 0;

   strcpy(str, "nqfwbfwiebfeuifbewuibfuwebwqqqqq");

   ch = 'q';

   for (i = 0; str[i] != '\0'; ++i) {
       if (ch == str[i])
           ++frequency;
   }

   return 0;
}