.globl main
        .align 2
        .text
main:
	mov	r0, #112
#	mov	r1, #4
#	mov	r0, #100
#	sub	r0, r1, r2
#	sub	r0, r2, r1
	bl	_armstrong
#	bl	_power

	mov     r7, #1		@ set r7 to 1 - the syscall for exit
	swi     0		@ then invoke the syscall from linux
