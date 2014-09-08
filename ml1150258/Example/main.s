/* -- main.s  */
/* This is an example of how to use gcc */
.global main   /* Remember main from c/c++ */
.func main     /* Just like you remember from CSC 5 */
main:          /* Entry to main */
     mov r0,#2 /* Put a 2 into register 0 */
	 bx lr
	 