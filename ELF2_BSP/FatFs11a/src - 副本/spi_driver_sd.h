#ifndef SPI_DRIVER_H
#define SPI_DRIVER_H
#include <stdio.h>
#include <stdint.h>
int SPI_SD_Initial(void);
int SPI_SD_ReadSingleBlock(uint32_t sector, uint8_t *buffer);
int SPI_SD_ReadMultiBlock(uint32_t sector, uint8_t *buffer, uint32_t NbrOfSector);

 


#endif
