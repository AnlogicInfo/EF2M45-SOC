/**
****************************************************************************************
*
* @file adcc.h
*
* @brief adc driver interface.
*
* (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
*          ALL RIGHTS RESERVED
*
****************************************************************************************
*/

 
 
/**
****************************************************************************************
* @defgroup ADC
* @ingroup DRIVERS
* @brief ADC Drivers.
****************************************************************************************
*/

#ifndef ADCC_H
#define ADCC_H

#include <stdint.h>
#include "_reg_base_addr.h"

#define SINGLE_ADCM_DMA_ADDRESS ((void *)(REG_ADCC_M_BASE+0x40))   
#define SINGLE_ADCS_DMA_ADDRESS ((void *)(REG_ADCC_S_BASE+0x40)) 
#define MULTI_ADC_DMA_ADDRESS ((void *)(REG_ADCC_M_BASE+0x308))

/**
 * @brief This is the struct to initialize the ADC module.
 */
typedef struct
{   
    uint32_t adc_clk;                /**< adc_clk: set the clock of adc module */
    uint8_t align;				/**< align: 0: right align 1: left align */
}ADCC_InitTypeDef;

/**
 * @brief enum of ADC channel. adc master and adc slave have 8 channel seperately
 */
typedef enum
{
    ADC_IN0 = 0,
    ADC_IN1,
    ADC_IN2,
    ADC_IN3,
    ADC_IN4,
    ADC_IN5,
    ADC_IN6,
    ADC_IN7
}ADCC_Channel;

/**
 * @brief enum of ADC Interrupt setting. 
 */
typedef enum
{
    ADC_INT_EOS = 1,		/**< ADC_INT_EOS: end of scan */
    ADC_INT_EOC = 2,		/**< ADC_INT_EOC: end of convert */
    ADC_INT_OVERRUN = 8,		/**< ADC_INT_OVERRUN: adc oversampling interrupt */
}ADCC_IntSetting;

/**
 * @brief enum of ADC Work Mode.  Set ADC to work in single sampling mode or continuous sampling mode.
 */
typedef enum
{
    ADCC_SINGLE_MODE = 0,
    ADCC_CONTINUOUS_MODE
}ADCC_WorkMode;

/**
 * @brief ADC DMA Enable or Disable. 
 */
typedef enum
{
    ADCC_DMA_DISABLE = 0,
    ADCC_DMA_ENABLE
}ADCC_DMAEn;

/**
 * @brief enum of ADC Trigger Source.
 */
typedef enum
{
    ADCC_TRIG_TIMER= 0,
    ADCC_TRIG_SW,
    ADCC_TRIG_EXT
}ADCC_TrigSrc;

/**
 * @brief Enable or disable ADC trigger function.
 */
typedef enum
{
    ADCC_Trig_Disable = 0,
    ADCC_Trig_Enable
}ADCC_TrigEn;

/**
 * @brief Set the mode of adc timer using to trigger the sampling
 */
typedef enum
{
    ADCC_Trg_Periodic = 0,				/**< ADCC_Trg_Periodic: trigger periodically */
    ADCC_Trg_Once					/**< ADCC_Trg_Once: trigger only once */
}ADCC_TmrMode;

/**
 * @brief enum of dual AD working mode.
 */
typedef enum
{
    ADCC_INDEPENDENT_MODE = 0,
    ADCC_SIMUlTANEOUS_MODE
}ADCC_DualAD_Mode;

/**
 * @brief Enable or disable dma when using dual AD
 */
typedef enum
{
    ADCC_DMA_DUALAD_DISABLE = 0,
    ADCC_DMA_DUALAD_ENABLE
}ADCC_DualAD_DMA;

/**
 * @brief Adc initialize.
 * @param src_clk: set the input clock of adc module.
 * @param config: set the input clock of adc module.
 * @return This function has no return value.
 */
void HAL_ADCCM_Init(uint32_t src_clk, ADCC_InitTypeDef config);
/**
 * @brief Start a single channel adc sampling. The function return only when the adc sampling finished and return the result.
 * @param channel_num: set the channel to sample.
 * @return the sample result of adc.
 */
uint16_t HAL_ADCCM_Single_Channel_Polling(ADCC_Channel channel_num);
/**
 * @brief Adc single channel sampling none blocking mode
 * @param channel_num: set the channel to sample.
 * @param mode: set the working mode. SINGLE_MODE or CONTINUOUS_MODE.
 * @param setting: interrupt settings.
 * @return This function has no return value.
 */
void HAL_ADCCM_Single_Channel(ADCC_Channel channel_num,  ADCC_WorkMode mode, ADCC_IntSetting setting);
/**
 * @brief Get the adc sampling result of specific channel
 * @param channel_num: the channel which to get the result.
 * @return the sample result of adc.
 */
