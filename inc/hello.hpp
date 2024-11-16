/// @defgroup lib lib
/// @{
/// @defgroup libc libc
/// @{
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
/// @}
/// @}

/// @defgroup main main
/// @{
#ifdef __linux__
int main(int argc, char *argv[]);
#else
void hello(int argc, char *argv[]);
#endif
void arg(int argc, char *argv);
/// @}
