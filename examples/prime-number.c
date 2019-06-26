#include <stdio.h>
#include <stdbool.h>

int main()
{
    int n, i, flag = 0;
    bool result;

    n = 17;

    for(i = 2; i <= n / 2; ++i) {
        // condition for nonprime number
        if (n % i == 0) {
            flag = 1;
            break;
        }
    }

    if (flag == 0)
        result = true;
    else
        result = false;

    return 0;
}