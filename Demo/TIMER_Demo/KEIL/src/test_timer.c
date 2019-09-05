#include "timer.h"
#include "platform.h"
#include "syscon.h"
#include "int_register.h"
#include "log.h"

#include "gpio.h"
#include "intc.h"
#include "test_timer.h"

void timer_isr(void *param)
{
	uint32_t i,j;
	HAL_GPIO_WritePin(gpio1_0,gpio_Low);
	HAL_GPIO_WritePin(gpio1_1,gpio_Low);
	for(i=1000; i >0; i --)
		for(j=5000; j >0; j --);
	printf("Elf2 MCU TIMER Project~\n");
  HAL_TIMER_Int_Clr(TIMER1);
}


static uint8_t parameter = 0xaa;
void test_timer()
{

	//configure the config 
	TIMER_InitTypeDef config;
	config.index = TIMER1;
	config.mask = TIMER_NOT_MASKED;
	config.mode = TIMER_PERIODIC;
	config.timer_clk = APB_CLK0/8;

  //configure the gpio_toggle 
	GPIO_InitTypeDef gpio_toggle;
	gpio_toggle.dir = gpio_Output;
	gpio_toggle.debounce = gpio_Deb;
	gpio_toggle.value = gpio_High;
	
  //configure the GPIO1_0 & GPIO1_1 to output
	HAL_GPIO_Init(gpio1_0,gpio_toggle);
	HAL_GPIO_Init(gpio1_1,gpio_toggle);
	HAL_GPIO_Init(gpio1_2,gpio_toggle);
	HAL_GPIO_Init(gpio1_3,gpio_toggle);
	
	TIMER_Int_Register(timer_isr, &parameter);
	
	HAL_TIMER_Init(APB_CLK0, config);
	HAL_TIMER_Set_LoadCount(TIMER1,APB_CLK0/16);        //set counter to APB_CLK0/16, it will trigger the interrupt once every 0.5 second
	HAL_TIMER_Enable(TIMER1,TIMER_ENABLE);
	NVIC_EnableIRQ(TIMER_IRQn);
	
	while(1)
	{
			HAL_GPIO_WritePin(gpio1_0,gpio_High);
			HAL_GPIO_WritePin(gpio1_1,gpio_High);
	}
	
}
