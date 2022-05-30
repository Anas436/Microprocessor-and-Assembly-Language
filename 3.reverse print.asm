
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


mov BX, 0800h
mov DS, BX
mov BX, 0000h
mov CX, 0


readwrite:
mov AH, 01h
int 21h

mov [BX], AL

add CX, 1
add BX, 1 

cmp AL, '$'
jg readwrite


mov BX, 0800h
mov DS, BX
mov BX, CX
sub BX, 2

mov AH, 0eh

mov AL, 010
int 10h
mov AL, 013
int 10h

revprinting:
mov AL, [BX]
int 10h
sub BX, 1
sub CX, 1
cmp CX, 1
jg revprinting


ret




