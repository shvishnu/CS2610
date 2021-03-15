; Assembly language program to find target in an array using binary search CS19B045_1.asm
;
;		Objective: To find the target in array
; 		    Input: n, array, target value (32 bit)
;		   Output: boolean 1 if element is present else 0

%include	"io.mac"

.DATA
	MAX_SIZE         equ			101			; Maximum size of the array
.UDATA
	array            resd                    MAX_SIZE		; Define array
.CODE
.STARTUP
	GetLInt          ECX						; get length of array in ecx
	push             ECX						; push length into stack
	mov              EBX, array					; move address of array into ebx
	
array_loop:
	GetLInt		 EAX						; get array element
	mov	         [EBX], EAX					; store it in the next position
	add              EBX, 4						; update ebx to next position in array
	loop             array_loop					; loop with ecx
	
exit_loop:
	GetLInt          EDX						; get element to be searched for
	push             EDX						; push it into stack
	push             array						; push array into stack
	call             binary_search     				; proc call
	
.EXIT

binary_search:
	pushad            						; store all registers
	mov              EBP, ESP					; base pointer
	mov              EBX, [EBP+36]					; get array in ebx
	mov              EDX, [EBP+40]					; get element in edx
	mov              ECX, [EBP+44]					; get array length in ecx
	xor              EAX, EAX					; eax = 0 (l=0)
	dec              ECX						; ecx = n-1 (r=n-1)
	
while_loop:
	cmp              EAX, ECX					; compare l and r
	jg               not_found					; element not found
	mov              ESI, EAX					; mid = l
	add              ESI, ECX					; mid += r
	shr              ESI, 1						; mid = (l+r)/2
	cmp              EDX, [EBX+4*ESI]				; compare a[mid] and target	
	je               found						; if found, jmp to found:
	jl               left_half					; search in left half
	
right_half:
	mov  	         EAX, ESI					; eax = mid
	inc              EAX						; l = mid-1
	jmp              while_loop
	
left_half:
	mov              ECX, ESI					; ecx = mid
	dec              ECX  						; r = mid-1
	jmp              while_loop
	
not_found:
	sub              EAX, EAX					; put 0 in eax if element not found
	jmp              return
	
found: 	
	;PutLInt          ESI						; index of found element
	mov              EAX, 1						; put 1 in eax if element found
	jmp              return
return:
	PutLInt          EAX
	popad 
	ret
