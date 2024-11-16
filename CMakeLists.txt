cmake_minimum_required(VERSION 3.22)

project(hello LANGUAGES C CXX ASM)

set(INC ${CMAKE_SOURCE_DIR}/inc)
set(SRC ${CMAKE_SOURCE_DIR}/src)
set(TMP ${CMAKE_SOURCE_DIR}/tmp)

file(GLOB_RECURSE C "${SRC}/*.c*")
file(GLOB_RECURSE H "${INC}/*.h*")

include_directories(${INC} ${TMP})

# include(${CMAKE_SOURCE_DIR}/hw/${HW}/cmake/stm32cubemx/CMakeLists.txt)
add_subdirectory(${CMAKE_SOURCE_DIR}/hw/${HW}/cmake/stm32cubemx)

add_executable(${CMAKE_PROJECT_NAME} ${C} ${H})

message("-- toolchain: " ${CMAKE_TOOLCHAIN_FILE})

# target_compile_definitions(${CMAKE_PROJECT_NAME} INTERFACE 
# 	USE_FULL_LL_DRIVER 
# 	HSE_VALUE=25000000 
# 	HSE_STARTUP_TIMEOUT=100 
# 	LSE_STARTUP_TIMEOUT=5000 
# 	LSE_VALUE=32768 
# 	EXTERNAL_CLOCK_VALUE=12288000 
# 	HSI_VALUE=16000000 
# 	LSI_VALUE=32000 
# 	VDD_VALUE=3300 
# 	PREFETCH_ENABLE=1 
# 	INSTRUCTION_CACHE_ENABLE=1 
# 	DATA_CACHE_ENABLE=1 
# 	STM32F407xx
#     $<$<CONFIG:Debug>:DEBUG>
# )
