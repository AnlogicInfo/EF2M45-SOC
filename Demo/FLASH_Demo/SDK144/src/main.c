#include <stdint.h>
#include "gpio.h"
#include "intc.h"
 
#include "int_register.h"
#include "flash.h"
#include "qspi.h" 
#include "platform.h"
void test_read()
{
  	uint8_t param = 0xaa;	
  	uint8_t status= 0;
	uint32_t counter1;
	uint32_t counter2,i;	 
  	volatile uint8_t result;
  	uint8_t wr_array[16] = {0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8};  
  	   
  	uint8_t rd_array[16] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};  	
  	//define the GPIO Struct
	GPIO_InitTypeDef gpio_toggle;
  
  	//configure the gpio_toggle  
	gpio_toggle.dir = gpio_Output;
	gpio_toggle.debounce = gpio_Deb;
	gpio_toggle.value = gpio_High;
 
  	//configure the GPIO1_0 & GPIO0_7 to output
	HAL_GPIO_Init(gpio1_0,gpio_toggle);
 
	FLASH_Init();   
 
	{
	FLASH_Erase_Block(0x00040000, Sector_Erase)	;	//4000			
   
 	status = FLASH_Program(0x00040000, 16, wr_array);
	 
	if(status == 0)
		printf("Program Ok ~\n");   
	else 
		printf("Program Error ~\n");   	
 		
	status = FLASH_Read(0x00040000, 16, rd_array);
 
	if(status == 0)
		printf("Read Ok ~\n");  	
	else 
		printf("Read Error ~\n");   			
	for(i=0; i<16; i++)
	{
		printf("%d = %d    ",i,rd_array[i]);	
	}
	}
 
	while(1)
	{
		//write the value to gpio1_0,gpio0_7
		HAL_GPIO_WritePin(gpio1_0,gpio_Low);
 	
 		//delay
		for(counter1=130; counter1 >0; counter1 --) 
		for(counter2=10000; counter2 >0; counter2 --)
		{}
			
		HAL_GPIO_WritePin(gpio1_0,gpio_High);
	
 		//delay
		for(counter1=130; counter1 >0; counter1 --) 
		for(counter2=10000; counter2 >0; counter2 --)
		{}	
	}

}
void test_dual_read()
{
  	uint8_t param = 0xaa;	
  	uint8_t status= 0;
	uint32_t counter1;
	uint32_t counter2,i;	 
  	volatile uint8_t result;
  	uint8_t wr_array[16] = {0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8};  
  	   
  	uint8_t rd_array[16] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};  	
  	//define the GPIO Struct
	GPIO_InitTypeDef gpio_toggle;
  
  	//configure the gpio_toggle  
	gpio_toggle.dir = gpio_Output;
	gpio_toggle.debounce = gpio_Deb;
	gpio_toggle.value = gpio_High;
 
  	//configure the GPIO1_0 & GPIO0_7 to output
	HAL_GPIO_Init(gpio1_0,gpio_toggle);
 
	FLASH_Init();   
 
	{
	FLASH_Erase_Block(0x00040000, Sector_Erase)	;	//4000			
 
 	status = FLASH_Program(0x00040000, 16, wr_array);
 
	if(status == 0)
		printf("Program Ok ~\n");   
	else 
		printf("Program Error ~\n");   	
  		
 
	status = FLASH_Dual_Read(0x00040000, 16, rd_array);
 
	if(status == 0)
		printf("Dual Read Ok ~\n");  	
	else 
		printf("Dual Read Error ~\n");   			
	for(i=0; i<16; i++)
	{
		printf("%d = %d    ",i,rd_array[i]);	
	}
	}
 
	while(1)
	{
		//write the value to gpio1_0,gpio0_7
		HAL_GPIO_WritePin(gpio1_0,gpio_Low);
 		
 		//delay
		for(counter1=130; counter1 >0; counter1 --) 
		for(counter2=10000; counter2 >0; counter2 --)
		{}
			
		HAL_GPIO_WritePin(gpio1_0,gpio_High);
 
		for(counter1=130; counter1 >0; counter1 --) 
		for(counter2=10000; counter2 >0; counter2 --)
		{}
	}

}
void test_quad_read()
{ 
  	uint8_t param = 0xaa;	
  	uint8_t status= 0;
	uint32_t counter1;
	uint32_t counter2,i;	 
  	volatile uint8_t result;
  	uint8_t wr_array[16] = {0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8};  
  	   
  	uint8_t rd_array[16] = {0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};  	
  	//define the GPIO Struct
	GPIO_InitTypeDef gpio_toggle;
  
  	//configure the gpio_toggle  
	gpio_toggle.dir = gpio_Output;
	gpio_toggle.debounce = gpio_Deb;
	gpio_toggle.value = gpio_High;
 
  	//configure the GPIO1_0 & GPIO0_7 to output
	HAL_GPIO_Init(gpio1_0,gpio_toggle);
 
	FLASH_Init();   
	{
	FLASH_Erase_Block(0x00040000, Sector_Erase)	;	//4000			
  
 	status = FLASH_Program(0x00040000, 16, wr_array);
	 
	if(status == 0)
		printf("Program Ok ~\n");   
	else 
		printf("Program Error ~\n");   	
	status = FLASH_Quad_Enable()	;
	if(status == 0)
		printf("Enable Ok ~\n");  	
	else 
		printf("Enable Error ~\n");   		
	 
	status = FLASH_Quad_Read(0x00040000, 16, rd_array);
	 
	if(status == 0)
		printf("Quad Read Ok ~\n");  	
	else 
		printf("Quad Read Error ~\n");   			
	for(i=0; i<16; i++)
	{
		printf("%d = %d    ",i,rd_array[i]);	
	}
	}
 
	while(1)
	{
		//write the value to gpio1_0,gpio0_7
		HAL_GPIO_WritePin(gpio1_0,gpio_Low);
			
 		//delay
		for(counter1=130; counter1 >0; counter1 --) 
		for(counter2=10000; counter2 >0; counter2 --)
		{}
			
		HAL_GPIO_WritePin(gpio1_0,gpio_High);
	
 		//delay
		for(counter1=130; counter1 >0; counter1 --) 
		for(counter2=10000; counter2 >0; counter2 --)
		{}
		
	}

}
int main() 
{   
	SEGGER_RTT_printf(0,"Hello World 20180504~\n");
  	//test_read();
  	//test_dual_read();
  	test_quad_read();
	while(1);
}
