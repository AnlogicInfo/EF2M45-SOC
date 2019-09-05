/**
****************************************************************************************
*
* @file i2s.h
*
* @brief i2s(IIS) driver interface, this i2s can only work as slave.
*
* (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
*          ALL RIGHTS RESERVED
*
****************************************************************************************
*/

 
 
/**
****************************************************************************************
* @defgroup I2S
* @ingroup DRIVERS
* @brief I2S Drivers.
*        I2S can be used to tranfer mainly audio data
* @{
****************************************************************************************
*/


#ifndef I2S_H
#define I2S_H
#include <stdint.h>

#define I2S_RX_FIFO_DEPTH           8   
#define I2S_TX_FIFO_DEPTH           8


/**
 * @brief enum of I2S Enable and I2S Disable.
 */
typedef enum
{
    I2S_DISABLE = 0,
    I2S_ENABLE = 1
}I2S_En;

/**
 * @brief enum of I2S Tx Enable and Tx Disable.
 */
typedef enum
{
    I2S_TX_DISABLE = 0,
    I2S_TX_ENABLE = 1
}I2S_TX_En;

/**
 * @brief enum of I2S Rx Enable and Rx Disable.
 */
typedef enum
{
    I2S_RX_DISABLE = 0,
    I2S_RX_ENABLE = 1
}I2S_RX_En;

/**
 * @brief enum of I2S Resolution, can be defined to 12bit, 16bit, 20bit, 24bit and 32bit.
 */
typedef enum
{
    I2S_WORD_LENGTH_NONE = 0,
    I2S_WORD_LENGTH_12BIT,
    I2S_WORD_LENGTH_16BIT,
    I2S_WORD_LENGTH_20BIT,
    I2S_WORD_LENGTH_24BIT,
    I2S_WORD_LENGTH_32BIT
}I2S_Resolution;



/**
 * @brief enum of I2S Int status.
 */
typedef enum
{
    I2S_RX_DATA_AVALIABLE = 0x1,
    I2S_RX_FIFO_OVERRUN = 0x2,
    I2S_TX_FIFO_EMPTY_LVL_REACHED = 0x10,
    I2S_TX_FIFO_OVERRUN = 0x20
}I2S_Int_Status;


/**
 * @brief enum of I2S Int Mask.
 */
typedef enum{
    I2S_MASK_RX_DATA_AVALIABLE = 0x1,
    I2S_MASK_RX_FIFO_OVERRUN = 0x2,
    I2S_MASK_TX_FIFO_EMPTY_LVL_REACHED = 0x10,
    I2S_MASK_TX_FIFO_OVERRUN = 0x20
}I2S_Int_Mask;


typedef enum
{
    I2S_16_CLOCK_CYCLES = 0,
    I2S_24_CLOCK_CYCLES,
    I2S_32_CLOCK_CYCLES
}I2S_Ws_Cycles;

typedef enum{
    I2S_NO_CLOCK_GATING = 0,
    I2S_GATE_AFTER_12CLK,
    I2S_GATE_AFTER_16CLK,
    I2S_GATE_AFTER_20CLK,
    I2S_GATE_AFTER_24CLK
}I2S_Gate_Cycles;


typedef struct
{
    I2S_Ws_Cycles   ws_cycle;
    I2S_Gate_Cycles clk_gate_num;   
}I2S_InitTypeDef;

/**
 * @brief Enable or Disable I2S module.
 * @param en: select from I2S_DISABLE and I2S_ENABLE
 * @return This function has no return value.
 */
void HAL_I2S_Enable(I2S_En en);
void HAL_I2S_DeInit(void);
void HAL_I2S_Init(I2S_InitTypeDef config);
/**
 * @brief Initialize i2s Tx
 * @param ch: select ch to initialize tx. Can be select from 0 to 1
 * @param resolution: resolution of i2s, select from enum I2S_Resolution.
 * @return This function has no return value.
 */
void HAL_I2S_Tx_Init(I2S_Resolution resolution);
/**
 * @brief Initialize i2s Rx
 * @param resolution: resolution of i2s, select from enum I2S_Resolution.
 * @return This function has no return value.
 */
void HAL_I2S_Rx_Init(I2S_Resolution resolution);
/**
 * @brief Write data to i2s. HAL_I2S_Tx_Init should be called in advance to finish tx initialize.
 * @param left_data: pointer to the data buffer of left side.
 * @param right_data: pointer to the data buffer of right side.
 * @param length: length of the data buffer. 
 * @return This function has no return value.
 */
void HAL_I2S_Write(uint32_t* left_data, uint32_t* right_data, uint32_t length);
/**
 * @brief Read data to i2s. HAL_I2S_Rx_Init should be called in advance to finish rx initialize.
 * @param left_data: pointer to the data buffer of left side.
 * @param right_data: pointer to the data buffer of right side.
 * @param length: length of the data buffer. 
 * @return This function has no return value.
 */
void HAL_I2S_Read(uint32_t* left_data, uint32_t* right_data, uint32_t length);
/**
 * @brief configure the interrupt settings of i2s
 * @param mask_map: bit map to mask the interrupt
 * @return This function has no return value.
 */
void HAL_I2S_INTConfig(uint8_t mask_map);
/**
 * @brief Get the interrupt status of i2s
 * @return return the bit map of int status. It is ored from enum I2S_Int_Status.
 */
uint8_t HAL_I2S_Int_Status(void);
/**
 * @brief Set the I2S Rx interrupt level
 * @param lvl: fifo level to trigger I2S_RX_DATA_AVALIABLE. The lvl should minus 1. For example, lvl = 3 means it trigger when 4 data enter.
 * @return This function has no return value.
 */
void HAL_I2S_RX_IntLvl(uint8_t lvl);
/**
 * @brief Set the I2S Tx interrupt level
 * @param lvl: fifo level to trigger I2S_TX_FIFO_EMPTY_LVL_REACHED. The lvl should minus 1. For example, lvl = 3 means it trigger when 4 data enter.
 * @return This function has no return value.
 */
void HAL_I2S_TX_IntLvl(uint8_t lvl);
/**
 * @brief Flush tx or rx fifo.
 * @param tx_flush: set 1 to flush tx fifo.
 * @param rx_flush: set 1 to flush rx fifo.
 * @return This function has no return value.
 */
void HAL_I2S_FIFO_Flush(uint8_t tx_flush, uint8_t rx_flush);
/**
 * @brief Clear rx over run interrupt
 * @return The return value indicate whether the rx overrun interrupt is triggered before this function called.
 */
uint8_t HAL_I2S_RX_OverRun_Clr(void);
/**
 * @brief Clear Tx over run interrupt
 * @return The return value indicate whether the tx overrun interrupt is triggered before this function called.
 */
uint8_t HAL_I2S_TX_OverRun_Clr(void);

#endif

/// @} I2S

