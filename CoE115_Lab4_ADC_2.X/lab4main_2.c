/*
 * File:   lab3main.c
 * Author: lafqu
 *
 * Created on February 27, 2020, 8:44 PM
 */

#include "xc.h"
#define FCY 4000000
#include "libpic30.h"


#pragma config FWDTEN = OFF
#pragma config JTAGEN = OFF
#pragma config POSCMOD = NONE
#pragma config OSCIOFNC = ON
#pragma config FCKSM = CSDCMD
#pragma config FNOSC = FRCPLL
#pragma config PLL96MHZ = OFF
#pragma config PLLDIV = NODIV
#pragma config SOSCSEL = IO

//define interrupt handler and toggle function
void __attribute__ ((interrupt)) _ADC1Interrupt(void);


int adcvalue;

int main(void) {

    //config ports
    AD1PCFG = 0xFDFF; //1111 1101 1111 1111
    AD1CON1 = 0x20E4;
    AD1CON2 = 0x0000;
    AD1CON3 = 0x0201;
    AD1CHS = 0x0009; //channel 0 positive input is AN9 for MUXA
    AD1CSSL = 0x0000;
    TRISA = 0x0000;
    TRISB = 0xFF00; //E = 1110, 8 = 1000, 12-4578
    LATB = 0x0000;

    //enable change notification interrupt
    CNEN1 = CNEN1 | 0x0004; //monitor RA0 pin 2 (100)
    IEC0bits.AD1IE = 1; //change notification interrupt enable
    IFS0bits.AD1IF = 0; //clear interrupt flag

    AD1CON1bits.ADON =1;

    while(1){
        LATB = ~0x0001;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0002;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0004;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0008;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        LATBbits.LATB5 = 0;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        LATBbits.LATB7 = 0;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
        LATB = ~0x0000;
        __delay_ms(62/2 + ((float)adcvalue/1023)*938/2);
    }
    return 0;
    //end
}

void __attribute__ ((interrupt, no_auto_psv)) _ADC1Interrupt(void) {
    IEC0bits.AD1IE = 0;
    IFS0bits.AD1IF = 0; //clear interrupt flag

    adcvalue = ADC1BUF0;

    IEC0bits.AD1IE = 1;
    IFS0bits.AD1IF = 0; //clear interrupt flag
}
