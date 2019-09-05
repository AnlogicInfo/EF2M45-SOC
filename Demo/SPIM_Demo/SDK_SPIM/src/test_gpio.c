#include <stdint.h>
#include "gpio.h"
#include "intc.h"
#include "test_gpio.h"
#include "int_register.h"

void test_gpio()
{
	uint32_t counter1;
	uint32_t counter2;	
  volatile uint8_t result;
  
  //define the GPIO Struct
	GPIO_InitTypeDef gpio_toggle;
  
  //configure the gpio_toggle  
	gpio_toggle.dir = gpio_Output;
	gpio_toggle.debounce = gpio_Deb;
	gpio_toggle.value = gpio_High;
	

  //configure the GPIO1_0 & GPIO0_7 to output
	HAL_GPIO_Init(gpio1_0,gpio_toggle);
	HAL_GPIO_Init(gpio0_7,gpio_toggle);	

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
