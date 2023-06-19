
_CustomChara:

;signalSpecial.c,28 :: 		void CustomChara(char pos_row, char pos_char) {
;signalSpecial.c,30 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,31 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChara_i_L0+0
L_CustomChara0:
	MOVF       CustomChara_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChara1
	MOVF       CustomChara_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChara_i_L0+0, 1
	GOTO       L_CustomChara0
L_CustomChara1:
;signalSpecial.c,32 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,33 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChara_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChara_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;signalSpecial.c,34 :: 		}
L_end_CustomChara:
	RETURN
; end of _CustomChara

_CustomCharc:

;signalSpecial.c,38 :: 		void CustomCharc(char pos_row, char pos_char) {
;signalSpecial.c,40 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,41 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
	CLRF       CustomCharc_i_L0+0
L_CustomCharc3:
	MOVF       CustomCharc_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomCharc4
	MOVF       CustomCharc_i_L0+0, 0
	ADDLW      _character2+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character2+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomCharc_i_L0+0, 1
	GOTO       L_CustomCharc3
L_CustomCharc4:
;signalSpecial.c,42 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,43 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomCharc_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomCharc_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;signalSpecial.c,44 :: 		}
L_end_CustomCharc:
	RETURN
; end of _CustomCharc

_main:

;signalSpecial.c,46 :: 		void main() {
;signalSpecial.c,47 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;signalSpecial.c,48 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;signalSpecial.c,49 :: 		TRISB = 0;
	CLRF       TRISB+0
;signalSpecial.c,50 :: 		TRISD = 0;
	CLRF       TRISD+0
;signalSpecial.c,52 :: 		Lcd_Init(); //Inicializa la libreria lcd
	CALL       _Lcd_Init+0
;signalSpecial.c,58 :: 		while(1){
L_main6:
;signalSpecial.c,59 :: 		for(i=0; i<=15; i++){
	CLRF       _i+0
L_main8:
	MOVF       _i+0, 0
	SUBLW      15
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;signalSpecial.c,60 :: 		if(i%2==0){
	MOVLW      1
	ANDWF      _i+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;signalSpecial.c,61 :: 		CustomChara(1,i);
	MOVLW      1
	MOVWF      FARG_CustomChara_pos_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_CustomChara_pos_char+0
	CALL       _CustomChara+0
;signalSpecial.c,62 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,63 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
;signalSpecial.c,64 :: 		Lcd_Cmd(_LCD_Clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,65 :: 		}else{
	GOTO       L_main13
L_main11:
;signalSpecial.c,66 :: 		CustomCharc(1,i);
	MOVLW      1
	MOVWF      FARG_CustomCharc_pos_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_CustomCharc_pos_char+0
	CALL       _CustomCharc+0
;signalSpecial.c,67 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,68 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
;signalSpecial.c,69 :: 		Lcd_Cmd(_LCD_Clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;signalSpecial.c,70 :: 		}
L_main13:
;signalSpecial.c,59 :: 		for(i=0; i<=15; i++){
	INCF       _i+0, 1
;signalSpecial.c,71 :: 		};
	GOTO       L_main8
L_main9:
;signalSpecial.c,72 :: 		}
	GOTO       L_main6
;signalSpecial.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
