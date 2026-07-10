#include <stdio.h>

int main(void) {
    char string[100];
    printf("Write text\n");
    fgets(string, 100, stdin);
    while (1) {
        printf("%s", string);
    }
    return 0;
}
