
/**
****************************************************************************************
*
* @file hal_uart.h
*
* @brief uart0 and uart1 driver interface
*
* (C) COPYRIGHT 2015-2017 ANLOGIC Limited.
*          ALL RIGHTS RESERVED
*
****************************************************************************************
*/

 
 
/**
****************************************************************************************
* @defgroup UART
* @ingroup DRIVERS
* @brief UART Drivers.
*        UART can be used to tranfer data and also it can print log for debug.
* @{
****************************************************************************************
*/

#ifndef _UART_H_
#define _UART_H_

#include <stdint.h>
#include <stdbool.h>

/////////// Do not modify this section/////////////
#define UART_DLF_SIZE                     5
#define ROUND(x)                              (int)((x) + 0.5f)
#define UART_DIVISOR_INTEGER(CLK,BAUDRATE) (((CLK)/16)/(BAUDRATE))
#define UART_DIVISOR_FRACTIONAL(CLK,BAUDRATE) ((((CLK)/16.0f)/(BAUDRATE)) - UART_DIVISOR_INTEGER(CLK,BAUDRATE))
#define UART_DLF(CLK,BAUDRATE)         ROUND(UART_DIVISOR_FRACTIONAL(CLK,BAUDRATE)*(1<<UART_DLF_SIZE))
///////////////////////////////////////////////////

/**
 * @brief Uart Status definition. 
 */
#define STATUS_OK 0
#define STATUS_ERROR 1


/**
 * @brief Uart interrupt bit map
 */
typedef enum
{
		INT_RECEIVE_DATA_AVAILABLE = 0x1,
		INT_TRANSMIT_HOLD_EMPTY = 0x2,
		INT_RECEIVER_LINE_STATUS = 0x4,
		INT_MODEM_STATUS = 0x8,
		INT_PROGRAMMABLE_THRE = 0x80
}UART_Int_Enable;

/**
 * @brief Rx trigger level. Above the trigger level, an uart rx interrupt will trigger. Uart Rx Fifo is 8 bytes.
 */
typedef enum
{
		RCVR_Trigger_One_Character = 0,
		RCVR_Trigger_FIFO_One_Quarter_Full,
		RCVR_Trigger_FIFO_Half_Full,
		RCVR_Trigger_FIFO_Two_Less_Than_Full
}UART_RX_TrgLvl;

/**
 * @brief Tx trigger level.Below the trigger level, an uart tx interrupt will trigger. Uart Tx Fifo is 8 bytes.
 */
typedef enum
{
		TX_Empty_Trigger_FIFO_Empty = 0,
		TX_Empty_Trigger_Two_Characters_In_FIFO,
		TX_Empty_Trigger_One_Quarter_Full,
		Tx_Empty_Trigger_Half_Full
}UART_TX_TrgLvl;


/**
 * @brief The bit map of the uart interrupt.
 */
typedef enum
{
		Modem_Status_Interrupt = 0,
		No_Interrupt_Pending = 1,
		THR_Empty_Interrupt = 2,
		Received_Data_Available_Interrupt = 4,
		Receiver_Line_Status_Interrupt = 6,
		Busy_Detect_Interrupt = 7,
		Character_Timeout_Interrupt = 12
}UART_Int_Identity;


/**
 * @brief Data Length Select. The number of bits that may be selected are 5, 6, 7, 8bits
 */
typedef enum
{
		Data_Length_5_bits = 0,
		Data_Length_6_bits,
		Data_Length_7_bits,
		Data_Length_8_bits
}UART_Datalen;

/**
 * @brief Select type of parity check.
 */
typedef enum
{
    none_parity_check = 0,
    odd_parity_check,
    even_parity_check
}UART_Parity;

/**
 * @brief Number of stop bits. 
          If set to stop_bit_1_5_OR_2 and the data bits are set to 5, one and a half stop bits is transmitted. Otherwise, two stop bits are transmitted. 
 */
typedef enum
{
    stop_bit_1 = 0,
    stop_bit_1_5_OR_2
}UART_Stop_Bit;

/**
 * @brief Select mode of flow control. When select hardware flow control, rts is controlled by hardware, otherwise controlled by software.
 */
typedef enum
{
    software_flow_control = 0,
    hardware_flow_control
}UART_Flow_Control;


