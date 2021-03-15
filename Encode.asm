; Assembly language program to encode a given string Encode.asm
;
;		Objective: To encode and print the encoded string
; 		    Input: String to be encoded
;		   Output: Encoded string

;		Encoding: if '0' <= c <'5', c+=5
;			  if '5' <= c <= '9', c-=5

%include	"io.mac"

.UDATA
	input_msg       resb	21			;reserve 21 bytes
	
.CODE
.STARTUP
	GetStr          input_msg, 21			;input string
	mov             EBX, input_msg		;send address of string to ebx
loop_start:
	mov             AL, [EBX]			;copy first character to AL register
	cmp             AL, '5'			;compare current character with '5'
	jge             greater			;jump to greater if character >='5'
lower:
	cmp             AL, '0'			;check if it is a number
	jl              loop_end			;skip if not
	add             AL, '5'-'0'			;add 5 as per encoding
	jmp             loop_end			;go to next iteration if possible
greater:
	cmp             AL, '9'			;check if character is a number
	jg              loop_end			;skip if not
	sub             AL, '5'-'0'			;subtract 5 as per encoding logic
loop_end:
	add             EBX, 0x1			;update eax to move to next character
	PutCh           AL				;print the encoded character
	cmp             [EBX], byte 0			;check if null byte is reached
	jne             loop_start			;iterate again if not
.EXIT
