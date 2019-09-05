#include <stdint.h>
#include "gpio.h"
#include "intc.h"
#include "dma.h"
#include "test_gpio.h"
#include "int_register.h"
 
#define AHB_In32(Addr)  (*(volatile uint32_t *)(Addr))
#define AHB_Out32(Addr, Value) \
    (*(volatile uint32_t *)((Addr)) = (Value))  
#define AHB_BaseAddr       0x20008000
#define size_n 2048

//void MEM2AHB_SLAVE()
//{
//		volatile uint8_t a,b;
//		uint32_t rand_tx[10]={55};
//		uint32_t ii;
//		for(ii=0; ii<10; ii++)
//		{
//				rand_tx[ii] = 0x50+ii;
//		}
//		for(ii=0; ii<10; ii++)
//		{
//				printf("rand_tx111[%d]=%d\n",ii,rand_tx[ii]);
//		}
//	
//		DMAC_InitTypeDef dma_config;
//    dma_config.device = AHB_SLAVE;
//    dma_config.type = Memory_to_Peripheral_DMAC_Flow_Controller;
//    dma_config.msize = Burst_Transaction_Length_1;
//    dma_config.width = Transfer_Width_32_bits;
//    dma_config.src_inc = Address_Increment;
//    dma_config.dst_inc = Address_Increment;
//    dma_config.int_en = Interrupt_Disabled;
//    HAL_DMAC_Init(DMAC_CHANNEL_1,dma_config);
//	
//    NVIC_EnableIRQ(DMAC_IRQn);
//		
//    HAL_DMAC_Start_Transfer(DMAC_CHANNEL_1,rand_tx,DMAC_AHB_RW_ADDRESS,10);
//		//#define DMAC_AHB_RW_ADDRESS    ((void *)0x20008000)  in dma.h
//		
//    a = HAL_DMAC_Get_Busy_Channel();
//		printf("busystate=%d\n",a);
//    HAL_DMAC_Wait_Done(DMAC_CHANNEL_1);
//    b = HAL_DMAC_Get_Busy_Channel();
//		printf("busystate=%d\n",b);
//}

//void AHB_SLAVE2MEM()
//{
//		volatile uint8_t a,b;
//		uint32_t rand_tx[10];
//		uint32_t ii;
//		for(ii=0; ii<10; ii++)
//		{
//				rand_tx[ii] = 0;
//		}
//		for(ii=0; ii<10; ii++)
//		{
//				printf("rand_tx222[%d]=%d\n",ii,rand_tx[ii]);
//		}
//		DMAC_InitTypeDef dma_config;
//    dma_config.device = AHB_SLAVE;
//    dma_config.type = Peripheral_to_Memory_DMAC_Flow_Controller;
//    dma_config.msize = Burst_Transaction_Length_1;
//    dma_config.width = Transfer_Width_32_bits;
//    dma_config.src_inc = Address_Increment;
//    dma_config.dst_inc = Address_Increment;
//    dma_config.int_en = Interrupt_Disabled;
//    HAL_DMAC_Init(DMAC_CHANNEL_1,dma_config);
//	
//    NVIC_EnableIRQ(DMAC_IRQn);
//		
//    HAL_DMAC_Start_Transfer(DMAC_CHANNEL_1,DMAC_AHB_RW_ADDRESS,rand_tx,10);
//		//#define DMAC_AHB_RW_ADDRESS    ((void *)0x20008000)  in dma.h
//		
//    a = HAL_DMAC_Get_Busy_Channel();
//		printf("busystate=%d\n",a);
//    HAL_DMAC_Wait_Done(DMAC_CHANNEL_1);
//    b = HAL_DMAC_Get_Busy_Channel();
//		printf("busystate=%d\n",b);
//		
//		for(ii=0; ii<10; ii++)
//		{
//				printf("rand_tx333[%d]=%d\n",ii,rand_tx[ii]);
//		}
//}

void mem2mem()
{
		volatile uint8_t a,b;
		uint32_t buf_tx[10];
		uint32_t buf_rx[10];
		uint32_t ii;
		for(ii=0; ii<10; ii++)
		{
				buf_tx[ii] = ii;
		}
		for(ii=0; ii<10; ii++)
		{
				printf("buf_tx_ahead[%d]=%d\n",ii,buf_tx[ii]);
		}
		for(ii=0; ii<10; ii++)
		{
				buf_rx[ii] = 0;
		}
		for(ii=0; ii<10; ii++)
		{
				printf("buf_rx_ahead[%d]=%d\n",ii,buf_rx[ii]);
		}
		
		DMAC_InitTypeDef dma_config;
    //dma_config.device = UART_RX;
    dma_config.type = Memory_to_Memory_DMAC_Flow_Controller;
    dma_config.msize = Burst_Transaction_Length_1;
    dma_config.width = Transfer_Width_32_bits;
    dma_config.src_inc = Address_Increment;
    dma_config.dst_inc = Address_Increment;
    dma_config.int_en = Interrupt_Disabled;
    HAL_DMAC_Init(DMAC_CHANNEL_1,dma_config);
	
    NVIC_EnableIRQ(DMAC_IRQn);
		
    HAL_DMAC_Start_Transfer(DMAC_CHANNEL_1,buf_tx,buf_rx,10);
		//#define DMAC_AHB_RW_ADDRESS    ((void *)0x20008000)  in dma.h
		
    a = HAL_DMAC_Get_Busy_Channel();
		printf("busystate=%d\n",a);
    HAL_DMAC_Wait_Done(DMAC_CHANNEL_1);
    b = HAL_DMAC_Get_Busy_Channel();
		printf("busystate=%d\n",b);
		
		for(ii=0; ii<10; ii++)
		{
				printf("buf_rx_end[%d]=%d\n",ii,buf_rx[ii]);
		}
}		

void test_gpio()
{
	uint32_t i,j;
  
	uint16_t rd_value;
	uint32_t compare_result=0;
	
	mem2mem();
	//write  data to AHB
  for(i=0; i<size_n; i++)
  {
		AHB_Out32(AHB_BaseAddr +i*4, i);
  }
  //read data from AHB      
  for(i=0; i<size_n; i++)
  {  
    rd_value = AHB_In32(AHB_BaseAddr +i*4);
		printf("rd_AHB[%d] = %d \n\r",i,rd_value);
		if((i) !=rd_value) 
    {   
      compare_result++;
      printf("wr_AHB[%d] = %d \n\r",i,(i+2));        
      printf("rd_AHB[%d] = %d \n\r",i,rd_value);             
    } 
  }
	if(compare_result !=0)  
		printf("Memory Test Error\n");      
	else    
		printf("Memory Test Ok\n");	
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
