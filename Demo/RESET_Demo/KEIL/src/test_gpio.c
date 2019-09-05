#include <stdint.h>
#include "gpio.h"
#include "intc.h"
#include "test_gpio.h"
#include "int_register.h"
 

void test_gpio()
{
	uint32_t i,j;
  
  //define the GPIO Struct
	GPIO_InitTypeDef gpio_toggle;
  
  //configure the gpio_toggle  
	gpio_toggle.dir = gpio_Output;
	gpio_toggle.debounce = gpio_Deb;
	gpio_toggle.value = gpio_High;
 
  //configure the GPIO1_0 & GPIO1_1 to output
	HAL_GPIO_Init(gpio1_0,gpio_toggle);
	HAL_GPIO_Init(gpio1_1,gpio_toggle);
 
	while(1)
	{
			HAL_GPIO_WritePin(gpio1_0,gpio_High);
			HAL_GPIO_WritePin(gpio1_1,gpio_High);
			for(i=1000; i >0; i --)
					for(j=5000; j >0; j --);
			HAL_GPIO_WritePin(gpio1_0,gpio_Low);
			HAL_GPIO_WritePin(gpio1_1,gpio_Low);
			for(i=1000; i >0; i --)
					for(j=5000; j >0; j --);
			printf("Elf2 MCU Quickstart Project~\n");
	}

}
