/**
 ****************************************************************************************
 *
 * @file wdt.c
 *
 * @brief Watch dog driver interface
 *
 * (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
 *          ALL RIGHTS RESERVED
 *
 ****************************************************************************************
 */



/**
 ****************************************************************************************
 * @defgroup WDT
 * @ingroup DRIVERS
 * @brief Watch Dog Drivers.
 *        Watch Dog can be used to reset cpu when something unexpected happens.
 * @{
 ****************************************************************************************
 */

#ifndef WDT_H
#define WDT_H

#include <stdint.h>

/**
 * @brief Watch dog has two reset mode.
 */
typedef enum 
{
    wdt_Direct_Reset = 0,           ///**< wdt_Direct_Reset: watch dog will directly reset the mcu as soon as watch dog triggerred */
    wdt_Irq_Reset = 1               ///**< wdt_Irq_Reset: watch dog will first trigger an interrupt. if we don't reset watch dog after another period of time, it will reset mcu */
}WDT_ResetMode;

/**
 * @brief Define the pulse width to reset the mcu
 */
typedef enum
{
    wdt_2_pclk_cycles = 0,
    wdt_4_pclk_cycles,
    wdt_8_pclk_cycles,
    wdt_16_pclk_cycles,
    wdt_32_pclk_cycles,
    wdt_64_pclk_cycles,
    wdt_128_pclk_cycles,
    wdt_256_pclk_cycles,
    wdt_Max_pclk_cycles = 0x8
}WDT_ResetPulse;

/**
 * @brief Define the how many pclk to wait before wdt int trigger. For example wdt_period_3FF means the period wdt int trigger is 0x3ff cycles
 */
typedef enum
{
    wdt_period_FF = 0,
    wdt_period_1FF = 1,
    wdt_period_3FF = 2,
    wdt_period_7FF = 3,
    wdt_period_1FFF = 5,
    wdt_period_3FFF = 6,
    wdt_period_7FFF = 7,
    wdt_period_FFFF = 8,
    wdt_period_1FFFF = 9,
    wdt_period_3FFFF = 10,
    wdt_period_7FFFF = 11,
    wdt_period_FFFFF = 12,
    wdt_period_1FFFFF = 13,
    wdt_period_3FFFFF = 14,
    wdt_period_7FFFFF = 15
}WDT_TimeoutPeriod;


/**
 * @brief Struct to define parameter of watch dog. 
 */
typedef struct
{
		WDT_ResetMode   mode;
		WDT_ResetPulse  pulse_width;
		WDT_TimeoutPeriod period;
}WDT_InitTypeDef;

/**
 * @brief Enable the watch dog. Once enabled it cannot be disabled.
 * @return This function has no return value.
 */
void HAL_WDT_Enable(void);
/**
 * @brief Set the watch dog timeout period
 * @param  period: the period to trigger an wdt interrupt. For example wdt_period_3FF means the period wdt int trigger is 0x3ff cycles
 * @return This function has no return value.
 */
void HAL_WDT_SetTimeoutPeriod(WDT_TimeoutPeriod period);
/**
 * @brief Clears the watchdog interrupt. This can be used to clear the interrupt without restarting the watchdog counter.
 * @return return 1 when an interrupt is triggered.
 */
uint8_t HAL_WDT_ClrIRQ(void);
/**
 * @brief Get the current value of the internal counter
 * @return return the current value of the internal counter.
 */
uint16_t HAL_WDT_CurrentCounter(void);
/**
 * @brief To restart the WDT counter
 * @return This function has no return value.
 */
void HAL_WDT_Restart(void);
/**
 * @brief To get the interrupt status of the WDT.
 * @return return the interrupt status. 0 means interrupt is inactive, 1 means interrupt is active.
 */
uint8_t HAL_WDT_IntStatus(void);
/**
 * @brief Initialize the watch dog
 * @param config: Struct to define parameter of watch dog. 
 * @return This function has no return value.
 */
void HAL_WDT_Init(WDT_InitTypeDef config);

#endif


/// @} WDT

