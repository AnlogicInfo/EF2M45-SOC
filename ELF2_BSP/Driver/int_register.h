
#ifndef INT_REGISTER_H
#define INT_REGISTER_H
#include <stdint.h>
#include <stddef.h>

//typedef void (*int_callback)(void);
extern uint32_t Image$$INT_CALLBACK_TBL$$Base;
#define INT_CALLBACK_PLACE	&(Image$$INT_CALLBACK_TBL$$Base)


typedef struct
{
	void *isr_func;
	void *param;				// one pointer to global variable
}int_callback_t;


typedef enum       //1 Do not modify this table !!!
{
    WDT_CALLBACK = 0,
    EXT_CALLBACK,
    RTC_CALLBACK,
    DMAC_CALLBACK,
    QSPI_CALLBACK,
    ADCC0_CALLBACK,
    ADCC1_CALLBACK,
    ADCC2_CALLBACK,
    ADCC3_CALLBACK,
    ADCC4_CALLBACK,
    ADCC5_CALLBACK,
	TIMER_CALLBACK,
    I2C0_CALLBACK,
    I2C1_CALLBACK,
    SPIM_CALLBACK,
    UART_CALLBACK,
    GPIO_CALLBACK,
    I2S_CALLBACK,
	DRV_CALLBACK_MAX
}int_callback_index;


void int_callback_unregister(int_callback_index index);
void * int_callback_get_isr(int_callback_index index);
void * int_callback_get_param(int_callback_index index);
void WDT_Int_Register(void *isr_func, void *param);							//param can be NULL
void EXTINT_Int_Register(void *isr_func, void *param);							//param can be NULL
void RTC_Int_Register(void *isr_func, void *param);							//param can be NULL
void DMAC_Int_Register(void *isr_func, void *param);							//param can be NULL
void ADCC0_Int_Register(void *isr_func, void *param);							//param can be NULL
void ADCC1_Int_Register(void *isr_func, void *param);							//param can be NULL
void ADCC2_Int_Register(void *isr_func, void *param);							//param can be NULL
void ADCC3_Int_Register(void *isr_func, void *param);							//param can be NULL
void ADCC4_Int_Register(void *isr_func, void *param);							//param can be NULL
void ADCC5_Int_Register(void *isr_func, void *param);							//param can be NULL
void TIMER_Int_Register(void *isr_func, void *param);							//param can be NULL
void I2C0_Int_Register(void *isr_func, void *param);						//param can be NULL
void I2C1_Int_Register(void *isr_func, void *param);							//param can be NULL
void SPIM_Int_Register(void *isr_func, void *param);							//param can be NULL
void UART_Int_Register(void *isr_func, void *param);					//param is a uart_env_tag
void GPIO_Int_Register(void *isr_func, void *param);							//param can be NULL
void I2S_Int_Register(void *isr_func, void *param);							//param can be NULL



#endif