/**
 * @brief Bitmap of line status.
 */
typedef enum
{
    data_ready = 0x1,
    overrun_error = 0x2,
    parity_error = 0x4,
    framing_error = 0x8,
    break_interrupt = 0x10,
    transmit_holding_empty = 0x20,
    transmit_empty = 0x40,
    receive_fifo_error = 0x80
}UART_Line_Status;

/**
 * @brief Bitmap of Modem Status
 */
typedef enum
{
    delta_clear_to_send = 0x1,
    delta_data_set_ready = 0x2,
    clear_to_send = 0x10,
    data_set_ready = 0x20,
    data_carrier_detect = 0x80
}UART_Modem_Status;

/**
 * @brief Bitmap of Uart normal Status
 */
typedef enum
{
    uart_busy = 0x1,
    transmit_fifo_not_full = 0x2,
    transmit_fifo_empty = 0x4,
    receive_fifo_not_empty = 0x8,
    receive_fifo_full = 0x10
}UART_Status;

/**
 * @brief Set Uart DMA mode
 */
typedef enum
{
    uart_dma_mode0 = 0,
    uart_dma_mode1
}UART_Dma_Mode;

/**
 * @brief This is the struct to initialize the uart module.
 */
typedef struct
{
    uint32_t UART_BaudRate;
    UART_Datalen UART_DataLen;
    UART_Stop_Bit UART_StopBits;
    UART_Parity UART_Parity;
    UART_Flow_Control FlowControl; 
}UART_InitTypeDef;


typedef enum
{
    UART_READ_FIXLEN = 0,
    UART_READ_TILL_CHAR
}UART_RecMode;

/*
 * STRUCT DEFINITIONS
 *****************************************************************************************
 */
/**
 * @brief TX and RX channel class holding data used for asynchronous read and write data
 */
struct uart_txrxchannel
{
    /// size
    uint32_t  size;
    /// buffer pointer
    uint8_t  *bufptr;
    uint8_t  *bufbase;
    /// call back function pointer
    void (*callback) (void*,uint8_t);
    //call back function parameter
    void *dummy;
};

/**
 * @brief struct to set the uart environment (data buffer and error indicator)
 */
typedef struct
{
    /// tx channel
    struct uart_txrxchannel tx;
    /// rx channel
    struct uart_txrxchannel rx;
    /// error detect
    bool errordetect;
    /// this field is set automatically when using HAL_UART_Read_Till. Users do not need to set.
    uint8_t echo_enable;
    /// this field is set automatically when using HAL_UART_Read_Till. Users do not need to set.
    UART_RecMode read_mode;
    /// this field is set automatically when using HAL_UART_Read_Till. Users do not need to set.
    uint8_t till_char;
}UART_Env_Tag;



/*
 * FUNCTION DECLARATIONS
 ****************************************************************************************
 */

/**
 * @brief Initialize the uart module.
 * @param uart_src_clk: the uart_src_clk is always equal to APB_CLK0
 * @param config: the data structure contain the uart parameter.
 * @return This function has no return value.
 */
void HAL_UART_Init(uint32_t uart_src_clk, UART_InitTypeDef config);
/**
 * @brief Configure the interrupt
 * @param irq_map: the bit map of interrupt to enable. irq_map is ored from enum UART_Int_Enable.
 * @return This function has no return value.
 */
void HAL_UART_INTConfig(uint8_t irq_map);
/**
 * @brief Get the interrupt status of uart
 * @return return the int status, the return value is the bitmap ored from enum UART_Int_Identity.
 */
uint8_t HAL_UART_Int_Status(void);
/**
 * @brief Set the fifo control of uart. To enable fifo, this function should always be used once the uart is initialized.
 * @param tx_lvl: tx fifo level. Below the trigger level, an uart tx interrupt will trigger.
 * @param rx_lvl: rx fifo level.above the trigger level, an uart rx interrupt will trigger.
 * @return This function has no return value.
 */
void HAL_UART_FIFO_Control(UART_TX_TrgLvl tx_lvl, UART_RX_TrgLvl rx_lvl);
/**
 * @brief Software flow control, flow on( ready to receive data ). When using the hardware flow control we should never use this function.
 * @return This function has no return value.
 */
