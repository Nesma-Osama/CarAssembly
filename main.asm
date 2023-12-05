
extrn login:far
extrn choose:far
EXTRN CAR:FAR
Extrn draw:far
public  chatmes  ,gamemes  ,exemes   ,enterKey ,username,username1,username2,userenter,userenter2,Morethan15,NOTLETTER,InitialPoint,InitialPointMes,continueToSecondPage,InitialNumber
PUBLIC blue_car_back,blue_car_front,blue_car_left,blue_car_right,Blue_velocity,Blue_Current_X,Blue_Current_Y,red_car_back,InitialNumber1,InitialNumber2
PUBLIC red_car_front,red_car_left,red_car_right,Red_velocity,Red_Current_X,Red_Current_Y,img_black,Current_X_Check,Current_y_Check,Current_X,Current_Y,pixelScreen,Track_color,candrow
.model small
.stack 64h
.data
    chatmes              db "To start chatting press F1 $"
    gamemes              db "To start the game press F2 $"
    exemes               db "To end the program press ESC $"
    enterKey             db ?
    username             db 19d,?, 19 dup('$');public
    username1             db  19 dup('$');player2
     username2             db  19 dup('$');player2

    userenter            db "player1 Please enter your name:$"
    userenter2 db         "player2 Please enter your name:$"
    Morethan15           db 'Name Must not excced 15 character $'
    NOTLETTER            DB 'Start with a letter not digit or special character $'
    InitialPoint        db 3d ,?,3 dup('$')
    InitialNumber        db ?                                                          ;initial point as number

    InitialNumber1        db ?                                                          ;initial point as number
    InitialNumber2        db ?                                                          ;initial point as number
    InitialPointMes      db "Initial Points less than 100: $"
    continueToSecondPage db "Press Enter Key to continue$"
    privsecond db ?
    second db 120d
;;car drow
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
     ;; ALL DATA RELATED TO BLUE CAR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
     blue_car_back  DB 200, 29, 30, 30, 30, 30, 30, 30, 28, 200, 200, 28, 30, 30, 30, 30, 30, 30, 29, 224, 200, 151, 28, 30, 30, 30, 30, 28, 174, 200, 200, 223, 223, 152, 23, 24, 174, 224, 223, 200
                    DB 200, 223, 223, 223, 223, 223, 223, 223, 223, 223, 200, 223, 223, 223, 223, 223, 223, 223, 223, 200, 17, 17, 223, 223, 223, 223, 223, 223, 17, 17, 17, 16, 200, 223, 223, 223, 223, 223, 16, 17
                    DB 17, 200, 200, 223, 223, 224, 223, 200, 200, 17, 0, 17, 200, 200, 200, 200, 200, 200, 17, 0
     blue_car_front DB 0, 16, 17, 200, 200, 200, 200, 17, 16, 0, 17, 200, 200, 200, 223, 223, 200, 200, 200, 16, 17, 16, 200, 223, 223, 223, 223, 200, 16, 17, 17, 17, 223, 223, 223, 223, 223, 200, 17, 17
                    DB 200, 200, 223, 223, 223, 223, 223, 223, 200, 200, 200, 200, 223, 223, 223, 223, 223, 223, 200, 200, 200, 223, 223, 153, 24, 23, 152, 223, 223, 200, 200, 174, 28, 30, 30, 30, 30, 28, 151, 200
                    DB 224, 29, 30, 30, 30, 30, 30, 30, 28, 200, 18, 28, 30, 30, 30, 30, 30, 30, 28, 17
     blue_car_left  DB 0, 16, 17, 17, 200, 200, 200, 200, 18, 17, 16, 200, 16, 17, 200, 200, 200, 151, 28, 28, 17, 200, 200, 200, 223, 223, 223, 27, 30, 30, 200, 200, 200, 223, 223, 223, 152, 30, 30, 30
                    DB 200, 223, 200, 223, 223, 223, 23, 30, 30, 30, 200, 223, 200, 223, 223, 223, 24, 30, 30, 30, 200, 200, 200, 223, 223, 223, 153, 30, 30, 30, 17, 200, 200, 200, 223, 223, 223, 28, 30, 30
                    DB 16, 200, 16, 17, 200, 200, 200, 174, 29, 28, 0, 16, 17, 17, 200, 200, 200, 200, 223, 18
     blue_car_right DB 18, 200, 200, 200, 200, 200, 17, 16, 16, 0, 28, 29, 153, 200, 200, 200, 17, 16, 18, 16, 30, 30, 28, 223, 223, 223, 200, 200, 200, 17, 30, 30, 30, 175, 223, 223, 223, 200, 200, 200
                    DB 30, 30, 30, 24, 223, 223, 223, 200, 223, 200, 30, 30, 30, 23, 223, 223, 223, 200, 200, 200, 30, 30, 30, 152, 223, 223, 223, 200, 200, 18, 30, 30, 27, 223, 223, 223, 200, 200, 200, 17
                    DB 28, 28, 151, 200, 200, 200, 17, 16, 200, 16, 17, 17, 200, 200, 200, 200, 17, 16, 16, 0
     Blue_velocity  DW 1                   ; 0 decrease , 1 normal , 2 increase ;;; 0 decrease , 1 normal , 2 increase
     Blue_Current_X DW 145,155                   ;; columns
     Blue_Current_Y DW 145,155
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
     ;; ALL DATA RELATED TO RED CAR
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
     red_car_back   DB 183, 16, 16, 16, 16, 16, 16, 16, 16, 183, 4, 16, 16, 16, 16, 16, 16, 16, 16, 4, 4, 184, 16, 16, 16, 16, 16, 16, 184, 4, 4, 4, 4, 112, 183, 183, 112, 4, 4, 4
                    DB 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 184, 112, 4, 4, 4, 4, 4, 4, 112, 184, 184, 184, 4, 4, 4, 4, 4, 4, 184, 184
                    DB 16, 112, 4, 4, 4, 4, 4, 4, 112, 16, 0, 16, 112, 4, 4, 4, 4, 112, 16, 0
     red_car_front  DB 0, 16, 184, 4, 4, 4, 4, 184, 16, 0, 16, 112, 4, 4, 4, 4, 4, 4, 112, 16, 184, 184, 4, 4, 4, 4, 4, 4, 184, 184, 184, 112, 4, 4, 4, 4, 4, 4, 112, 184
                    DB 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 112, 183, 183, 112, 4, 4, 4, 4, 184, 16, 16, 16, 16, 16, 16, 184, 4
                    DB 4, 16, 16, 16, 16, 16, 16, 16, 16, 4, 183, 16, 16, 16, 16, 16, 16, 16, 16, 183
     red_car_left   DB 0, 16, 16, 16, 4, 4, 4, 4, 4, 183, 16, 112, 184, 112, 4, 4, 4, 184, 16, 16, 16, 4, 4, 4, 4, 4, 4, 16, 16, 16, 112, 4, 4, 4, 4, 4, 112, 16, 16, 16
                    DB 4, 4, 4, 4, 4, 4, 183, 16, 16, 16, 4, 4, 4, 4, 4, 4, 183, 16, 16, 16, 112, 4, 4, 4, 4, 4, 112, 16, 16, 16, 16, 4, 4, 4, 4, 4, 4, 16, 16, 16
                    DB 16, 112, 184, 112, 4, 4, 4, 184, 16, 16, 0, 16, 16, 16, 4, 4, 4, 4, 4, 183
     red_car_right  DB 183, 4, 4, 112, 112, 112, 16, 16, 16, 0, 16, 16, 184, 4, 4, 4, 112, 184, 184, 16, 16, 16, 16, 4, 4, 4, 4, 4, 4, 16, 16, 16, 16, 112, 4, 4, 4, 4, 4, 112
                    DB 16, 16, 16, 183, 4, 4, 4, 4, 4, 4, 16, 16, 16, 183, 4, 4, 4, 4, 4, 4, 16, 16, 16, 112, 4, 4, 4, 4, 4, 112, 16, 16, 16, 4, 4, 4, 4, 4, 4, 16
                    DB 16, 16, 184, 4, 4, 4, 112, 184, 184, 16, 183, 4, 4, 112, 112, 112, 16, 16, 16, 0
     Red_velocity   DW 1
     Red_Current_X  DW 115,125                                                                                                                                                                                            ; column horizontal
     Red_Current_Y  DW 115,125                                                                                                                                                                                            ; row vertical
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     img_black      DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
                    DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
     Current_X      DW 115,125
     Current_Y      DW 115,125


     ;;; Data Added by Nesma
     Current_X_Check dw ?
     Current_y_Check dw ?
     pixelScreen dw 0
     candrow db 0
     ;; Data for Red car

     ;; Data for Blue car

     ;; Data overall

     Track_color    DB 0

