cmake_minimum_required(VERSION 3.22)

project(hello LANGUAGES C CXX ASM)

set(INC ${CMAKE_SOURCE_DIR}/inc)
set(SRC ${CMAKE_SOURCE_DIR}/src)
set(TMP ${CMAKE_SOURCE_DIR}/tmp)

file(GLOB_RECURSE C "${SRC}/*.c*")
file(GLOB_RECURSE H "${INC}/*.h*")

include_directories(${INC} ${TMP})

add_executable(${CMAKE_PROJECT_NAME} ${C} ${H})
