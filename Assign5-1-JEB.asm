	; CSCI250 Assignment 5-1
	; Joseph Black
	.ORIG x3000
	
LEA R0, #10	; I tried using the label "x", but it wasn't working
LEA R1, y	; 
LEA R2, p	;
STR R0, R2, #0	; Stores address of x to p
AND R3, R3, #0	;
ADD R3, R3, #5	; Puts #5 in R3
STR R3, R0, #0	; Stores #5 to x
LD  R4, #3		; Puts value at x into R4 (again I couldn't use "x")
STR R4, R1, #0	; Stores x to y
ADD R3, R3, #3	; Adds #3 to R3 (#5)
STI R3, p		; Stores #8 to mem(mem(p))
x	.BLKW 1
y	.BLKW 1
p	.BLKW 1
.END