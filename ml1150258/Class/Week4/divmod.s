/*
	Dr. Mark E. Lehr
	Sept 16th, 2014
	Purpose:  Inefficient technique for calculating a/b and a%b
	a/b -> counter contained in r0
	a%b -> remainder contained in r1
	a -> contained in r2
	b -> contained in r3
 */
 
.text
.global main
main:
    /* Initialize */
    mov r2, #111     /* a=111 */
    mov r3, #5       /* b=5 */
	mov r0, #0       /* r0=0 -> counter */
	mov r1, r2       /* r1=a=111 */
	/* Check condition where a<b then a%b=a a/b=0
	cmp  r1, r3      
	blt  end
repeat_subtraction:
	add r0, r0, #1   /* increment r0 */
	sub r1, r1, r3   /* r1=r1-r3 */
	cmp r1, r3        
    blt end          /* end the program solution reached */
	b repeat_subtraction  /* repeat the subtraction */
end:
    bx lr
	