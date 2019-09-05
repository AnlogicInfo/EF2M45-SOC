/**
 ****************************************************************************************
 *
 * @file timer.h
 *
 * @brief timer driver interface
 *
 * (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
 *          ALL RIGHTS RESERVED
 *
 ****************************************************************************************
 */



/**
 ****************************************************************************************
 * @addtogroup TIMER
 * @ingroup DRIVERS
 * @brief TIMER Drivers. The timer is 24bit.
 *        TIMER can be use to calculate a short time. And all timer registers will get lost after a deep sleep.  
 *        TIMER can also be used to drive a pwm.
 * @{
 ****************************************************************************************
 */


#ifndef TICK_TIMER_H
#define TICK_TIMER_H

#include "chip.h"

/**
 * @brief There are totally 2 hardware timers.
 */
typedef enum
{
    TIMER1=0,
    TIMER2,
}Timer_Index;

/**
 * @brief Mask the timer interrupt or not.
 */
typedef enum
{
    TIMER_NOT_MASKED = 0,
    TIMER_MASKED
}Timer_Mask;

/**
 * @brief Choose the running mode of timer.
          user_defined: Use this mode if you want a fixed, timed interrupt.
          free_running: Use this mode if you want a single timed interrupt.
 */
typedef enum
{
    TIMER_FREE_RUNNING = 0,
    TIMER_PERIODIC
}Timer_Mode;

/**
 * @brief Enable or Disable the timer
 */
typedef enum
{
    TIMER_DISABLE = 0,
    TIMER_ENABLE
}Timer_Enable;


/**
 * @brief This is the struct to initialize the timer module.
 */
typedef struct
{
    Timer_Index index;      /**< index: select which timer to use */
    Timer_Mask mask;        /**< mask: mask or unmask the timer interrupt */
    Timer_Mode mode;        /**< mode: select the running mode of timer, free-running or user define mode */
    uint32_t timer_clk;     /**< timer_clk: set the timer clock of timer. timer_clk = src_clk / divider */
    
}TIMER_InitTypeDef;

/**
 * @brief Initialize the timer according to the input param config. 
 * @param  src_clk: the src clock. Should always use the macro "APB_CLK0" defined in plf.h
 * @param  config: the structure to initialize the timer
 * @return This function has no return.
 */
void HAL_TIMER_Init(uint32_t src_clk, TIMER_InitTypeDef config);
/**
 * @brief Set the loadcounter of the timer
 * @param  index: define which timer to operate.
 * @param  count: the counter is 24bit.
 * @return This function has no return.
 */
void HAL_TIMER_Set_LoadCount(Timer_Index index, uint32_t count);
/**
 * @brief Enable or disable the timer. When enabled, the counter starts counting down from the loadcounter to 0
 * @param  index: define which timer to operate.
 * @param  en: Enable or disable the timer.
 * @return This function has no return.
 */
void HAL_TIMER_Enable(Timer_Index index, Timer_Enable en);
/**
 * @brief Get the interrupt status of specific timer.
 * @param  index: define which timer to operate.
 * @return return 1 means a timer interrupt is active, else inactive.
 */
uint8_t HAL_TIMER_Int_Status(Timer_Index index);
/**
 * @brief Clear the interrupt status of specific timer.
 * @param  index: define which timer to operate.
 * @return This function has no return.
 */
void HAL_TIMER_Int_Clr(Timer_Index index);
/**
 * @brief Get the current counter of specific timer.
 * @param  index: define which timer to operate.
 * @return It return the current count value. 
 */
uint32_t HAL_TIMER_Current_Value(Timer_Index index);
/**
 * @brief Configure and enable the pwm function of timer. Timer should be initialize before using this function. For details please refer to examples.
          And iomux of pwm should be configed by user. Timer use pwm0-pwm3 in function io
 * @param  index: define which timer to operate.
 * @param  high_count: 24bit counter to define high period of pwm
 * @param  low_count: 24bit counter to define low period of pwm
 * @return This function has no return.
 */
void HAL_TIMER_PWM_Enable(Timer_Index index, uint32_t high_count, uint32_t low_count);
/**
 * @brief Disable the Timer PWM
 * @param  index: define which timer to operate.
 * @return This function has no return.
 */
void HAL_TIMER_PWM_Disable(Timer_Index index);

#endif

/// @} TIMER

