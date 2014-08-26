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
	mov	digit, #0
	mov	armstrong, #0
	ldr	current, =thousand		@ handle 1000 digit
_thousand_start:
	cmp	number, current
	blt	_thousand_end			@ exit thousand code if none left
	
	mov	width, #4			@ width must be 4
	add	current, current, #thousand	@ bump thousand counter
	add	digit, digit, #1		@ and corresponding digit count
	b	_thousand_start			@ and loop
_thousand_end:
	add	number, number, #thousand	@ need number modulo thousand
	sub	number, number, current
	mov	r0, digit			@ push digit
	mov	r1, width			@ and width
	bl	_power				@ to compute digit **width
	add	armstrong, r0, armstrong	@ and update armstrong number with this value

	ldr	current, =hundred		@ then we do the hundreds as we did the thousands
	mov	digit, #0
_hundred_start:
	cmp	number, current
	blt	_hundred_end
	
	teq	width, #0			@ and only set width if it is currently unset
	moveq	width, #3
_hundred_width:
	add	current, current, #hundred	@ yada yada as thousands above
	add	digit, digit, #1
	b	_hundred_start
_hundred_end:
	add	number, number, #hundred
	sub	number, number, current
	mov	r0, digit
	mov	r1, width
	bl	_power
	add	armstrong, r0, armstrong

	ldr	current, =ten			@ then the tens as the hundred and thousands above
	mov	digit, #0
_ten_start:
	cmp	number, current
	blt	_ten_end
	
	teq	width, #0
	moveq	width, #2
_ten_width:
	add	current, current, #ten
	add	digit, digit, #1
	b	_ten_start
_ten_end:
	add	number, number, #ten
	sub	number, number, current
	mov	r0, digit
	mov	r1, width
	bl	_power
	add	armstrong, r0, armstrong

	mov	r0, number			@ then add in the trailing digits
	mov	r1, width
	bl	_power
	add	armstrong, r0, armstrong

	mov	r0, armstrong			@ and copy the armstrong number back to r0 for return
_end:
        ldmfd   sp!, {r4, r5, r6, r7, r8, pc}   @ restore state from stack and leave subroutine
