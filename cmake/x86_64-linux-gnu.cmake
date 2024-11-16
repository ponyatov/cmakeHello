# host compiler
set(CMAKE_SYSTEM_NAME Linux)
set(TOOLCHAIN_PREFIX  x86_64-linux-gnu)

# cross compilers to use for C and C++
set(CMAKE_C_COMPILER   ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_RC_COMPILER  ${TOOLCHAIN_PREFIX}-windres)
