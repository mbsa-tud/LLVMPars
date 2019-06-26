#include <stdio.h>
#include <stdbool.h>

int main() {

    int year;
    bool result;

    year = 2018;

    if (year % 4 == 0) {
        if (year % 100 == 0) {
            // year is divisible by 400, hence the year is a leap year
            if (year % 400 == 0)
                result = true;
            else
                result = false;
        }
        else
            result = true;
    }
    else
        result = false;

    return 0;
}