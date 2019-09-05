#include <stdint.h>
#include "gpio.h"
#include "intc.h"
#include "test_gpio.h"
#include "int_register.h"
#define AHB_In32(Addr)  (*(volatile uint32_t *)(Addr))

#define AHB_Out32(Addr, Value) \
    (*(volatile uint32_t *)((Addr)) = (Value))  
#define AHB_BaseAddr       0x20008000

#define size_n 512
void test_gpio()
{
    uint32_t counter1;
    uint32_t counter2;  
    uint32_t i;
    uint32_t rd_value;   
    
    uint32_t compare_result=0;      
  //define the GPIO Struct
    GPIO_InitTypeDef mygpio;
  
  //configure the gpio_toggle  
    mygpio.dir = gpio_Output;
    mygpio.debounce = gpio_Deb;
    mygpio.value = gpio_High;
    
  //configure the GPIO1_0 & GPIO0_7 to output
    HAL_GPIO_Init(gpio1_0,mygpio);
    HAL_GPIO_Init(gpio0_7,mygpio);  

    //write 32bit data 
    for(i=0; i<size_n; i++)
    {
        AHB_Out32(AHB_BaseAddr +i*4, i);
    }
    
    //read 32bit data  
    for(i=0; i<size_n; i++)
    {  
        rd_value = AHB_In32(AHB_BaseAddr +i*4)        ;       
        if(i !=rd_value) 
        {   
            compare_result++;
            printf("wr_bram[%d] = %d \n\r",i,i);        
            printf("rd_bram[%d] = %d \n\r",i,rd_value);             
        }
        else;
    }
    
    if(compare_result)  
        printf("AHB Memory Test Error\n");      
    else    
        printf("AHB Memory Test Ok\n");  
 
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
