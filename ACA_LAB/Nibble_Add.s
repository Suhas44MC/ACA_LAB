; Add Nibble N4 and N0 from memory location and store results in 4000000C

	AREA NIBBLE,CODE,READONLY
	ENTRY
START
	LDR R0, VALUE ; load adress of value to R0
	LDR R1,[R0] ; loads content of R0 to R1
	MOV R6,R1 ; move content of R1 to R6
	LDR R3, MASK ; Masking R3 using 0x0000000F
	LDR R2,RESULT ; loads Result adress to R2 ie 0x40000000C where results will be stored. 
	AND R6,R3 ; Masking all other unwanted bits (except N0)

	MOV R5,R1, LSR#16 ; Right shift value of R1 with 16 bits
	LDR R7, MASK ; Masking R7 using 0x0000000F 
	AND R5,R7 ; Masking all other  unwanted bits (except N4)
	ADD R4,R6,R5 ; Add R6 and R5 and sotre it in R4 ie adding N0 and N4 nibbles.
	STR R4,[R2] ; store the result
	
VALUE DCD &40000000
RESULT DCD &4000000C
MASK DCD &0000000F

	END