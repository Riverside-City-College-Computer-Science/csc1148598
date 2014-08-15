/* Perform r0=r1+r2 */
	.global _start
_start:
	mov r1, #50     @ Place 50 into r1
	mov r2, #60     @ Place 60 into r2
	adds r0, r1, r2 @ Add r1+r2
	mov r7, #1      @ Exit through syscall
	swi 0
