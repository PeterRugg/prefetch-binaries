SECTIONS
{
    ROM_BASE = 0xf0000000;

    . = ROM_BASE;
    .text : { *(.text.*) }
    .data : { *(.data.*) }
}
