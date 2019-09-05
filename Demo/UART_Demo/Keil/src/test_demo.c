#include "elf2.h"
#include <string.h>

#include "uart.h"
#include "test_demo.h"
#include "syscon.h"

#include "debug.h"
#include "int_register.h"

struct param_t
{
	uint8_t p1;
	void * p2;	
};
uint8_t str[14] = {'E','L','F','2',' ','B','O','O','T',' ','O','K',0x0d,0x0a};
uint8_t read_buf[20];
uint8_t send_end[2]={0x0d,0x0a};

uint8_t anlogic0[] = {'W','e','l','c','o','m','e',' ','t','o',' ','u','s','e',' ','A','n','l','o','g','i','c',' ','M','C','U',' ','D','e','m','o'};

uint8_t anlogic01[] = {"\n\r---------------------------------------------\n\r"};
uint8_t anlogic02[] = {"-Welcome to use Anlogic MCU Demo             \n\r"};
uint8_t anlogic03[] = {"-Hardware ver.: V1.0                         \n\r"};
uint8_t anlogic04[] = {"-Software ver.: V1.0                         \n\r"};
uint8_t anlogic05[] = {"-Update       : April 12,2018                \n\r"};
uint8_t anlogic06[] = {"-Please select the number to test function   \n\r"};
uint8_t anlogic1[]  = {"1: Test GPIO\n\r"};
uint8_t anlogic2[]  = {"2: Test Timer\n\r"};
uint8_t anlogic3[]  = {"3: Test RTC\n\r"};
uint8_t anlogic4[]  = {"4: Test DMA\n\r"};
uint8_t anlogic5[]  = {"5: Test EXTI\n\r"};
uint8_t anlogic6[]  = {"6: Test SPI\n\r"};
uint8_t anlogic7[]  = {"7: Test I2C\n\r"};
uint8_t anlogic8[]  = {"8: Test I2S\n\r"};
uint8_t anlogic9[]  = {"9: Test WDT\n\r"};
uint8_t anlogicA[]  = {"A: Test ADC\n\r"};                         
 
struct param_t param;


void test_uart_finish(void *param, uint8_t status)
{
	if(status == STATUS_OK)
		;
	else
		assert_param(0);
}

