  
.MODEL SMALL
.STACK 100H

.DATA
    DIVIDEND DW 000AH     ; 16-bit number to be divided
    DIVISOR  DB 0002H      ; 8-bit divisor

.CODE
MAIN PROC
    MOV AX, @DATA         ; Initialize DS
    MOV DS, AX

    MOV AX, DIVIDEND      ; Load the dividend into AX
    MOV BL, DIVISOR       ; Load the divisor into BL

    DIV BL                ; Divide AX by BL, quotient stored in AL, remainder in AH

    ; Display the quotient
    ADD AL, 30H           ; Convert the quotient to ASCII
    MOV AH, 30H              ; Display the quotient

    MOV DX,AX
    MOV AH,02H
    INT 21H
    
    MOV AH, 4CH           ; Return control to DOS
    INT 21H
    main endp
end main





