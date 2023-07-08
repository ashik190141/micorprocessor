 data segment
    n1 DW 104
    n2 DW 12
    gcd DW ?
 data ENDS
 
 code SEGMENT
 assume CS: code,DS:data
 
 START: MOV AX,DATA
 MOV DS,AX
 MOV AX,n1
 MOV BX,n2
 
 UP: CMP AX,BX
 JE EXIT
 JB EXCG
 
 UP1:MOV DX,0H
 DIV BX
 CMP DX,0
 JE EXIT
 MOV AX,DX
 JMP UP
 
 EXCG:XCHG AX,BX
 JMP UP1
 EXIT:MOV gcd,BX
 MOV AH,2
 MOV DX,GCD
 ADD DX,30H
 INT 21H 
 MOV AH,4CH
 INT 21H
 
 code ENDS
 END START
 
                   