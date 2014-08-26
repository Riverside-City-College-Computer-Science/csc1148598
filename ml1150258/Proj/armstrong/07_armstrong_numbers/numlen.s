# this subroutine returns the size of the passed number
# returns 1 if 0-9
# returns 1 if 10-99
# returns 2 if 100-999
# returns 3 if 1000-9999
# return 0 otherwise
#
# inputs
#   r0 - number
#
# no outputs
#
# local r4, r5, r6, r7, r8

.equ ten,10
.equ hundred,100
.equ thousand,1000
.equ ten_thousand,10000

.equ datum_size,4
.globl _numlen
.align 2
        .text
_numlen:
	nop
        stmfd	sp!, {r4, r5, r6, r7, r8, lr}	@ save variables to stack

	mov	r4, r0
	mov	r1, r0
        mov	r0, #0
        ldr     r5, =ten
        ldr     r6, =hundred
        ldr     r7, =thousand
        ldr     r8, =ten_thousand

	mov	r0, #0
	cmp	r4, #0				@ number of elements must be > 1
	blt	_end

	mov	r0, #0
	cmp	r4, r8
	bge	_end

	mov	r0, #1
	cmp	r4, r5
	blt	_end

	mov	r0, #2
	cmp	r4, r6
	blt	_end

	mov	r0, #3
	cmp	r4, r7
	blt	_end

	mov	r0, #4
_end:
        ldmfd   sp!, {r4, r5, r6, r7, r8, pc}	@ restore state from stack and leave subroutime
