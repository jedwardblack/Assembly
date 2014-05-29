	; CSCI250 Assignment 5-3
	; Joseph Black
	.ORIG x3000
	
LEA R0, apple	;
LEA R1, ptr		;
LEA R2, ind		;
STR R1, R2, #0	;
STI R0, ind		;
LEA R3, temp	;
LDI R4, ind		;
STR R4, R3, #0	;
AND R5, R5, #0	;
ADD R5, R5, #12	;
STI	R5, temp	;
apple	.BLKW 1
ptr		.BLKW 1
ind		.BLKW 1
temp	.BLKW 1
.END