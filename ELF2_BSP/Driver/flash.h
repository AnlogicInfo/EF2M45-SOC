#ifndef FLASH_H_
#define FLASH_H_

#include <stdint.h>

#define FLASH_QUAD_READ_DUMMY_CLOCKS 8
#define FLASH_READ_MAX_BYTES (QSPI_READ_MAX_LENGTH*sizeof(uint32_t))
#define FLASH_MAX_SIZE			0x200000        //2M byte flash
#define BLOCK_64K               65536
#define FLASH_PAGE_SIZE               256


typedef enum
{
    FLASH_WRITE_STATUS_REGISTER_1 = 0x01,
//  FLASH_WRITE_STATUS_REGISTER_2 = 0x31,
//  FLASH_WRITE_STATUS_REGISTER_3 = 0x11,
    FLASH_PAGE_PROGRAM = 0x02,
    FLASH_READ_DATA_BYTES = 0x03,
    FLASH_WRITE_DISABLE = 0x04,
    FLASH_READ_STATUS_REGISTER_1 = 0x05,
    FLASH_READ_STATUS_REGISTER_2 = 0x35,
//  FLASH_READ_STATUS_REGISTER_3 = 0x15,
    FLASH_WRITE_ENABLE = 0x06,
    FLASH_QUAL_OUTPUT_FAST_READ = 0x3B,
    FLASH_QUAD_OUTPUT_FAST_READ = 0x6B,
    FLASH_SECTOR_ERASE = 0x20,
    FLASH_32KB_BLOCK_ERASE = 0x52,
    FLASH_64KB_BLOCK_ERASE = 0xd8,
    FLASH_CHIP_ERASE = 0x60,
}FLASH_Cmd;


typedef enum{
    Sector_Erase,
    Block_32KB_Erase,
    Block_64KB_Erase,
    Chip_Erase,
}FLASH_Erase_Type;


typedef struct flash_replace{
    uint8_t offset;
    uint8_t data;
}FLASH_Replace;


/*
 * FUNCTION DECLARATIONS
 ****************************************************************************************
 */

/**
 ****************************************************************************************
 * @brief Initialize flash driver.
 ****************************************************************************************
 */
void FLASH_Init(void);
void FLASH_Deinit(void);
/**
 ****************************************************************************************
 * @brief   Read a flash section.
 *
 * This function is used to read a part of the flash memory.
 * 
 * Note: callback parameter is not used
 *
 * @param[in]    offset      Starting offset from the beginning of the flash device
 * @param[in]    length      Size of the portion of flash to read
 * @param[out]   buffer      Pointer on data to read
 * @return       status      0 if operation can start successfully
 ****************************************************************************************
 */
uint8_t FLASH_Read(uint32_t offset, uint32_t length, uint8_t *buffer);

uint8_t FLASH_Erase_Block(uint32_t offset, FLASH_Erase_Type type);

/**
 ****************************************************************************************
 * @brief   Erase a flash section.
 *
 * This function is used to erase a part of the flash memory.
 * 
 * Note: callback parameter is not used
 *
 * @param[in]    offset      Starting offset from the beginning of the flash device
 * @param[in]    type        Erase command
 * @return       status      0 if operation can start successfully
 ****************************************************************************************
 */

uint8_t FLASH_Erase(uint32_t offset, uint32_t length);

/**
 ****************************************************************************************
 * @brief   Write a flash section.
 *
 * This function is used to write a part of the flash memory.
 * 
 * Note: callback parameter is not used
 *
 * @param[in]    offset      Starting offset from the beginning of the flash device
 * @param[in]    length      Size of the portion of flash to write
 * @param[in]    buffer      Pointer on data to write
 * @return       status      0 if operation can start successfully
 ****************************************************************************************
 */
uint8_t FLASH_Program(uint32_t offset, uint32_t length, uint8_t *buffer);

uint8_t FLASH_Program_JFlash(uint32_t offset, uint32_t length, uint8_t *buffer);

uint8_t FLASH_Dual_Read(uint32_t offset, uint32_t length, uint8_t *buffer);


uint8_t FLASH_Quad_Read(uint32_t offset, uint32_t length, uint8_t *buffer);

uint8_t FLASH_Quad_Enable(void);


#endif
