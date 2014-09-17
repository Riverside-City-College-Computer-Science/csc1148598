/*
	CSC 11 Notes on Branching
	
	CPSR (for Current Program Status Register). This register is a bit special and directly modifying 
	it is out of the scope of this chapter. That said, it keeps some values that can be read and updated 
	when executing an instruction. The values of that register include four condition code flags called 
	N (negative), Z (zero), C (carry) and V (overflow). 
	These four condition code flags are usually read by branch instructions. Arithmetic instructions 
	and special testing and comparison instruction can update these condition codes too if requested.

The semantics of these four condition codes in instructions updating the cpsr are roughly the following

N will be enabled if the result of the instruction yields a negative number. Disabled otherwise.
Z will be enabled if the result of the instruction yields a zero value. Disabled if nonzero.
C will be enabled if the result of the instruction yields a value that requires a 33rd bit to be fully represented. 
For instance an addition that overflows the 32 bit range of integers. There is a special case for C and subtractions 
where a non-borrowing subtraction enables it, disabled otherwise: subtracting a larger number to a smaller one 
enables C, but it will be disabled if the subtraction is done the other way round.
V will be enabled if the result of the instruction yields a value that cannot be represented in 32 bits two’s complement.


EQ (equal) When Z is enabled (Z is 1)
NEQ (not equal). When Z is disabled. (Z is 0)
GE (greater or equal than, in two’s complement). When both V and N are enabled or disabled (V is N)
LT (lower than, in two’s complement). This is the opposite of GE, so when V and N are not both enabled or disabled (V is not N)
GT (greather than, in two’s complement). When Z is disabled and N and V are both enabled or disabled (Z is 0, N is V)
LE (lower or equal than, in two’s complement). When Z is enabled or if not that, N and V are both enabled or disabled 
	(Z is 1. If Z is not 1 then N is V)
MI (minus/negative) When N is enabled (N is 1)
PL (plus/positive or zero) When N is disabled (N is 0)
VS (overflow set) When V is enabled (V is 1)
VC (overflow clear) When V is disabled (V is 0)
HI (higher) When C is enabled and Z is disabled (C is 1 and Z is 0)
LS (lower or same) When C is disabled or Z is enabled (C is 0 or Z is 1)
CS/HS (carry set/higher or same) When C is enabled (C is 1)
CC/LO (carry clear/lower) When C is disabled (C is 0)
These conditions can be combined to our b instruction to generate new instructions.
 */
 
.text
.global main
main:
    mov r1, #2       /* r1 ? 2 */
    mov r2, #2       /* r2 ? 2 */
    cmp r1, r2       /* update cpsr condition codes with the value of r1-r2 */
    beq case_equal   /* branch to case_equal only if Z = 1 */
case_different:
    mov r0, #2       /* r0 ? 2 */
    b end            /* branch to end */
case_equal:
    mov r0, #1       /* r0 ? 1 */
end:
    bx lr
	