/*
 * File:   lab3main.c
 * Author: lafqu
 *
 * Created on February 27, 2020, 8:44 PM
 */


//All from a single column

#include "xc.h"

#pragma config FWDTEN = OFF
#pragma config JTAGEN = OFF
#pragma config POSCMOD = NONE
#pragma config OSCIOFNC = ON
#pragma config FCKSM = CSDCMD
#pragma config FNOSC = FRCPLL
#pragma config PLL96MHZ = OFF
#pragma config PLLDIV = NODIV
#pragma config SOSCSEL = IO

#define DEBOUNCEMAX 1000

//define interrupt handler and toggle function
void __attribute__ ((interrupt)) _CNInterrupt(void);
void led1_toggle(void);
void clearpressed();
void flipbits();

int row0col0_isPressed;
int row0col1_isPressed;
int row0col2_isPressed;
int row1col0_isPressed;
int row1col1_isPressed;
int row1col2_isPressed;
int row2col0_isPressed;
int row2col1_isPressed;
int row2col2_isPressed;
int row3col0_isPressed;
int row3col1_isPressed;
int row3col2_isPressed;

int lastclicked;

int main(void) {
    
    //config ports
    AD1PCFG = 0xFFFF;
    TRISA = 0x000F;
    TRISB = 0xFE08; //E = 1110, 8 = 1000, 12-4578
    LATB = 0xFFFF;
    
    //config pullups
    CNPU1 = CNPU1 | 0x000C; // 2,3
    CNPU2 = CNPU2 | 0x6000; //14,13
    
    //enable change notification interrupt
    CNEN1 = CNEN1 | 0x000C; //monitor RA0 pin 2 (100)
    CNEN2 = CNEN2 | 0x6000; //14,13
    IEC1bits.CNIE = 1; //change notification interrupt enable
    IFS1bits.CNIF = 0; //clear interrupt flag
    
    //initial begin
    //set all columns to 0, and then later set some to 1 to check which button is pressed
    LATBbits.LATB0 = 0;
    LATBbits.LATB1 = 0;
    LATBbits.LATB2 = 0;
    while(1){
        if(row0col0_isPressed){
            LATBbits.LATB4 = 0;
            LATBbits.LATB5 = 1;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 1;
            if(lastclicked == 1) flipbits();
            clearpressed();
            lastclicked = 1;
        }
        if(row0col1_isPressed){
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 0;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 1;
            if(lastclicked == 2) flipbits();
            clearpressed();
            lastclicked = 2;
        }
        if(row0col2_isPressed){
            LATBbits.LATB4 = 0;
            LATBbits.LATB5 = 0;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 1;
            if(lastclicked == 3) flipbits();
            clearpressed();
            lastclicked = 3;
        }
        if(row1col0_isPressed){
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 1;
            LATBbits.LATB7 = 0;
            LATBbits.LATB8 = 1;
            if(lastclicked == 4) flipbits();
            clearpressed();
            lastclicked = 4;
        }
        if(row1col1_isPressed){
            LATBbits.LATB4 = 0;
            LATBbits.LATB5 = 1;
            LATBbits.LATB7 = 0;
            LATBbits.LATB8 = 1;
            if(lastclicked == 5) flipbits();
            clearpressed();
            lastclicked = 5;
        }
        if(row1col2_isPressed){
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 0;
            LATBbits.LATB7 = 0;
            LATBbits.LATB8 = 1;
            if(lastclicked == 6) flipbits();
            clearpressed();
            lastclicked = 6;
        }
        if(row2col0_isPressed){
            LATBbits.LATB4 = 0;
            LATBbits.LATB5 = 0;
            LATBbits.LATB7 = 0;
            LATBbits.LATB8 = 1;
            if(lastclicked == 7) flipbits();
            clearpressed();
            lastclicked = 7;
        }
        if(row2col1_isPressed){
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 1;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 0;
            if(lastclicked == 8) flipbits();
            clearpressed();
            lastclicked = 8;
        }
        if(row2col2_isPressed){
            LATBbits.LATB4 = 0;
            LATBbits.LATB5 = 1;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 0;
            if(lastclicked == 9) flipbits();
            clearpressed();
            lastclicked = 9;
        }
        if(row3col0_isPressed){
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 0;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 0;
            if(lastclicked == 10) flipbits();
            clearpressed();
            lastclicked = 10;
        }
        if(row3col1_isPressed){
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 1;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 1;
            if(lastclicked == 11) flipbits();
            clearpressed();
            lastclicked = 11;
        }
        if(row3col2_isPressed){
            LATBbits.LATB4 = 0;
            LATBbits.LATB5 = 0;
            LATBbits.LATB7 = 1;
            LATBbits.LATB8 = 0;
            if(lastclicked == 12) flipbits();
            clearpressed();
            lastclicked = 12;
        }
    }
    return 0;
    //end
}

