/*
http://raspberrypiassembly.wordpress.com/page/2/

This program looks at one way to print a number to the screen using assembly. For demonstration purposes, the number is hard-coded into the program.

Since the computer stores numbers in binary, this program converts the number into a series of denary digits and then displays these digits to the screen.

The program also makes use of hexadecimal since this is a convenient way for programmers to represent binary data.

When we print to the screen, we use ascii codes. Just as a reminder, the ascii code for 0 is 48 (or 0x30 in hex). We find the ascii code for a digit by adding 48. For instance, the ascii code for ‘7’ is 55 (or 0x37).

When we perform the conversion from binary to denary, the digits are produced in reverse order. It is convenient to push each digit (or its ascii code) onto the stack. We can then pop them off and print them in the correct order.

The Stack

Here’s the command we use to push something onto the stack in this program:

stmfd	sp!, {r0}

We are SToring values to Memory in a Descending stack.

The ‘f’ indicates a “Full” stack. This means that the stack pointer (sp) will point to the last occupied address. This suits us as we can load r1 with the sp in order to print the character who’s ascii code is held there.

The exclamation mark in “stmfd sp!” means that we are writing back the new stack pointer value, thus keeping track of the correct position of the top of the stack. This is similar to the write-back we used when walking over a list of numbers in our maximum program.

The curly braces hold the registers that we want to push onto the stack. In this simple example, we are only pushing the contents of r0.

The command to pop items off the stack is almost identical, but now we are LoaDing from Memory.

There are one or two other new commands in this program. When we decrement the character counter with “subs”, the ‘s’ suffix also sets the status flags. This means we can do without a “cmp” instruction and the “ble exit” line will take us to the exit label if the subtraction caused the zero flag to be set.

We use a logical OR as a more efficient way to add 48 to our digits. For example:

110000	(48)
001001	(9)
111001	result of logical OR (57)

*/
@ number.s
@ test program to print a number.
.section	.data
num:                        @ create a variable
	.long 12345 
.globl	_start
_start:
	ldr r3, =num	    @ load r3 with address of num
	ldr r4, [r3]	    @ load r4 with the number
	mov r5, $0 	    @ set counter to 0
loop:
	cmp r4, $9          @ if r4 <= 9 ...
	ble print           @ print digit
	sub r4, r4, $10     @ subtract 10 from r4
	add r5, r5, $1      @ add one to counter
	bal loop            @ back to top of loop
print:	
	add r0, r4, $0x30   @ load r0 with r4 + 48 (ascii code)
	bl PrintChar        @ call PrintChar function
	cmp r5, $0          @ if the counter is zero ...
        beq exit            @ we are done
        mov r4, r5          @ load r4 with counter
	mov r5, $0          @ set counter to zero
	bal loop            @ back to top of loop
exit:
	mov 	r0, $0xA	@ print a newline
	bl	PrintChar
	mov	r0, $0		@ exit
	mov	r7, $1
	svc	$0

PrintChar:
	stmfd	sp!, {r0-r5, r7, lr}	@ push registers onto stack
	mov	r1, sp			@ stack pointer holds char value
	mov	r0, $1			@ stdout
	mov	r2, r0			@ one char
	mov	r7, $4			@ write syscall
	swi	$0                      @ wake kernel
	ldmfd	sp!, {r0-r5, r7, pc}	@ restore registers

.end