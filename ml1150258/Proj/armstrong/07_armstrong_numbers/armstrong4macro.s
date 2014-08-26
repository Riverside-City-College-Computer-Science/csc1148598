# inputs
#   r0 - number
#
# outputs
#   r0 - armstrong number
#
# local r4, r5, r6, r7, r8

.equ ten,10
.equ hundred,100
.equ thousand,1000
.equ ten_thousand,10000

number .req r4
width .req r5
digit .req r6
current .req r7
armstrong .req r8

.macro armstrong_digit a, b
	ldr	current, =\a
	mov	digit, #0
_start\@:
	cmp	number, current
	blt	_end\@
	
	teq	width, #0			@ and only set width if it is currently unset
	moveq	width, #\b
	add	current, current, #\a
	add	digit, digit, #1
	b	_start\@
_end\@:
	add	number, number, #\a
	sub	number, number, current
	mov	r0, digit
	mov	r1, width
	bl	_power
	add	armstrong, r0, armstrong
.endm

.globl _armstrong
.align 2
        .text
_armstrong:
        nop
        stmfd   sp!, {r4, r5, r6, r7, r8, lr}   @ save variables to stack

        mov     number, r0			@ copy passed parameter to working number
	cmp	number, #ten			@ exit unless number > 10
	blt	_end

        ldr     current, =ten_thousand		@ exit unless number < 10000
	cmp	number, current
	bge	_end

	mov	width, #0			@ initialise
	mov	armstrong, #0

	armstrong_digit thousand 4
	armstrong_digit hundred 3
	armstrong_digit ten 2

	mov	r0, number			@ then add in the trailing digits
	mov	r1, width
	bl	_power
	add	armstrong, r0, armstrong

	mov	r0, armstrong			@ and copy the armstrong number back to r0 for return
_end:
        ldmfd   sp!, {r4, r5, r6, r7, r8, pc}   @ restore state from stack and leave subroutine
