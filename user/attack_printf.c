#include <ulib.h>
#include <stdio.h>
#include <file.h>
#include <unistd.h>

int main() {
    int fp;
    char buff[36];
    /* the content of this file is "%x %x %x %x", it should be newed by band */
    fp = open("attack_printf_input.txt", O_RDONLY);
    read(fp, buff, 10);
    close(fp);
    cprintf("\n===============\n");
    cprintf(buff);
    char temp1[10] = "yuanshen!";
    cprintf("\n===============\n");
    char temp3[100] = "mingrifangzhou";
    cprintf(buff);
    char temp[10] = "qidong!";
    cprintf("\n===============\n");
    return 0;
}