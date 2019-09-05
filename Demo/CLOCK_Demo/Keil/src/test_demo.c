#include <stdint.h>
#include "gpio.h"
#include "intc.h"
#include "test_demo.h"
#include "int_register.h"

void test_demo()
{
    uint32_t counter1;
    uint32_t counter2;  
 
  //define the GPIO Struct
    GPIO_InitTypeDef mygpio;
  
  //configure the gpio_toggle  
    mygpio.dir = gpio_Output;
    mygpio.debounce = gpio_Deb;
    mygpio.value = gpio_High;
    
  //configure the GPIO1_0 & GPIO0_7 to output
    HAL_GPIO_Init(gpio1_0,mygpio);
    HAL_GPIO_Init(gpio0_7,mygpio);  
 
    while(1)
    {
        //write the value to gpio1_0,gpio0_7
        HAL_GPIO_WritePin(gpio1_0,gpio_Low);
        HAL_GPIO_WritePin(gpio0_7,gpio_Low);     
        
        //delay
        for(counter1=130; counter1 >0; counter1 --) 
        for(counter2=10000; counter2 >0; counter2 --)
        {}
            
        HAL_GPIO_WritePin(gpio1_0,gpio_High);
        HAL_GPIO_WritePin(gpio0_7,gpio_High);
    
        //delay
        for(counter1=130; counter1 >0; counter1 --) 
        for(counter2=10000; counter2 >0; counter2 --)
        {}
        printf("Elf2 MCU Quickstart Project~\n");

    }

}
