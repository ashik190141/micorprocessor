.model small
.stack 100H
.DATA
    ARY1 DB 4,6,7,9,4
    SUM DB 0  
    R DB ?
    Q DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,OFFSET(ARY1)
    MOV CX,5
    
    L1:
    MOV DL,[SI]
    ADD SUM,DL
    INC SI
    LOOP L1    
    
    MOV AL,SUM
    MOV AH,0
    
    MOV BL,5
    DIV BL
    
    MOV Q,AL
    MOV R,AH
    
    MOV AH,2
    MOV DL,Q
    ADD DL,30H
    INT 21H