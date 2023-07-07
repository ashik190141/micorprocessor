.model small
.stack 100h
.data
a db 'Input form user: $'
b db 10,13,'Output form system: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,2
    mov dl,bl
    int 21h
    main endp
ret