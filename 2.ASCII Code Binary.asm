
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100H

.DATA
    INPUT_MSG DB "Type a character :$"
    OUTPUT_MSG_1 DB 0AH,0DH, "THE ASCII CODE OF"
    OUTPUT DB ?
    OUTPUT_MSG_2 DB "In binary is $"
    COUNT_MSG_1 DB 0AH, 0DH, "THE NUMBER OF 1 BIT IS "
    COUNT DB ?
    COUT_MSH_2 DB "$"
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,INPUT_MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV OUTPUT, AL
    MOV CL,0
    MOV CH,0
    MOV AH,9
    LEA DX,OUTPUT_MSG_1
    INT 21H
    
    TOP:
        CMP CL,8
        JE END_
        INC CL
        SHL BL,1
        JC COUNTONE
        MOV AH,2
        MOV DL,30H
        INT 21H
        
        JMP TOP
    COUNTONE:
        MOV AH,2
        MOV DL,31H
        INT 21H
        
        INC CH
        JMP TOP
    END_:
    ADD CH,30H
    MOV COUNT,CH
    
    MOV AH,9
    LEA DX,COUNT_MSG_1
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
        