uint16_t HAL_ADCCM_Get_Channel_Result(ADCC_Channel channel_num);
/**
 * @brief Set the working mode of adc.
 * @param mode: set the working mode. SINGLE_MODE or CONTINUOUS_MODE.
 * @return This function has no return value.
 */
void HAL_ADCCM_WorkMode(ADCC_WorkMode mode);
/**
 * @brief Start adc sampling
 * @return This function has no return value.
 */
void HAL_ADCCM_ADC_Start(void);
/**
 * @brief Stop adc sampling
 * @return This function has no return value.
 */
void HAL_ADCCM_ADC_Stop(void);
/**
 * @brief Set the sequance of sampling when adc work in multiple channel (scan mode)
 * @param len: how many channels to scan.
 * @param sq0: set squence no.0
 * @param sq1: set squence no.1
 * @param sq2: set squence no.2
 * @param sq3: set squence no.3
 * @param sq4: set squence no.4
 * @param sq5: set squence no.5
 * @param sq6: set squence no.6
 * @param sq7: set squence no.7    
 * @return This function has no return value.
 */
void HAL_ADCCM_Set_ADC_Squence(uint8_t len, uint8_t sq0, uint8_t sq1, uint8_t sq2, uint8_t sq3, 
                                                        uint8_t sq4, uint8_t sq5, uint8_t sq6, uint8_t sq7);
/**
 * @brief Enable DMA mode or not
 * @param en: enable or disable dma of adc
 * @return This function has no return value.
 */
void HAL_ADCCM_DMA_En(ADCC_DMAEn en);
/**
 * @brief Get ADC Status
 * @return ADC Status.
 */
uint32_t HAL_ADCCM_Get_ADC_Status(void);
/**
 * @brief Get ADC OverRun channel map.
 * @return The bit map of channel which is over runned.
 */
uint8_t HAL_ADCCM_OverRun_Channel_Map(void);
/**
 * @brief Get ADC valid channel map.
 * @return The bit map of channel whose sampling data is valid.
 */
uint8_t HAL_ADCCM_Valid_Channel_Map(void);
/**
 * @brief Get ADC running channel map.
 * @return The bit map of channel which is still running.
 */
ADCC_Channel HAL_ADCCM_Channel_Run_Get(void);
/**
 * @brief Get ADC Data register. See regmap for detail
 * @return The value of ADC Data register.
 */
uint32_t HAL_ADCCM_Get_ADC_Data(void);
/**
 * @brief Set the Trigger source and enable the gate of trigger. 
 * @param src: set the trigger source.
 * @param en: enable or disable the gate of trigger
 * @return This function has no return value.
 */
void HAL_ADCCM_Set_TrgSrc(ADCC_TrigSrc src, ADCC_TrigEn en);
/**
 * @brief Enable the ADC software trigger
 * @param en: enable or disable the trigger
 * @return This function has no return value.
 */
void HAL_ADCCM_SW_Trigger(ADCC_TrigEn en);
/**
 * @brief Enable the ADC timer trigger
 * @param mode: set the timer mode, trigger periodic or trigger once.
 * @param counter: set the counter from which to count down.
 * @return This function has no return value.
 */
void HAL_ADCCM_Timer_Trigger(ADCC_TmrMode mode, uint32_t counter);
/**
 * @brief Start the ADC timer
 * @return This function has no return value.
 */
void HAL_ADCCM_Start_Timer_Trg(void);
/**
 * @brief Stop the ADC timer
 * @return This function has no return value.
 */
void HAL_ADCCM_Stop_Timer_Trg(void);
/**
 * @brief Get current counter of adc timer
 * @return the current counter value.
 */
uint32_t HAL_ADCCM_Get_Current_CNT(void);
/**
 * @brief Get ADC CSR register
 * @return ADC CSR register value
 */
uint32_t HAL_ADCCM_Get_ADC_CSR(void);
/**
 * @brief Get ADC CCR register
 * @return ADC CCR register value
 */
uint32_t HAL_ADCCM_Get_ADC_CCR(void);
/**
 * @brief Set the multiple ADC configuration
 * @param mode: set the dual adc to work in independent mode or simultaneous mode
 * @param en: Enable dma or not.
 * @return This function has no return value.
 */
void HAL_ADCCM_MultiADC_Cfg(ADCC_DualAD_Mode mode, ADCC_DualAD_DMA en );
/**
 * @brief Get ADC CDR register
 * @return ADC CDR register value
 */
uint32_t HAL_ADCCM_Get_ADC_CDR(void);

/**
 * @brief Adc initialize.
 * @param src_clk: set the input clock of adc module.
 * @param config: set the input clock of adc module.
 * @return This function has no return value.
 */
