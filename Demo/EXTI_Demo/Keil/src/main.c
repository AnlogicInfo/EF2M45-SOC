#include "segger_rtt.h"
#include "test_demo.h"
#include "exti.h"
#include "int_register.h"
#include <stdio.h>
#include "elf2.h"

void exti_isr()
{
    HAL_EXTI_IntClr(EXT_INT_7);
    printf("int_triggered\n");
}


void test_extint()
{
    EXTI_InitTypeDef config;
    config.int_en = true;
    config.src = EXT_INT_7;
    config.type = LOW_LEVEL;//HIGH_LEVEL;//LOW_LEVEL;//POSITIVE_EDGE;//NEGETIVE_EDGE;
    EXTINT_Int_Register(exti_isr,NULL);
    HAL_EXTI_Init(config);
    NVIC_EnableIRQ(EXT_IRQn);
    
}


int main() 
{   
    SEGGER_RTT_printf(0,"Hello World 2018080811~\n");
    test_extint();
    while(1);
}
