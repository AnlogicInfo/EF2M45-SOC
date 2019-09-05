#include <stdint.h>
#include "gpio.h"
#include "intc.h"
#include "test_demo.h"
#include "int_register.h"

#define USR_Out32(Addr, Value) \
    (*(volatile uint32_t *)((Addr)) = (Value))  
#define USR_BaseAddr       0x40020040

void test_demo()
{
    uint32_t counter1;
    uint32_t counter2;  
    uint8_t  result  ; 
  //define the GPIO Struct
    GPIO_InitTypeDef testgpio_output;
    GPIO_InitTypeDef testgpio_input;  
  //configure the output  
    testgpio_output.dir = gpio_Output;
    testgpio_output.debounce = gpio_Deb;
    testgpio_output.value = gpio_High;

  //configure the gpio_toggle  
    testgpio_input.dir = gpio_Input;
    testgpio_input.debounce = gpio_Deb;
       
  //configure the GPIO1_0 & GPIO0_7 to output
    HAL_GPIO_Init(gpio1_0,testgpio_output);

    HAL_GPIO_Init(gpio1_1,testgpio_input);  
 
    while(1)
    {
        //write the value to gpio1_0,gpio0_7
        HAL_GPIO_WritePin(gpio1_0,gpio_Low);
        
        //delay
        for(counter1=130; counter1 >0; counter1 --) 
        for(counter2=10000; counter2 >0; counter2 --)
        {}
 
		USR_Out32(USR_BaseAddr ,0xbbbb);   
		         
        HAL_GPIO_WritePin(gpio1_0,gpio_High);
    
        //delay
        for(counter1=130; counter1 >0; counter1 --) 
        for(counter2=10000; counter2 >0; counter2 --)
        {}
		USR_Out32(USR_BaseAddr ,0xdddd);  
		        
        printf("Elf2 MCU Quickstart Project~\n");
        
            result = HAL_GPIO_ReadPin(gpio1_1);
        printf("gpio1_1 = %d~\n",result);       
    }

}
