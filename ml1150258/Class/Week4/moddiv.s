/*
	Dr. Mark E. Lehr
	Sept 16th, 2014
	Purpose:  Inefficient technique for calculating a/b and a%b
	a/b -> counter contained in r0
	a%b -> remainder contained in r1
	a -> contained in r2
	b -> contained in r3
	flag -> r4 to reverse contents of r0 and r1
 */
 
.text
.global main
main:
	/* Initialize */
	mov r2, #111     /* a=111 */
	mov r3, #5       /* b=5 */
	mov r0, #0       /* r0=0 -> counter */
	mov r1, r2       /* r1=a=111 */
	mov r4, #0       /* if 1 swap r0 and r1 on exit else 0*/
	/* Check condition where a<b then a%b=a a/b=0 */
	cmp  r1, r3      /* compare and leave if less */
	blt  swap
	/* Now just perform repeated subtractions */
repeat_subtraction:
	add r0, r0, #1   /* increment r0 */
	sub r1, r1, r3   /* r1=r1-r3 */
	cmp r1, r3       /* Note: subs won't work above need cmp!!! */
	bge repeat_subtraction       /* repeat the subtraction */
swap:
	/* Exchange r0 and r1 using r5 with a swap if flag set */
	cmp r4, #0
	beq end;
	mov r5, r0
	mov r0, r1
	mov r1, r5
end:
	bx lr
	