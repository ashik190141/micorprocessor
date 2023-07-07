.model small
.stack 100h
.data  
num dw 989H
ans dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,num
    mov bx,ax
    
    lea si,ans
    mov cx,0FH
    and ax,cx
    mov [si],al
    
    mov ax,bx
    mov cx,0F0H
    and ax,cx
    mov cx,04H
    shr ax,cl
    
    mov cx,0AH
    mul cx
    add [si],al
    
    mov ax,bx
    mov cx, 0F00H
    and ax,cx
    mov cx,08H
    shr ax,cl
    mov cx,64H
    mul cx
    clc
    add [si],al
    adc [si+1},ah
    
    mov ax,4C00H
    int 21H
    
    main endp
end main