.CODE
main proc far
         mov  ax,@data
         mov  ds,ax
         mov  es,ax
         ;player1
         mov bx,1d
         call login
         lea si,username[2]
         lea di,username1
         movsb
         mov cl,InitialNumber
         mov InitialNumber1,cl


;;;;player2
 mov bx,2d
         call login
         lea si,username[2]
         lea di,username2
         movsb
          mov cl,InitialNumber
         mov InitialNumber2,cl
         ;;;;;;;;;;;;;;;;
         mov  ah,0003h
         mov  cx,00h
         mov  dx,184fh
         int  10h
         call choose
         ;;;;;;;;;;;;;;;;;;;;initialize
            ; mov  AX,@data                         ;initializing the data segemnt
                          ;mov  DS,AX
                          mov  ax,0003h
                          int  10h
                          mov  ax,0A000h                        ; to graphics screen
                          mov  es,ax
                          mov  ah,0                             ; 320 * 200
                          mov  al,13h
                          int  10h    
     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov ah,2ch;;to sheck seconds
int 21h
mov privsecond,dh
;;;;nesma end now all screen is black
     ;; printing the shape first time
     ; Red Drawing the shape
                          mov  bx,Red_Current_X[0]
                          mov  Current_X[0],bx
                          mov  bx,Red_Current_X[2]
                          mov  Current_X[2],bx
                          mov  bx,Red_Current_Y[0]
                          mov  Current_Y[0],bx
                          mov  bx,Red_Current_Y[2]
                          mov  Current_Y[2],bx
                          lea  ax,red_car_front
                          mov  si,ax
                          xor  ax,ax
                          call draw
     ; Blue Drawing the shape
                          mov  bx,Blue_Current_X[0]
                          mov  Current_X[0],bx
                          mov  bx,Blue_Current_X[2]
                          mov  Current_X[2],bx
                          mov  bx,Blue_Current_Y[0]
                          mov  Current_Y[0],bx
                          mov  bx,Blue_Current_Y[2]
                          mov  Current_Y[2],bx
                          lea  ax,blue_car_front
                          mov  si,ax
                          xor  ax,ax
                          call draw
 CALL CAR;first call

time:
mov ah,2ch;get time
int 21h
cmp dh,privsecond;still in the same second
jz secondcheck;return to game
 dec second
mov privsecond,dh

secondcheck:
CALL CAR
cmp second,1;the 2 minute finish
jnz time;still not finish
         mov ah,4ch
         int 21h
main endp

end main
