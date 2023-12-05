extrn Current_X_Check:WORD
extrn Current_y_Check:WORD
extrn candrow:byte
public UP_CHECK_PRO
.model small
.code

UP_CHECK_PRO proc far 
MOV CX,Current_X_Check;FOR CHECK UP TO STOP CHECK
MOV BX,Current_X_Check;START POINT 
ADD CX,10D;WIDTH OF CAR

UP_CHECK:
mov candrow,0d
MOV AX,Current_y_Check;ALWAYS
cmp ax,0
jz LABEL_2

SUB AX,1D
MOV DX,320D ;ROW *320+COLUMN
MUL DX
ADD AX,BX
MOV DI,AX          ;CHECK
mov al,0h
scasb
je c
JMP LABEL_2
c:
mov candrow,1d
ADD BX,1
CMP BX,CX
JNZ UP_CHECK
LABEL_2:
RET
 UP_CHECK_PRO endp
 end