;Implement ASM program to add array of numbers present at 4000 0004H only if it is positive, and store it in 4000 000CH
	
	AREA PROGRAM, CODE, READONLY
	ENTRY
MAIN
	LDR R0,VALUE ;loads adress of the value to R0
	LDR R3,COUNT ;loads adress of the count into R3
	LDR R4,[R3] ;loads count into R4
LOOP
	LDR R1,[R0] ;loads the content of address of R0 into R1
	CMP R1,#0 ;comparing content of R1 to 0 to check for negative number
	BMI JUMP ;if the number in R1 is negative then it goes to jump
	ADD R2,R1 ;else add R2 and R1 and stores in R2
	ADD R0,#4 ;incrementing the address in R0 to fetch next element of array
	ADD R4,#-1 ;decrementing counter
	CMP R4,#0 ;checks if R4 that is counter is 0 or not
	BEQ DONE ;if counter is 0 goto done
	B LOOP ;else go to loop
JUMP
	ADD R0,#4 ;incrementing address
	ADD R4,#-1 ;decrementing counter
	B LOOP ;go to loop

DONE
	LDR R3,RESULT ;laoding address to store result
	STR R2,[R3] ;storing result
STOP B STOP;



VALUE DCD 0X40000004;
COUNT DCD 0X40000000;
RESULT DCD 0X400000C;
END