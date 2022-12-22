CROSS_COMPILE?=riscv64-unknown-elf-
GCC=$(CROSS_COMPILE)gcc

%.elf: %.S linker.ld
	$(GCC) -Tlinker.ld $< -nostdlib -static -Wl,--no-gc-sections -o $@
