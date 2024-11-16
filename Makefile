# var
MODULE = $(notdir $(CURDIR))

# tool
CF = clang-format -style=file -i

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
run:
	cmake -S $(CWD) -B $(TMP)/$(MODULE)

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
