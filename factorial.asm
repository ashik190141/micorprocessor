org 100h    ; Set the origin of the code to 100h

INCLUDE "EMU8086.INC"   ; Include the EMU8086 library

MOV DX, OFFSET MAIN    ; Move the offset address of the MAIN string to DX
MOV AH, 9              ; Set the print function number to 9 (print string)
INT 21H                ; Call the interrupt to print the string

CALL SCAN_NUM          ; Call the SCAN_NUM subroutine to read an integer from the user
MOV NUM, CX            ; Move the user input (in CX) to the NUM variable

MOV BX, 1              ; Initialize BX with 1
MOV AX, 1              ; Initialize AX with 1
JMP LABEL1             ; Jump to LABEL1

LABEL1:
MUL BX                 ; Multiply AX by BX (AX = AX * BX)
INC BX                 ; Increment BX by 1
CMP BX, NUM            ; Compare BX with NUM
JA EXIT                ; If BX is greater than NUM, jump to EXIT
JMP LABEL1             ; Otherwise, jump back to LABEL1 for the next iteration

EXIT:
LEA SI, MSG            ; Load the offset address of the MSG string to SI
CALL PRINT_STRING      ; Call the PRINT_STRING subroutine to print the string
CALL PRINT_NUM         ; Call the PRINT_NUM subroutine to print the factorial result
RET                    ; Return from the main program

NUM DW ?               ; Define a word variable named NUM to store the user input

MAIN DB "FACTORIAL CALCULATOR. NUM: $"   ; Define a string named MAIN for printing

MSG DB 13,10, "THE RESULT IS: ", 0        ; Define a string named MSG for printing the result

DEFINE_PRINT_NUM       ; Macro definition for printing a number
DEFINE_SCAN_NUM        ; Macro definition for scanning an integer
DEFINE_PRINT_NUM_UNS   ; Macro definition for printing an unsigned number
DEFINE_PRINT_STRING    ; Macro definition for printing a string
