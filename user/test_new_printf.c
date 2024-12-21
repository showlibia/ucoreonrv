#include <stdio.h>

int main() {
    int n;
    cprintf("012345%n\n", &n);
    cprintf("%d\n", n);
    return 0;
}