void HAL_UART_Flow_On(void);
/**
 * @brief Software flow control, flow off( tell the remote deveice stop sending data ). When using the hardware flow control we should never use this function.
 * @return return whether the flow off is success.
 */
bool HAL_UART_Flow_Off(void);
/**
 * @brief Use flow control to stop receive data and sending all the tx fifo data out.
 * @return This function has no return value.
 */
void HAL_UART_Finish_Transfers(void);
/**
 * @brief Get the Line Status of uart
 * @return  the return value is ored from enum UART_Line_Status.
 */
uint16_t HAL_UART_Get_Line_Status(void);
/**
 * @brief Get the Modem Status of uart
 * @return  the return value is ored from enum UART_Modem_Status.
 */
uint8_t HAL_UART_Get_Modem_Status(void);
/**
 * @brief Get the noraml status of uart
 * @return  the return value is ored from enum UART_Status.
 */
uint8_t HAL_UART_Normal_Status(void);
/**
 * @brief Start reading data from uart, the function will return immediately, when defined size of data is received the callback function is called.
 * @param bufptr: pointer to the rx buffer
 * @param size: sizeof data bytes to receive
 * @param callback: callback function once the defined size of data is received. 
                    The first intput parameter is *dummy, input when HAL_UART0_Read is called.
                    The second intput parameter uart status, STATUS_OK or STATUS_ERRORR
 * @param dummy: use NULL or point to the data want to use in callback function. It will become the first parameter of callback function
 * @return This function has no return value.
 */
void HAL_UART_Read(uint8_t *bufptr, uint32_t size, void (*callback) (void*,uint8_t),void* dummy);
/**
 * @brief Start reading data from uart, the function will return immediately, when defined character is received the callback function is called.
 * @param bufptr: pointer to the rx buffer, it is your responsible to ensure the buffer is enougth to read till receive the char
 * @param till_char: define to keep reading till which character.
 * @param echo_en: enable or disable echo mode.
 * @param callback: callback function once the defined size of data is received. 
                    The first intput parameter is *dummy, input when HAL_UART0_Read is called.
                    The second intput parameter uart status, STATUS_OK or STATUS_ERRORR
 * @param dummy: use NULL or point to the data want to use in callback function. It will become the first parameter of callback function
 * @return This function has no return value.
 */
void HAL_UART_Read_Till(uint8_t *bufptr, uint8_t till_char, uint8_t echo_en, void (*callback) (void*,uint8_t),void* dummy);
/**
 * @brief Start write data to uart, the function will return immediately, when defined size of data is sent the callback function is called.
 * @param bufptr: pointer to the tx buffer
 * @param size: sizeof data bytes to sent
 * @param callback: callback function once the defined size of data is sent. 
                    The first intput parameter is *dummy, input when HAL_UART0_Write is called.
                    The second intput parameter uart status, STATUS_OK or STATUS_ERRORR
 * @param dummy: use NULL or point to the data want to use in callback function. It will become the first parameter of callback function
 * @return This function has no return value.
 */
void HAL_UART_Write(uint8_t *bufptr, uint32_t size, void (*callback) (void*,uint8_t), void *dummy);
/**
 * @brief Write char polling. The funtion return only when data is finish sending 
 * @param ch: character to write to uart
 * @return This function has no return value.
 */
void HAL_UART_WriteChar_Polling(uint8_t ch);
/**
 * @brief Write string polling. The funtion return only when data is finish sending 
 * @param bufptr: point to the tx data buffer.
 * @param size: size of the data to be sent
 * @return This function has no return value.
 */
void HAL_UART_Write_Polling(uint8_t *bufptr, uint32_t size);
/**
 * @brief Read char from uart. The function return immediately.
 * @param bufptr: point to the rx data buffer.
 * @return This function return a character immediately. But only when the return value is 1, the data is valid.
 */
uint8_t HAL_UART_ReadChar(uint8_t *ch);               // not polling

/**
* @brief The default uart isr function of uart. You can define your own function.
*        Serves the data transfer interrupt requests. It clears the requests and executes the appropriate callback function.
* @return This function has no return value.
*/
void HAL_UART_Isr(void);

#endif


/// @} UART

