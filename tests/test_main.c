#include <assert.h>
#include <string.h>
#include "hello.h"

int main(void) {
    const char* s = hello();
    assert(s != NULL);
    assert(strcmp(s, "hello, world") == 0);
    return 0; // all good
}
