#include <stdio.h>

int main() {
   int data[5] = {1, 2, 3, 4, 5}, i, result;

   for(i = 0; i < 5; ++i)
      result = *(data + i);

   return 0;
}