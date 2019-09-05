/**
 ****************************************************************************************
 *
 * @file hal_extint.h
 *
 * @brief driver of external interrupt.
 *
 * (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
 *          ALL RIGHTS RESERVED
 *
 ****************************************************************************************
 */



/**
 ****************************************************************************************
 * @addtogroup EXTI
 * @ingroup DRIVERS
 * @brief External interrupt Drivers. Compared to gpio, the exti can trigger during deep sleep and wakeup cpu. GPIO cannot do that.
 * @{
 ****************************************************************************************
 */


#ifndef _EXTI_H_
#define _EXTI_H_

#include <stdint.h>
#include <stdbool.h>

/**
 * @brief Trigger type of external interrupt.
 */
typedef enum
{
    HIGH_LEVEL = 0,
    LOW_LEVEL,
    POSITIVE_EDGE,
    NEGETIVE_EDGE
}EXTI_Trig_Type;

/**
 * @brief There are totally 8 external interrupt pin
 */
typedef enum
{
    EXT_INT_0 = 0,
    EXT_INT_1,
    EXT_INT_2,
    EXT_INT_3,
    EXT_INT_4,
    EXT_INT_5,
    EXT_INT_6,
    EXT_INT_7,
    EXT_INT_8,
    EXT_INT_9,
    EXT_INT_10,
    EXT_INT_11,
    EXT_INT_12,
    EXT_INT_13,
    EXT_INT_14,
    EXT_INT_15,
}EXTI_IntSrc;


/**
 * @brief This is the struct to initialize the external interrupt module.
 */
typedef struct
{
    EXTI_IntSrc src;                /**< src: select which external interrupt to config */
    EXTI_Trig_Type type;            /**< type: select the trigger type of the interrupt */
    bool int_en;                    /**< int_en: enable the interrupt */
}EXTI_InitTypeDef;



/**
 * @brief enable the interrupt.
 * @param  int_src: specify the interrupt source to operate
 * @param  type: select the trigger type.
 * @return This function has no return.
 */
void HAL_EXTI_Trig(EXTI_IntSrc int_src, EXTI_Trig_Type type);			//should be set one by one
/**
 * @brief Get the raw interrupt status of external interrupt.
 * @return return the raw interrupt status.
 */
uint16_t HAL_EXTI_RawInrp_Value(void);
/**
 * @brief Get the interrupt status of external interrupt.
 * @return return the interrupt status.
 */
uint16_t HAL_EXTI_Inrp_Value(void);
/**
 * @brief Clear the external interrupt.
 * @param  int_src: specify the interrupt source to operate
 * @return This function has no return.
 */
void HAL_EXTI_IntClr(EXTI_IntSrc int_src);
/**
 * @brief Get the status which pin is enabled as the external interrupt pin.
 * @param  pin_src: output which pin is select as the interrupt pin
 * @param  enabled_int: output which interrupt is enabled.
 * @return This function has no return.
 */
void HAL_EXTI_IntPin_Get(uint16_t *pin_src, uint16_t *enabled_int);
/**
 * @brief Initialize the external interrupt according to the input param config. 
 * @param  config: the structure to initialize the external interrupt module.
 * @return This function has no return.
 */
void HAL_EXTI_Init(EXTI_InitTypeDef config);
/**
 * @brief Deinit the specific external interrupt and the pad become normal gpio
 * @param  int_src: specify the interrupt source to operate
 * @return This function has no return.
 */
void HAL_EXTI_Deinit(EXTI_IntSrc int_src);


#endif

/// @} EXTI


