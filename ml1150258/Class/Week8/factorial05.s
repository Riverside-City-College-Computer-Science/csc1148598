
.text

factorial:
    push {r4, lr}       /* Push r4 and lr onto the stack */
    mov r4, r0         /* Keep a copy of the initial value of r0 in r4 */
 
    cmp r0, #0         /* compare r0 and 0 */
    bne is_nonzero     /* if r0 != 0 then branch */
    mov r0, #1         /* r0 ? 1. This is the return */
    b end
is_nonzero:
                       /* Prepare the call to factorial(n-1) */
    sub r0, r0, #1     /* r0 ? r0 - 1 */
    bl factorial
                       /* After the call r0 contains factorial(n-1) */
                       /* Load initial value of r0 (that we kept in r4) into r1 */
    mov r1, r4         /* r1 ? r4 */
    mul r0, r0, r1     /* r0 ? r0 * r1 */
 
end:
    pop {r4, lr}       /* Pop lr and r4 from the stack */
    bx lr              /* Leave factorial */
