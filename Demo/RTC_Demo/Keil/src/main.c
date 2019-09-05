#include "segger_rtt.h"
#include "test_demo.h"
#include "rtc.h"
#include "gpio.h"
#include "int_register.h"
#include "log.h"
#include "elf2.h"


RTC_InitTypeDef rtc_cfg;

void my_rtc_isr()
{
    HAL_RTC_ClearIrq();

    HAL_GPIO_TogglePin(gpio0_7);   
}

void RTC_Init(void)
{
    rtc_cfg.counter_load = 0;
    rtc_cfg.counter_match = RTC_CLK;
    rtc_cfg.int_mask = 0;
    rtc_cfg.wrap_en = 1;
    rtc_cfg.int_en = 1;
    HAL_RTC_Init(rtc_cfg);
    RTC_Int_Register(my_rtc_isr,NULL);
    NVIC_EnableIRQ(RTC_IRQn);
    
    HAL_RTC_Enable(1);   
}

void GPIO_Init(void)
{
    GPIO_InitTypeDef gpio_toggle;

    gpio_toggle.dir = gpio_Output;
    gpio_toggle.debounce = gpio_Deb;
    gpio_toggle.value = gpio_High;
    
    HAL_GPIO_Init(gpio0_7,gpio_toggle); 
}

int main() 
{    
    SEGGER_RTT_printf(0,"Hello World 20180808~\n");
    RTC_Init();
    GPIO_Init();
    while(1);
}
