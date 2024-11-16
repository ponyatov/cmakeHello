cmake_minimum_required(VERSION 3.22)

project(hello LANGUAGES C CXX ASM)

set(CWD ${CMAKE_SOURCE_DIR})
set(INC ${CWD}/inc)
set(SRC ${CWD}/src)
set(TMP ${CWD}/tmp)

file(GLOB_RECURSE A
    "${CWD}/hw/${HW}/*.s"
)
file(GLOB_RECURSE C
    "${SRC}/*.c*"
    "${CWD}/hw/${HW}/Core/Src/*.c*"
    "${CWD}/hw/${HW}/Drivers/STM32F4xx_HAL_Driver/Src/*.c*"
)
file(GLOB_RECURSE H
    "${INC}/*.h*"
    "${CWD}/hw/${HW}/Core/Inc/*.h*"
    "${CWD}/hw/${HW}/Drivers/CMSIS/Include/*.h*"
    "${CWD}/hw/${HW}/Drivers/CMSIS/Device/ST/STM32F4xx/Include/*.h*"
    "${CWD}/hw/${HW}/Drivers/STM32F4xx_HAL_Driver/Inc/*.h*"
)

include_directories(
    ${INC} ${TMP}
    "${CWD}/hw/${HW}/Core/Inc"
    "${CWD}/hw/${HW}/Drivers/CMSIS/Include"
    "${CWD}/hw/${HW}/Drivers/CMSIS/Device/ST/STM32F4xx/Include"
    "${CWD}/hw/${HW}/Drivers/STM32F4xx_HAL_Driver/Inc"
)

add_compile_definitions(
# ${CMAKE_PROJECT_NAME} INTERFACE
	USE_FULL_LL_DRIVER
	HSE_VALUE=25000000
	HSE_STARTUP_TIMEOUT=100
	LSE_STARTUP_TIMEOUT=5000
	LSE_VALUE=32768
	EXTERNAL_CLOCK_VALUE=12288000
	HSI_VALUE=16000000
	LSI_VALUE=32000
	VDD_VALUE=3300
	PREFETCH_ENABLE=1
	INSTRUCTION_CACHE_ENABLE=1
	DATA_CACHE_ENABLE=1
	STM32F407xx
    $<$<CONFIG:Debug>:DEBUG>
)

message("-- toolchain: " ${CMAKE_TOOLCHAIN_FILE})
message("--   startup: " ${A})
add_executable(${CMAKE_PROJECT_NAME} ${C} ${H} ${A})
