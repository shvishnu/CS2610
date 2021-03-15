%include	"io.mac"
	
.CODE

.STARTUP
	rdtsc
	PutLInt         EDX
	PutCh           ','
	PutLInt         EAX
	PutCh           ','
	GetLInt         EDX			        ;input string
	call            fibonacci
	PutLInt         EAX    
	PutCh           ','
	rdtsc
	PutLInt         EDX
	PutCh           ','
	PutLInt         EAX   
	nwln  
.EXIT

fibonacci:
	push            EBX
	cmp             EDX, 2
	jl              base_case
	dec             EDX
	call            fibonacci
	mov             EBX, EAX
	dec             EDX
	call            fibonacci
	add             EAX, EBX
	add             EDX, 2
	jmp             fib_end
	
base_case:
	mov             EAX, EDX
	
fib_end:
	pop             EBX
	ret
	
