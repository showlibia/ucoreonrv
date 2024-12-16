#include <string.h>
#include <stdio.h>
#include <ulib.h>

int main() {
    char s1[1];
    char s2[5] = "ABCD";

    cprintf("defination:\n");
    cprintf("address of s1 == %p\n", s1);
    cprintf("address of s2 == %p\n", s2);
    for (int i = 0; i < 16; i++) {
        cprintf("%c ", s1[i]);
    }

    cprintf("\nstrcpy:\n");
    strcpy(s1, "wwwwwwwwwwwwwwwwww");
    cprintf("s1 == %s\n", s1);
    cprintf("s2 == %s\n", s2);

    return 0;
}