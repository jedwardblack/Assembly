	; CSCI250 Assignment 5-2
	; Joseph Black
	.ORIG x3000
	
LEA R0, #13	;
LEA R1, y	;
LEA R2, p	;
LEA	R3, q	;
STR R0, R2, #0	; address of x, stored at p
LDR R6, R2, #0	; value of p (address of x), stored to q
ST 	R6, q		;
AND R4, R4, #0	; 
ADD R4, R4, #5	; puts value of #5 in R4
STR R4, R0, #0	; stores #5 at address of x
LDI R5, q		; puts mem(mem(q)) (which is 5) in R5
STR R5, R1, #0	; stores 5 to y
ADD R4, R4, #3	; puts value of #8 in R4
STI R4, p		; stores #8 in mem(p)
x	.BLKW 1
y	.BLKW 1
p	.BLKW 1
q	.BLKW 1
.END