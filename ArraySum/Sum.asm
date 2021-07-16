; Assembly language program to find the sum of 32-bit array of integers Sum.asm
;
;		Objective: To add n numbers
; 		   Inputs: Size of array and the list of integers
;		   Output: Sum of the list of integers

%include	"io.mac"

.CODE
	.STARTUP
	mov		EAX, 0		;initialize eax with zero
	GetLInt  	ECX
loop_start:
	GetLInt 	EBX		;get the current element of the array
	add		EAX, EBX	;add to eax
	loop		loop_start
loop_end:
	PutLInt 	EAX		;display the sum from eax
.EXIT
