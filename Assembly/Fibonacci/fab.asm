[ORG 0X100] 

	MOV CX,10;
	MOV AX,0;
        MOV bX,1;
	
	Li:
	ADD AX,bx
        mov dx,ax
        mov ax,bx
        mov bx,dx
	LOOP Li

MOV AX, 0X4C00;
INT 0X21