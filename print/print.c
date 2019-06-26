#include <stdio.h>

int print(int i) {
    FILE *fp=fopen("sequence.txt", "a");
	fprintf(fp, "%d\n", i);
    fclose(fp); 

    return 0;
}
