#include <stdio.h>

int main() {
    int n1, n2, minMultiple, lcm;

    n1 = 10;
    n2 = 25;

    // maximum number between n1 and n2 is stored in minMultiple
    // minMultiple = (n1 > n2) ? n1 : n2; - does not work
    minMultiple = 10;

    // Always true
    while(1)
    {
        if (minMultiple % n1 == 0 && minMultiple % n2 == 0 )
        {
            lcm = minMultiple;
            break;
        }
        ++minMultiple;
    }
    return 0;
}