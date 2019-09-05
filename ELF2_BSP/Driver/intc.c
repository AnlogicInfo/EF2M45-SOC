#include "chip.h"

#include "int_register.h"
#include "debug.h"

static void clear_all_pending_irq()
{	
    NVIC_ClearPendingIRQ(WDT_IRQn);
    NVIC_ClearPendingIRQ(EXT_IRQn);
    NVIC_ClearPendingIRQ(RTC_IRQn);
    NVIC_ClearPendingIRQ(DMAC_IRQn);
    NVIC_ClearPendingIRQ(QSPI_IRQn);
    NVIC_ClearPendingIRQ(ADCC0_IRQn);
    NVIC_ClearPendingIRQ(ADCC1_IRQn);
    NVIC_ClearPendingIRQ(ADCC2_IRQn);
    NVIC_ClearPendingIRQ(ADCC3_IRQn);
    NVIC_ClearPendingIRQ(ADCC4_IRQn);
    NVIC_ClearPendingIRQ(ADCC5_IRQn);
    NVIC_ClearPendingIRQ(TIMER_IRQn);
    NVIC_ClearPendingIRQ(I2C0_IRQn);
    NVIC_ClearPendingIRQ(I2C1_IRQn);
    NVIC_ClearPendingIRQ(SPIM_IRQn);
    NVIC_ClearPendingIRQ(UART_IRQn);
    NVIC_ClearPendingIRQ(GPIO_IRQn);
    NVIC_ClearPendingIRQ(I2S_IRQn);	
}


void int_set_priority(IRQn_Type type, uint8_t pri)
{
    NVIC_SetPriority(type,pri);
}


void intc_init(void)
{
    clear_all_pending_irq();
//    set_irq_prio();
}


void WDT_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+WDT_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));
}

void EXT_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+EXT_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void RTC_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+RTC_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void DMAC_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+DMAC_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void QSPI_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+QSPI_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void ADCC0_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+ADCC0_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void ADCC1_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+ADCC1_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void ADCC2_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+ADCC2_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void ADCC3_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+ADCC3_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}


void ADCC4_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+ADCC4_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void ADCC5_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+ADCC5_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void TIMER_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+TIMER_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void I2C0_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+I2C0_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void I2C1_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+I2C1_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void SPIM_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+SPIM_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void UART_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+UART_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void GPIO_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+GPIO_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}

void I2S_IRQHandler(void)
{
    int_callback_t *int_call = (int_callback_t *)INT_CALLBACK_PLACE;
    typedef void (*isr_fn)(void *param);
    isr_fn *func =(isr_fn *)(int_call+I2S_CALLBACK);
    assert_param(func != NULL);
    (*func)(*(func+1));

}
