.model small
.stack 100h

.data
    termCount DW 10
    fibonacciSeries DW 10 dup(?)

.code
main PROC
    mov ax, @data
    mov ds, ax

    mov cx, termCount
    mov si, offset fibonacciSeries

    mov dx, 0   ; First term
    mov bx, 1   ; Second term

    mov [si], dx
    add si, 2

    mov [si], bx
    add si, 2

    calculate:
        add dx, bx
        mov [si], dx
        add si, 2

        mov dx, bx
        mov bx, [si-2]

        loop calculate

    mov cx, termCount
    mov si, offset fibonacciSeries

    print:
        mov ax, [si]
        call PrintNumber

        add si, 2

        mov dl, ' '  ; Display a space character
        mov ah, 02h
        int 21h

        loop print

    mov ax, 4C00h
    int 21h
main ENDP

PrintNumber PROC
    push ax
    push bx
    push cx
    push dx

    xor cx, cx  ; Set cx to 0 (count of digits)
    mov bx, 10  ; Divisor for division by 10

    convert:
        xor dx, dx  ; Clear dx
        div bx      ; Divide ax by bx
        add dl, '0' ; Convert remainder to ASCII character

        push dx     ; Push the digit onto the stack
        inc cx      ; Increment digit count

        test ax, ax ; Check if quotient is zero
        jnz convert ; If not zero, continue division

    printLoop:
        pop dx      ; Pop the digit from the stack
        mov ah, 02h ; Function 02h - Print character
        int 21h

        loop printLoop

    pop dx
    pop cx
    pop bx
    pop ax

    ret
PrintNumber ENDP

END main