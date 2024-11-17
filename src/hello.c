#include "hello.h"

#ifdef __linux__
int main(int argc, char *argv[]) {  //
#else
void hello(int argc, char *argv[]) {  //
#endif
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
}

void arg(int argc, char *argv) {  //
    fprintf(stderr, "arg[%i] = <%s>\n", argc, argv);
}