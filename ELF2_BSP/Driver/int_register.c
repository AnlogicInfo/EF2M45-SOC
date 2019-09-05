
#include "int_register.h"
#include "debug.h"


static int_callback_t int_callback[DRV_CALLBACK_MAX] __attribute__((section("int_callback_area")));


static int_callback_t *int_callback_register(int_callback_index index, void *isr_func, void *param)
{
	assert_param(index < DRV_CALLBACK_MAX);
	int_callback[index].isr_func = isr_func;
	int_callback[index].param = param;
    return &int_callback[index];
}


void int_callback_unregister(int_callback_index index)
{
    assert_param(index < DRV_CALLBACK_MAX);
    int_callback[index].isr_func = NULL;
    int_callback[index].param = NULL;

}

void * int_callback_get_isr(int_callback_index index)
{
	assert_param(index < DRV_CALLBACK_MAX);
	return int_callback[index].isr_func;
}

void * int_callback_get_param(int_callback_index index)
{
	assert_param(index < DRV_CALLBACK_MAX);
	return int_callback[index].param;
}


void WDT_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(WDT_CALLBACK,isr_func,param);	
}


void EXTINT_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(EXT_CALLBACK,isr_func,param);	
}


void RTC_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(RTC_CALLBACK,isr_func,param);	
}


void DMAC_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(DMAC_CALLBACK,isr_func,param);	
}


void ADCC0_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(ADCC0_CALLBACK,isr_func,param);	
}

void ADCC1_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(ADCC1_CALLBACK,isr_func,param);	
}

void ADCC2_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(ADCC2_CALLBACK,isr_func,param);	
}

void ADCC3_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(ADCC3_CALLBACK,isr_func,param);	
}

void ADCC4_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(ADCC4_CALLBACK,isr_func,param);	
}

void ADCC5_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(ADCC5_CALLBACK,isr_func,param);	
}


void TIMER_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(TIMER_CALLBACK,isr_func,param);	
}


void I2C0_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(I2C0_CALLBACK,isr_func,param);	
}

void I2C1_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(I2C1_CALLBACK,isr_func,param);	
}


void SPIM_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(SPIM_CALLBACK,isr_func,param);	
}


void UART_Int_Register(void *isr_func, void *param)					//param is a uart_env_tag
{
	assert_param(isr_func != NULL);
	assert_param(param != NULL);
	int_callback_register(UART_CALLBACK,isr_func,param);	
}


void GPIO_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(GPIO_CALLBACK,isr_func,param);	
}


void I2S_Int_Register(void *isr_func, void *param)							//param can be NULL
{
	assert_param(isr_func != NULL);
	int_callback_register(I2S_CALLBACK,isr_func,param);	
}



