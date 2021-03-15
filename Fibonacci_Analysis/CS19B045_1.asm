%include	"io.mac"
	
.CODE

.STARTUP
	rdtsc
	PutLInt         EDX
	PutCh           ','
	PutLInt         EAX
	PutCh           ','
	GetLInt         EDX
	
	mov             EBX, 0
	mov             EAX, 1
	mov             ECX, 1
	cmp             EDX, 0
	je              zero
for_loop:
	cmp             ECX, EDX
	jge             loop_end
	push            EAX
	add             EAX, EBX
	pop             EBX
	inc             ECX
	jmp             for_loop
loop_end:
	PutLInt         EAX
	PutCh           ','
	jmp             done
zero:
	PutLInt         EBX
	PutCh           ','
done:
	rdtsc
	PutLInt         EDX
	PutCh           ','
	PutLInt         EAX
	nwln

.EXIT

	
