#ifndef SPI_COMMON_H
#define SPI_COMMON_H

typedef enum{
	Standard_SPI_Format = 0,
	Dual_SPI_Format = 1,
	Quad_SPI_Format = 2,
}SPI_FORMAT;

typedef enum{
	DFS_32_4_bits = 3,
	DFS_32_5_bits ,
	DFS_32_6_bits ,
	DFS_32_7_bits ,
	DFS_32_8_bits ,
	DFS_32_9_bits ,
	DFS_32_10_bits ,
	DFS_32_11_bits ,
	DFS_32_12_bits ,
	DFS_32_13_bits ,
	DFS_32_14_bits ,
	DFS_32_15_bits ,
	DFS_32_16_bits ,
	DFS_32_17_bits ,
	DFS_32_18_bits ,
	DFS_32_19_bits ,
	DFS_32_20_bits ,
	DFS_32_21_bits ,
	DFS_32_22_bits ,
	DFS_32_23_bits ,
	DFS_32_24_bits ,
	DFS_32_25_bits ,
	DFS_32_26_bits ,
	DFS_32_27_bits ,
	DFS_32_28_bits ,
	DFS_32_29_bits ,
	DFS_32_30_bits ,
	DFS_32_31_bits ,
	DFS_32_32_bits 
}SPI_DATAFRAME_SIZE;

typedef enum{
	Control_Word_1_bit = 0,
	Control_Word_2_bit ,
	Control_Word_3_bit ,
	Control_Word_4_bit ,
	Control_Word_5_bit ,
	Control_Word_6_bit ,
	Control_Word_7_bit ,
	Control_Word_8_bit ,
	Control_Word_9_bit ,
	Control_Word_10_bit ,
	Control_Word_11_bit ,
	Control_Word_12_bit ,
	Control_Word_13_bit ,
	Control_Word_14_bit ,
	Control_Word_15_bit ,
	Control_Word_16_bit ,
}SPI_CONTROLFRAME_SIZE;

typedef enum{
	Slave_txd_Enabled = 0,
	Slave_txd_Disabled
}SPI_SLV_OUTPUT_ENABLE;

typedef enum{
	Transmit_and_Receive = 0,
	Transmit_Only,
	Receive_Only,
	EEPROM_Read
}SPI_TRAMSMIT_MODE;

typedef enum{
	Inactive_Low = 0,
	Inactive_High
}SPI_CLOCK_POLARITY;

typedef enum{
	SCLK_Toggle_In_Middle = 0,
	SCLK_Toggle_At_Start
}SPI_CLOCK_PHASE;
typedef enum{
	Motorola_SPI = 0,
	Texas_Instruments_SSP,
	National_Semiconductors_Microwire,
}SPI_PROTOCOL_TYPE;

typedef enum{
	Microwire_Receive = 0,
	Microwire_Transmit
}SPI_MICROWIRE_CONTROL;
typedef enum{
	Non_Sequential_Transfer = 0,
	Sequential_Transfer
}SPI_MICROWIRE_MODE;
typedef enum
{
	SSI_Disabled = 0,
	SSI_Enabled
}SPI_EN;
typedef enum
{
	No_Transmit_Data_Collision_Error = 0,
	Transmit_Data_Collision_Error
}SPI_STATUS_DCOL;
typedef enum
{
	No_Transmission_Error = 0,
	Transmission_Error
}SPI_STATUS_TXE;
typedef enum
{
	Receive_FIFO_Not_Full = 0,
	Receive_FIFO_Full
}SPI_STATUS_RFF;
typedef enum
{
	Receive_FIFO_Empty = 0,
	Receive_FIFO_Not_Empty
}SPI_STATUS_RFNE;
typedef enum
{
	Transmit_FIFO_Not_Empty = 0,
	Transmit_FIFO_Empty
}SPI_STATUS_TFE;
typedef enum
{
	Transmit_FIFO_Full = 0,
	Transmit_FIFO_Not_Full
}SPI_STATUS_TFNF;
typedef enum
{
	SSI_Idle_or_Disabled = 0,
	SSI_Busy
}SPI_STATUS_BUSY;
typedef enum
{
	Transmit_DMA_Disabled = 0,
	Transmit_DMA_Enabled
}SPI_TXDMA_EN;
typedef enum
{
	Receive_DMA_Disabled = 0,
	Receive_DMA_Enabled
}SPI_RXDMA_EN;

#endif