void HAL_ADCCS_Init(uint32_t src_clk, ADCC_InitTypeDef config);
/**
 * @brief Start a single channel adc sampling. The function return only when the adc sampling finished and return the result.
 * @param channel_num: set the channel to sample.
 * @return the sample result of adc.
 */
uint16_t HAL_ADCCS_Single_Channel_Polling(ADCC_Channel channel_num);
/**
 * @brief Adc single channel sampling none blocking mode
 * @param channel_num: set the channel to sample.
 * @param mode: set the working mode. SINGLE_MODE or CONTINUOUS_MODE.
 * @param setting: interrupt settings.
 * @return This function has no return value.
 */
void HAL_ADCCS_Single_Channel(ADCC_Channel channel_num,  ADCC_WorkMode mode, ADCC_IntSetting setting);
/**
 * @brief Get the adc sampling result of specific channel
 * @param channel_num: the channel which to get the result.
 * @return the sample result of adc.
 */
uint16_t HAL_ADCCS_Get_Channel_Result(ADCC_Channel channel_num);
/**
 * @brief Set the working mode of adc.
 * @param mode: set the working mode. SINGLE_MODE or CONTINUOUS_MODE.
 * @return This function has no return value.
 */
void HAL_ADCCS_WorkMode(ADCC_WorkMode mode);
/**
 * @brief Start adc sampling
 * @return This function has no return value.
 */
void HAL_ADCCS_ADC_Start(void);
/**
 * @brief Stop adc sampling
 * @return This function has no return value.
 */
void HAL_ADCCS_ADC_Stop(void);
/**
 * @brief Set the sequance of sampling when adc work in multiple channel (scan mode)
 * @param len: how many channels to scan.
 * @param sq0: set squence no.0
 * @param sq1: set squence no.1
 * @param sq2: set squence no.2
 * @param sq3: set squence no.3
 * @param sq4: set squence no.4
 * @param sq5: set squence no.5
 * @param sq6: set squence no.6
 * @param sq7: set squence no.7    
 * @return This function has no return value.
 */
void HAL_ADCCS_Set_ADC_Squence(uint8_t len, uint8_t sq0, uint8_t sq1, uint8_t sq2, uint8_t sq3, 
                                                        uint8_t sq4, uint8_t sq5, uint8_t sq6, uint8_t sq7);
/**
 * @brief Enable DMA mode or not
 * @param en: enable or disable dma of adc
 * @return This function has no return value.
 */
void HAL_ADCCS_DMA_En(ADCC_DMAEn en);
/**
 * @brief Get ADC Status
 * @return ADC Status.
 */
uint32_t HAL_ADCCS_Get_ADC_Status(void);
/**
 * @brief Get ADC OverRun channel map.
 * @return The bit map of channel which is over runned.
 */
uint8_t HAL_ADCCS_OverRun_Channel_Map(void);
/**
 * @brief Get ADC valid channel map.
 * @return The bit map of channel whose sampling data is valid.
 */
uint8_t HAL_ADCCS_Valid_Channel_Map(void);
/**
 * @brief Get ADC running channel map.
 * @return The bit map of channel which is still running.
 */
ADCC_Channel HAL_ADCCS_Channel_Run_Get(void);
/**
 * @brief Get ADC Data register. See regmap for detail
 * @return The value of ADC Data register.
 */
uint32_t HAL_ADCCS_Get_ADC_Data(void);
/**
 * @brief Set the Trigger source and enable the gate of trigger. 
 * @param src: set the trigger source.
 * @param en: enable or disable the gate of trigger
 * @return This function has no return value.
 */
void HAL_ADCCS_Set_TrgSrc(ADCC_TrigSrc src, ADCC_TrigEn en);
/**
 * @brief Enable the ADC software trigger
 * @param en: enable or disable the trigger
 * @return This function has no return value.
 */
void HAL_ADCCS_SW_Trigger(ADCC_TrigEn en);
/**
 * @brief Enable the ADC timer trigger
 * @param mode: set the timer mode, trigger periodic or trigger once.
 * @param counter: set the counter from which to count down.
 * @return This function has no return value.
 */
void HAL_ADCCS_Timer_Trigger(ADCC_TmrMode mode, uint32_t counter);
/**
 * @brief Start the ADC timer
 * @return This function has no return value.
 */
void HAL_ADCCS_Start_Timer_Trg(void);
/**
 * @brief Stop the ADC timer
 * @return This function has no return value.
 */
void HAL_ADCCS_Stop_Timer_Trg(void);
/**
 * @brief Get current counter of adc timer
 * @return the current counter value.
 */
uint32_t HAL_ADCCS_Get_Current_CNT(void);

#endif
/// @} ADC

