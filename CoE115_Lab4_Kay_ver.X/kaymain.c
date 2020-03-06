/*
 * File:   main.c
 * Author: kaysagun
 *
 * Created on March 1, 2020, 9:29 PM
 */


#include "xc.h"

#define FCY 4000000 //needs to be defined first before libpic30.h
#include "libpic30.h"

_CONFIG1 (FWDTEN_OFF & JTAGEN_OFF)
_CONFIG2 (POSCMOD_NONE & OSCIOFNC_ON & FCKSM_CSDCMD & FNOSC_FRCPLL & PLL96MHZ_OFF & PLLDIV_NODIV)
_CONFIG3 (SOSCSEL_IO)
        
int adcvalue;
void __attribute__((interrupt, no_auto_psv)) ADC1Interrupt(void);

void ADC_init(){
    AD1PCFG = 0xFDFF;
    AD1CON1bits.ADSIDL = 1;
    AD1CON1bits.FORM0 = 0;
    AD1CON1bits.FORM1 = 0;
    AD1CON1bits.SSRC = 0x7;
    AD1CON2bits.CSCNA = 0;
    AD1CON2bits.SMPI = 0x0;
    AD1CON2bits.BUFM = 0;
    AD1CON2bits.ALTS = 0;
    AD1CON2bits.VCFG = 0x0;
    AD1CON3bits.ADRC = 1;
    AD1CON3bits.SAMC = 0x2;
    AD1CON3bits.ADCS = 0x1;
    AD1CHSbits.CH0SA = 0x9;
    AD1CSSL = 0x0;
    TRISB = 0xF000;
}

int main(void){
    ADC_init(); // i n i t i a l i z e ADC
    LATB = 0xFF;
    _CNIP = 1;
    IEC0bits.AD1IE = 1;
    IFS0bits.AD1IF = 0;
    AD1CON1bits.ADON = 1 ; // turn on ADC
    while(1){
        /*if(adcvalue < 100)
            LATBbits.LATB0 = 1;
        else
            LATBbits.LATB0 = 0;*/
        //Turn LED on/ o f f based on adcvalue
        if(adcvalue < 155){
            LATBbits.LATB0 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            LATBbits.LATB3 = 1;
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 1;
        }else if(adcvalue>155){
            LATBbits.LATB1 = 0;
            LATBbits.LATB0 = 1;
            LATBbits.LATB2 = 1;
            LATBbits.LATB3 = 1;
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 1;
        }else if(adcvalue>310 && adcvalue<465){
            LATBbits.LATB1 = 1;
            LATBbits.LATB0 = 1;
            LATBbits.LATB3 = 1;
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 1;
            LATBbits.LATB2 = 0;
        }else if(adcvalue>465 && adcvalue<620){
            LATBbits.LATB3 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            LATBbits.LATB0 = 1;
            LATBbits.LATB4 = 1;
            LATBbits.LATB5 = 1;
        }else if(adcvalue>620 && adcvalue<775){
            LATBbits.LATB4 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            LATBbits.LATB3 = 1;
            LATBbits.LATB0 = 1;
            LATBbits.LATB5 = 1;
        }else{
            LATBbits.LATB5 = 0;
            LATBbits.LATB1 = 1;
            LATBbits.LATB2 = 1;
            LATBbits.LATB3 = 1;
            LATBbits.LATB4 = 1;
            LATBbits.LATB0 = 1;
        }
    }
}

void __attribute__((interrupt, no_auto_psv))ADC1Interrupt(void){
    IEC0bits.AD1IE = 0;//disable interrupt
    IFS0bits.AD1IF = 0;//Clear f l a g
    adcvalue = ADC1BUF0;//Copy ADC output to adcvalue
    IEC0bits.AD1IE = 1;//Enable i n t e r r u p t
    IFS0bits.AD1IF = 0;//Clear f l a g
}