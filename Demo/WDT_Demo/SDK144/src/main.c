#include "segger_rtt.h"
#include "wdt.h"
#include "int_register.h"
#include "elf2.h"
#include "log.h"

void wdt_isr()
{
	HAL_WDT_Restart();
	printf("wdt_trigger\n");	
}

void test_wdt(void)
{
	WDT_InitTypeDef config;
	config.mode = wdt_Irq_Reset;
	config.period = wdt_period_7FFF;
	config.pulse_width = wdt_64_pclk_cycles;
	WDT_Int_Register(wdt_isr, NULL);
	HAL_WDT_Init(config);
	HAL_WDT_Enable();
	NVIC_EnableIRQ(WDT_IRQn);	
}

int main() 
{   
	SEGGER_RTT_printf(0,"Hello World 20180504~\n");
	test_wdt();
	while(1);
}
