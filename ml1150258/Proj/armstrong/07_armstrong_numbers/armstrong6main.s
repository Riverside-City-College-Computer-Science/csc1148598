.equ ten,10
.equ million,1000000

.section	.rodata
	.align	2
string:
	.asciz "armstrong number of %d is %d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	ldr	r5, =ten
	ldr	r6, =million

	mov	r4, r5		@ start with n = 10
_main_loop:
	cmp	r4, r6		@ leave if n = 10_000
	beq	_main_end

	mov	r0, r4		@ call the _armstrong function
	bl	_armstrong

	teq	r0, r4		@ if the armstong value = n print it
	bne	_main_next		@ else skip

	mov	r2, r0
	mov	r1, r4
	ldr	r0, =string	@ store address of start of string to r0
	bl	printf		@ call the c function to display information
_main_next:
	add	r4, r4, #1
	b	_main_loop
_main_end:
	mov	r7, #1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
