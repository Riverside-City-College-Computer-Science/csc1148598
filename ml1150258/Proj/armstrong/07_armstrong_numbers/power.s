# this subroutine returns the passed digit to the passed power
#
# inputs
#   r0 - digit
#   r1 - power 
#
# outputs
#   r0 - digit ** power
#
# locals
#   r4
.globl _power
.align 2
        .text
_power:
	nop
        stmfd	sp!, {r4, lr}		@ save variables to stack

	subs	r1, r1, #1		@ leave unless power > 1
	ble	_power_end

	mov	r4, r0			@ copy digit
_power_loop_start:
	mul	r0, r4, r0		@ raise to next power
	subs	r1, r1, #1		
	beq	_power_end		@ leave when done
	b	_power_loop_start	@ next iteration
_power_end:
        ldmfd   sp!, {r4, pc}		@ restore state from stack and leave subroutime
