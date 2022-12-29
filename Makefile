CROSS_COMPILE?=riscv64-unknown-elf-
GCC=$(CROSS_COMPILE)gcc

.PHONY: all
all: prefetch_4.elf prefetch_8.elf prefetch_12.elf prefetch_16.elf prefetch_20.elf prefetch_24.elf prefetch_28.elf prefetch_32.elf prefetch_36.elf prefetch_40.elf prefetch_44.elf prefetch_48.elf prefetch_52.elf prefetch_56.elf prefetch_60.elf prefetch_64.elf \
     prefetch_68.elf prefetch_72.elf prefetch_76.elf prefetch_80.elf prefetch_84.elf prefetch_88.elf prefetch_92.elf prefetch_96.elf prefetch_100.elf prefetch_104.elf prefetch_108.elf prefetch_112.elf prefetch_116.elf prefetch_120.elf prefetch_124.elf prefetch_128.elf \
     noprefetch_4.elf noprefetch_8.elf noprefetch_12.elf noprefetch_16.elf noprefetch_20.elf noprefetch_24.elf noprefetch_28.elf noprefetch_32.elf noprefetch_36.elf noprefetch_40.elf noprefetch_44.elf noprefetch_48.elf noprefetch_52.elf noprefetch_56.elf noprefetch_60.elf noprefetch_64.elf \
     noprefetch_68.elf noprefetch_72.elf noprefetch_76.elf noprefetch_80.elf noprefetch_84.elf noprefetch_88.elf noprefetch_92.elf noprefetch_96.elf noprefetch_100.elf noprefetch_104.elf noprefetch_108.elf noprefetch_112.elf noprefetch_116.elf noprefetch_120.elf noprefetch_124.elf noprefetch_128.elf

loop_4.S : loop.S
	cp $^ $@
loop_8.S : loop_4.S loop.S
	cat $^ > $@
loop_12.S : loop_8.S loop.S
	cat $^ > $@
loop_16.S : loop_12.S loop.S
	cat $^ > $@
loop_20.S : loop_16.S loop.S
	cat $^ > $@
loop_24.S : loop_20.S loop.S
	cat $^ > $@
loop_28.S : loop_24.S loop.S
	cat $^ > $@
loop_32.S : loop_28.S loop.S
	cat $^ > $@
loop_36.S : loop_32.S loop.S
	cat $^ > $@
loop_40.S : loop_36.S loop.S
	cat $^ > $@
loop_44.S : loop_40.S loop.S
	cat $^ > $@
loop_48.S : loop_44.S loop.S
	cat $^ > $@
loop_52.S : loop_48.S loop.S
	cat $^ > $@
loop_56.S : loop_52.S loop.S
	cat $^ > $@
loop_60.S : loop_56.S loop.S
	cat $^ > $@
loop_64.S : loop_60.S loop.S
	cat $^ > $@
loop_68.S : loop_64.S loop.S
	cat $^ > $@
loop_72.S : loop_68.S loop.S
	cat $^ > $@
loop_76.S : loop_72.S loop.S
	cat $^ > $@
loop_80.S : loop_76.S loop.S
	cat $^ > $@
loop_84.S : loop_80.S loop.S
	cat $^ > $@
loop_88.S : loop_84.S loop.S
	cat $^ > $@
loop_92.S : loop_88.S loop.S
	cat $^ > $@
loop_96.S : loop_92.S loop.S
	cat $^ > $@
loop_100.S : loop_96.S loop.S
	cat $^ > $@
loop_104.S : loop_100.S loop.S
	cat $^ > $@
loop_108.S : loop_104.S loop.S
	cat $^ > $@
loop_112.S : loop_108.S loop.S
	cat $^ > $@
loop_116.S : loop_112.S loop.S
	cat $^ > $@
loop_120.S : loop_116.S loop.S
	cat $^ > $@
loop_124.S : loop_120.S loop.S
	cat $^ > $@
loop_128.S : loop_124.S loop.S
	cat $^ > $@

prefetch_%.elf: loop_%.S prefetch.S linker.ld
	$(GCC) -DLOOPFILE=\"$<\" -Tlinker.ld prefetch.S -nostdlib -static -Wl,--no-gc-sections -o $@
noprefetch_%.elf: loop_%.S noprefetch.S linker.ld
	$(GCC) -DLOOPFILE=\"$<\" -Tlinker.ld noprefetch.S -nostdlib -static -Wl,--no-gc-sections -o $@

clean:
	rm -rf *.elf loop_*.S
