#include <stdint.h>
#include "gpio.h"
#include "intc.h"
#include "test_demo.h"
#include "int_register.h"

void gpio_isr(void *param)
{
    volatile uint8_t a = 5;
    volatile uint32_t status;
    uint8_t *p = (uint8_t *)param;
    
    printf("intput param = %d\n",*p);
    a = 6;
    a++;
    status = HAL_GPIO_IntStatus();
    HAL_GPIO_ClrIrq(gpio0_7);
    
    printf("gpio interrupt!!!\n");
}


void test_demo()
{
    uint8_t param = 0xaa;
    uint32_t counter1;
    uint32_t counter2;  
    uint8_t  result  ; 
  //define the GPIO Struct
    GPIO_InitTypeDef testgpio_output;
    GPIO_InitTypeDef testgpio_input;  
    GPIO_InitTypeDef gpio_irq;
  //configure the output  
    testgpio_output.dir = gpio_Output;
    testgpio_output.debounce = gpio_Deb;
    testgpio_output.value = gpio_High;

  //configure the gpio_toggle  
    testgpio_input.dir = gpio_Input;
    testgpio_input.debounce = gpio_Deb;
 
  //configure the gpio_toggle          
    gpio_irq.dir = gpio_Input;
    gpio_irq.trig_type =gpio_Rising_Edge;//gpio_Low_Level;// gpio_High_Level;// gpio_Falling_Edge;//gpio_Rising_Edge;

    HAL_GPIO_Init(gpio0_7,gpio_irq);
    HAL_GPIO_UnmaskIrq(gpio0_7);
    HAL_GPIO_IntEnable(gpio0_7);

    GPIO_Int_Register(gpio_isr, &param); 
    NVIC_EnableIRQ(GPIO_IRQn);
        
  //Init GPIO1_0 
    HAL_GPIO_Init(gpio1_0,testgpio_output);

    while(1)
    {
        //write the value to gpio1_0 
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
