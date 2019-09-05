/**
 ****************************************************************************************
 *
 * @file rtc.c
 *
 * @brief Realtime clock driver interface
 *
 * (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
 *          ALL RIGHTS RESERVED
 *
 ****************************************************************************************
 */



/**
 ****************************************************************************************
 * @addtogroup RTC
 * @ingroup DRIVERS
 * @brief RTC Drivers.
 *        RTC should be calibrated. It's users responsible to set the calibrated counter to rtc counter.
 * @{
 ****************************************************************************************
 */


#ifndef RTC_H
#define RTC_H
#include <stdint.h>



/**
 * @brief Set whether the counter should wrap when a match occurs instead of waiting until the maximum count is reached.
 */
typedef enum
{
    rtc_wrap_disable = 0,
    rtc_wrap_enable,
}RTC_WrapEn;

/**
 * @brief Set the int mask of rtc module.
 */
typedef enum
{
    rtc_int_unmask = 0,
    rtc_int_mask,
}RTC_IntMask;

/**
 * @brief Enable or disable the interrupt of rtc.
 */
typedef enum
{
    rtc_int_disable = 0,
    rtc_int_enable,
}RTC_IntEn;

/**
 * @brief Enable or disable counter of rtc.
 */
typedef enum
{
    rtc_disable = 0,
    rtc_enable
}RTC_Enable;


/**
 * @brief Struct to define parameter of RTC. 
 */
typedef struct
{
    uint32_t counter_match;         ///**< counter_match: 32bit. When RTC start counting from counter_load to counter_match a interrupt will occur if interrupt is enabled. */
    uint32_t counter_load;          ///**< counter_load: 32bit. Set from where the rtc counter start counting from */
    RTC_WrapEn wrap_en;             ///**< wrap_en: Set whether the counter should wrap when a match occurs instead of waiting until the maximum count is reached. */
    RTC_IntMask int_mask;           ///**< int_mask: mask the interrupt or not */
    RTC_IntEn int_en;               ///**< int_en: enable the interrupt or not */
}RTC_InitTypeDef;

/**
 * @brief  Get the current value of the internal counter.
 * @return return the interal counter of rtc.
 */
uint32_t HAL_RTC_GetCurValue(void);
/**
 * @brief  Set the match counter of rtc.
 * @param  matchCounter: the match counter of rtc. 
 *         The rtc counter always count forward. when the load counter reach the match counter an interrupt will trigger.
 * @return This function has no return value.
 */
void HAL_RTC_SetMatchCounter(uint32_t matchCounter);
/**
 * @brief  Set the load counter of rtc.
 * @param  loadCounter: the load counter of rtc. It is the value where rtc start counting forward
 * @return This function has no return value.
 */
void HAL_RTC_SetLoadCounter(uint32_t loadCounter);
/**
 * @brief  To force the counter to wrap when a match occurs
 * @param  en: 1 to enable a wrap, 0 to disable a wrap
 * @return This function has no return value.
 */
void HAL_RTC_Wrap(uint8_t en);
/**
 * @brief  Enable the RTC counter.
 * @param  en: 1 to enable the counter, 0 to disable the counter
 * @return This function has no return value.
 */
void HAL_RTC_Enable(uint8_t en);
/**
 * @brief  Set whether to mask the rtc interrupt or not
 * @param  en: 1 to mask the interrupt, 0 to unmask the interrupt
 * @return This function has no return value.
 */
void HAL_RTC_Irq_Mask(uint8_t en);
/**
 * @brief  Set whether to enable the rtc interrupt or not
 * @param  en: 1 to enable the interrupt, 0 to disable the interrupt
 * @return This function has no return value.
 */
void HAL_RTC_Irq_Enable(uint8_t en);
/**
 * @brief  Get the status of rtc interrupt, after the mask
 * @return The interrupt status after the int mask. 1 means interrupt is active, 0 means interrupt is inactive.
 */
uint8_t HAL_RTC_GetIrqStatus(void);
/**
 * @brief  Get the raw status of rtc interrupt, before the mask
 * @return The interrupt status before the int mask. 1 means interrupt is active, 0 means interrupt is inactive.
 */
uint8_t HAL_RTC_GetIrqRawStatus(void);
/**
 * @brief  Clear rtc interrupt
 * @return This function has no return value.
 */
void HAL_RTC_ClearIrq(void);
/**
 * @brief Initialize the RTC
 * @param config: Struct to define parameter of RTC. 
 * @return This function has no return value.
 */
void HAL_RTC_Init(RTC_InitTypeDef config);

#endif


/// @} RTC

