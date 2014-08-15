/* Perform r0=r1+r2 for 64 bit numb*/
	.global _start
_start:
	mov r2, #0xFFFFFFFF     @ Largest unsigned int
	mov r3, #0x1            @ Next 4 bytes with just first bit
	mov r4, #0xFFFFFFFF	@ Same as r2
	mov r5, #0xFF           @ Same as r3 but with a whole byte
	adds r0, r2, r4         @ Add low int, set flags
	adcs r1, r3, r5         @ Add high bytes with carry
	mov r7, #1              @ Exit through syscall
	swi 0
