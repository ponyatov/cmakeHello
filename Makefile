# var
MODULE = $(notdir $(CURDIR))

# cross
HW  = STM32F407G-DISC1
CPU = STM32F407VGT

# tool
CF    = clang-format -style=file -i
CMAKE = /usr/bin/cmake

# dirs
CWD = $(CURDIR)
TMP = $(CWD)/tmp

# src
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)
F += $(wildcard lib/$.ini) $(wildcard lib/$.f)

# all
.PHONY: all run
all:
run: disco

# format
.PHONY: format
format: tmp/format_cpp
tmp/format_cpp: $(C) $(H)
	$(CF) $? && touch $@

.PHONY: doxy
doxy: .doxygen
	rm -rf doc/html ; doxygen $< 1>/dev/null

GANE = hw/STM32F407G-DISC1/cmake/gcc-arm-none-eabi.cmake
ANEG = cmake/arm-none-eabi-gcc.cmake
.PHONY: diff $(ANEG).patch
diff: $(ANEG).patch
$(ANEG).patch: $(GANE) $(ANEG)
	diff -u $^ > $@ ; diff --color -u $^

.PHONY: disco
disco:
	rm -rf $(TMP)/$(HW)
	$(CMAKE) -DCMAKE_VERBOSE_MAKEFILE=ON \
		-S$(CWD) -B$(TMP)/$(HW) --preset=$(HW)
	$(CMAKE) --build $(TMP)/$(HW)

FLASH = 0x08000000

.PHONY: gdb
gdb: $(TMP)/$(HW)/$(MODULE).elf
	st-util --listen_port 12345 &
	gdb-multiarch -q -x .gdbinit tmp/STM32F407G-DISC1/hello.elf

.PHONY: flash
flash: $(TMP)/$(HW)/$(MODULE).bin
	st-flash --connect-under-reset write $< $(FLASH)
%.bin: %.elf
	arm-none-eabi-objcopy -O binary $< $@
