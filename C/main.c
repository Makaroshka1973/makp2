#include <stdio.h>

int main(void) {
    printf("Testing software for input. Write smth to kb pls.\n");

    while (1) {
        char c = getchar();
	printf("%c", c);
	if (c == '\n') {
	    break;
	}	
    }

    return 0;
}
