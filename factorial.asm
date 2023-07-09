org 100h    

INCLUDE "EMU8086.INC"

MOV DX, OFFSET MAIN    
MOV AH, 9              
INT 21H                

CALL SCAN_NUM          
MOV NUM, CX            

MOV BX, 1              
MOV AX, 1              
JMP LABEL1             

LABEL1:
MUL BX                 
INC BX                 
CMP BX, NUM            
JG EXIT                
JMP LABEL1 

EXIT:
LEA SI, MSG            
CALL PRINT_STRING      
CALL PRINT_NUM         
RET                    

NUM DW ?               

MAIN DB "FACTORIAL CALCULATOR. NUM: $"   

MSG DB 13,10, "THE RESULT IS: ", 0       

DEFINE_PRINT_NUM       
DEFINE_SCAN_NUM        
DEFINE_PRINT_NUM_UNS   
DEFINE_PRINT_STRING    