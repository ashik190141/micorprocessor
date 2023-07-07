.model small
.stack 100h
.data
    msg1 db 10, 13, 'Enter the first number: $'
    msg2 db 10, 13, 'Enter the second number: $'
    msg_odd db 10, 13, 'The sum is odd.$'
    msg_even db 10, 13, 'The sum is even.$'
    sum db ? ; Variable to store the sum 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Prompt for the first number
    mov ah, 09h
    mov dx, offset msg1
    int 21h
    
    ; Read the first number from the user
    mov ah, 01h
    int 21h
    sub al, 30h ; Convert ASCII to numeric value
    mov bl, al
    
    ; Prompt for the second number
    mov ah, 09h
    mov dx, offset msg2
    int 21h
    
    ; Read the second number from the user
    mov ah, 01h
    int 21h
    sub al, 30h ; Convert ASCII to numeric value
    mov cl, al
    
    ; Add the numbers
    add bl, cl
    mov [sum], bl
    
    ; Check if the sum is odd or even
    mov al, [sum]
    and al, 01h ; check least significant bit
    
    ; Print the result
    cmp al, 0
    je even
    jmp odd
    
even:
    ; Print "The sum is even"
    mov ah, 09h
    mov dx, offset msg_even
    int 21h
    jmp exit
    
odd:
    ; Print "The sum is odd"
    mov ah, 09h
    mov dx, offset msg_odd
    int 21h
    jmp exit
    
exit:
    mov ah, 4ch ; Exit program
    int 21h  
    
    main endp
ret