void clearpressed(){
    row0col0_isPressed = 0;
    row1col0_isPressed = 0;
    row2col0_isPressed = 0;
    row3col0_isPressed = 0;
    row0col1_isPressed = 0;
    row1col1_isPressed = 0;
    row2col1_isPressed = 0;
    row3col1_isPressed = 0;
    row0col2_isPressed = 0;
    row1col2_isPressed = 0;
    row2col2_isPressed = 0;
    row3col2_isPressed = 0;
}

void clr_columns(){
    //set them all back to 0 after checking
    LATBbits.LATB0 = 0;
    LATBbits.LATB1 = 0;
    LATBbits.LATB2 = 0;
}

void flipbits(){
    //set them all back to 0 after checking
    LATBbits.LATB4 = !LATBbits.LATB4;
    LATBbits.LATB5 = !LATBbits.LATB5;
    LATBbits.LATB7 = !LATBbits.LATB7;
    LATBbits.LATB8 = !LATBbits.LATB8;
}

void __attribute__ ((interrupt)) _CNInterrupt(void) {
    
    int debounceCounter = 0;
    if(!PORTAbits.RA0){ //if RA0 is low, (button is pressed from row)
        while((!PORTAbits.RA0) && (debounceCounter < DEBOUNCEMAX)){ //
            debounceCounter++;
        }
        if(debounceCounter == DEBOUNCEMAX){ //it's an actual press 
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 0;
            if(!PORTAbits.RA0){
                row0col2_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA0){
                row0col0_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA0){
                row0col1_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            //set them all back to 0 after checking
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 0;
        }else{ //was a glitch
            row0col0_isPressed = 0;
            row0col1_isPressed = 0;
            row0col2_isPressed = 0;
        }
    }else if(!PORTAbits.RA1){ //if RA0 is low, (button is pressed from row)
        while((!PORTAbits.RA1) && (debounceCounter < DEBOUNCEMAX)){ //
            debounceCounter++;
        }
        if(debounceCounter == DEBOUNCEMAX){ //it's an actual press 
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 0;
            if(!PORTAbits.RA1){
                row1col2_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA1){
                row1col0_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA1){
                row1col1_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            //set them all back to 0 after checking
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 0;
        }else{ //was a glitch
            row0col0_isPressed = 0;
            row0col1_isPressed = 0;
            row0col2_isPressed = 0;
        }
    } else if(!PORTAbits.RA2){ //if RA0 is low, (button is pressed from row)
        while((!PORTAbits.RA2) && (debounceCounter < DEBOUNCEMAX)){ //
            debounceCounter++;
        }
        if(debounceCounter == DEBOUNCEMAX){ //it's an actual press 
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 0;
            if(!PORTAbits.RA2){
                row2col2_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA2){
                row2col0_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA2){
                row2col1_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            //set them all back to 0 after checking
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 0;
        }else{ //was a glitch
            row0col0_isPressed = 0;
            row0col1_isPressed = 0;
            row0col2_isPressed = 0;
        }
    } else if(!PORTAbits.RA3){ //if RA0 is low, (button is pressed from row)
        while((!PORTAbits.RA3) && (debounceCounter < DEBOUNCEMAX)){ //
            debounceCounter++;
        }
        if(debounceCounter == DEBOUNCEMAX){ //it's an actual press 
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 0;
            if(!PORTAbits.RA3){
                row3col2_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA3){
                row3col0_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            LATBbits.LATB0 = 1;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 1;
            if(!PORTAbits.RA3){
                row3col1_isPressed = 1;
                IFS1bits.CNIF = 0; //clear interrupt flag
                //set them all back to 0 after checking
                LATBbits.LATB0 = 0;
                LATBbits.LATB1 = 0;
                LATBbits.LATB2 = 0;
                return;
            }
            //set them all back to 0 after checking
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 0;
            LATBbits.LATB2 = 0;
        }else{ //was a glitch
            row0col0_isPressed = 0;
            row0col1_isPressed = 0;
            row0col2_isPressed = 0;
        }
    }
}

void led1_toggle(void){
    LATBbits.LATB4 = !LATBbits.LATB4; //toggle led
    return;
}

