sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;


/*const char character[] = {0,0,10,31,31,14,4,0};

void CustomChar(char pos_row, char pos_char) {
char i;
Lcd_Cmd(64);
for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
Lcd_Cmd(_LCD_RETURN_HOME);
Lcd_Chr(pos_row, pos_char, 0);
}        */

const char character[] = {0,15,26,28,30,15,0,0};

void CustomChara(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

const char character2[] = {0,14,27,31,31,14,0,0};

void CustomCharc(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}
char i;
void main() {
ANSEL = 0;
ANSELH = 0;
TRISB = 0;
TRISD = 0;

Lcd_Init(); //Inicializa la libreria lcd
  /*
 CustomChara(1,1);
 Delay_ms(300);
 Lcd_Cmd(_LCD_Clear);
 */
while(1){
 for(i=0; i<=15; i++){
   if(i%2==0){
     CustomChara(1,i);
     Lcd_Cmd(_LCD_CURSOR_OFF);
     Delay_ms(300);
     Lcd_Cmd(_LCD_Clear);
   }else{
     CustomCharc(1,i);
     Lcd_Cmd(_LCD_CURSOR_OFF);
     Delay_ms(300);
     Lcd_Cmd(_LCD_Clear);
   }
  };
}
}