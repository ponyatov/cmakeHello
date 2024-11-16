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
