#ifndef CACHE_H_
#define CACHE_H_
/**
 ****************************************************************************************
 * @addtogroup FLASH
 * @ingroup DRIVERS
 * @brief
 *
 * @{
 ****************************************************************************************
 */
 #include <stdint.h>


/**
 * @brief Flash cache initialization.
 *
 * @param Base address of flash.
 */
void HAL_CACHE_Init(uint32_t flash_base_addr, uint16_t clk_divider, uint8_t rx_sample_dly);

/**
 * @brief Disable flash cache.
 */
void HAL_CACHE_Disable(uint16_t wait);

/**
 * @brief Flush cache block.
 * @param low_addr Lower address to flush.
 * @param high_addr Higher address to flush.
 */
void HAL_CACHE_Flush(uint32_t low_addr,uint32_t high_addr);

void HAL_CACHE_Flush_All(void);

/// @}

#endif
