
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100H
.DATA

CR EQU ODH
LF EQU 0AH

MSG1 DB "Enter a Lowercase Letter : $"
MSG2 DB 0DH,0AH, "In Upper Case Its is: "
CHAR DB ?,"$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL, 20H
    MOV CHAR, AL
    
    LEA DX, MSG2
    MOV AH,9
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    
    
MAIN ENDP
    END MAIN
 