void Test_Gpio(void)
{
	uint8_t example_begin[]={"Test the GPIO begin...\n\r"};
	uint8_t example_end[]={"Test the GPIO end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_Timer(void)
{
	uint8_t example_begin[]={"Test the Timer begin...\n\r"};
	uint8_t example_end[]={"Test the Timer end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_RTC(void)
{
	uint8_t example_begin[]={"Test the RTC begin...\n\r"};
	uint8_t example_end[]={"Test the RTC end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_DMA(void)
{
	uint8_t example_begin[]={"Test the DMA begin...\n\r"};
	uint8_t example_end[]={"Test the DMA end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_EXTI(void)
{
	uint8_t example_begin[]={"Test the EXTI begin...\n\r"};
	uint8_t example_end[]={"Test the EXTI end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_SPI(void)
{
	uint8_t example_begin[]={"Test the SPI begin...\n\r"};
	uint8_t example_end[]={"Test the SPI end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_I2C(void)
{
	uint8_t example_begin[]={"Test the I2C begin...\n\r"};
	uint8_t example_end[]={"Test the I2C end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_I2S(void)
{
	uint8_t example_begin[]={"Test the I2S begin...\n\r"};
	uint8_t example_end[]={"Test the I2S end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_WDT(void)
{
	uint8_t example_begin[]={"Test the WDT begin...\n\r"};
	uint8_t example_end[]={"Test the WDT end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Test_ADC(void)
{
	uint8_t example_begin[]={"Test the ADC begin...\n\r"};
	uint8_t example_end[]={"Test the ADC end...\n\r"};	
	HAL_UART_Write_Polling(example_begin, sizeof(example_begin));     
	HAL_UART_Write_Polling(example_end, sizeof(example_end));  		
}

void Tips_Input(void)
{
}	
void test_uart_rx_finish(void *param, uint8_t status)
{
	if(status == STATUS_OK)
	{
		 
		HAL_UART_Write_Polling(read_buf, 1);
		HAL_UART_Write_Polling(send_end, sizeof(send_end));
		switch (read_buf[0])
		{
		case '1': Test_Gpio() ;break;
		case '2': Test_Timer();break;  
		case '3': Test_RTC()  ;break;  
		case '4': Test_DMA()  ;break;  
		case '5': Test_EXTI() ;break;  
		case '6': Test_SPI()  ;break;  
		case '7': Test_I2C()  ;break;  
		case '8': Test_I2S()  ;break;  
		case '9': Test_WDT()  ;break;  
		case 'A': Test_ADC()  ;break;  
		default : Tips_Input();break;
 	}
				
		HAL_UART_Write_Polling(anlogic01, sizeof(anlogic01));     
		HAL_UART_Write_Polling(anlogic02, sizeof(anlogic02));   
		HAL_UART_Write_Polling(anlogic03, sizeof(anlogic03));   
		HAL_UART_Write_Polling(anlogic04, sizeof(anlogic04));   
		HAL_UART_Write_Polling(anlogic05, sizeof(anlogic05)); 
		HAL_UART_Write_Polling(anlogic06, sizeof(anlogic06));   

		HAL_UART_Write_Polling(anlogic1, sizeof(anlogic1)); 
		HAL_UART_Write_Polling(anlogic2, sizeof(anlogic2)); 
		HAL_UART_Write_Polling(anlogic3, sizeof(anlogic3)); 
		HAL_UART_Write_Polling(anlogic4, sizeof(anlogic4)); 
		HAL_UART_Write_Polling(anlogic5, sizeof(anlogic5)); 
		HAL_UART_Write_Polling(anlogic6, sizeof(anlogic6)); 
		HAL_UART_Write_Polling(anlogic7, sizeof(anlogic7)); 
		HAL_UART_Write_Polling(anlogic8, sizeof(anlogic8)); 
		HAL_UART_Write_Polling(anlogic9, sizeof(anlogic9)); 
		HAL_UART_Write_Polling(anlogicA, sizeof(anlogicA)); 
		HAL_UART_Write_Polling(anlogic01, sizeof(anlogic01)); 
		 



		
//		HAL_UART_Write_Polling(send_end, sizeof(send_end));		
//
//		HAL_UART_Write_Polling(anlogic1, sizeof(anlogic1));
//		HAL_UART_Write_Polling(send_end, sizeof(send_end));	
//
//		HAL_UART_Write_Polling(anlogic2, sizeof(anlogic2));
//		HAL_UART_Write_Polling(send_end, sizeof(send_end));					
		memset(read_buf,0,1);
	}
	else
		assert_param(0);
}

void test_uart_tx_callback(void *param, uint8_t status)
{
	volatile uint8_t tmp1;
	volatile void * tmp2;
	if(status == STATUS_OK)
	{
		struct param_t *p = param;
		tmp1 = p->p1;
		tmp2 = tmp2;
		HAL_UART_Read(read_buf,2,test_uart_rx_finish,NULL);
	}
	else
		assert_param(0);
	
}

void test_tx_finish(void *param, uint8_t status)
{
	volatile uint8_t i;
	i = 9;
}

void test_uart0_write()
{
	param.p1 = 2;
	param.p2 = &param;
	HAL_UART_Write(str, 14, test_uart_tx_callback, &param);
}

 
void test_uart_send()
{
	HAL_UART_Write(str, 14, test_uart_tx_callback, &param);	
}

UART_Env_Tag env0;

void test_demo()
{
//¢HAL_SYSCON_Function_IO_Set(UART_TXD,GPIO_0,1);
//HAL_SYSCON_Function_IO_Set(UART_RXD,GPIO_1,1);
	volatile uint8_t i; 
	HAL_SYSCON_Function_IO_Set(UART_TXD,GPIO_4,1);
	HAL_SYSCON_Function_IO_Set(UART_RXD,GPIO_3,1);	 
	UART_Int_Register(HAL_UART_Isr, &env0);
	
	UART_InitTypeDef config;
	config.UART_BaudRate = 115200;
	config.UART_DataLen = Data_Length_8_bits;
	config.UART_Parity = none_parity_check;
	config.UART_StopBits = stop_bit_1;
	HAL_UART_Init(APB_CLK0,config);
	
	HAL_UART_FIFO_Control(TX_Empty_Trigger_FIFO_Empty,RCVR_Trigger_One_Character);
	
	NVIC_EnableIRQ(UART_IRQn);
//	HAL_UART0_Write(str,5,test_tx_finish,NULL);
	
//	test_uart0_write();
//	test_uart_send();
	i=0;
	while(1)
	{
		HAL_UART_WriteChar_Polling(str[i]);
		i++;
		if(i==14)
				break;
	}
	HAL_UART_Write_Polling(str, sizeof(str));
	while(1)
	HAL_UART_Read(read_buf,1,test_uart_rx_finish,NULL);
	
}


