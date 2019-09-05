#ifndef _SYSCON_H_
#define _SYSCON_H_
#include <stdint.h>
#include <stdbool.h>

typedef enum
{
	  UART_TXD = 0,
	  UART_RXD,
	  UART_CTS,
	  UART_RTS,
	  SPI_CLK,
	  SPI_SS,
	  SPI_SDO,
	  SPI_SDI,
	  I2C0_SCL,
	  I2C0_SDA,
	  I2C1_SCL,
	  I2C1_SDA,
	  I2S_CLK,
	  I2S_WS,
	  I2S_SDO,
	  I2S_SDI
}SYSCON_Function_IO_Type;

typedef enum {
	  GPIO_0 = 0,
	  GPIO_1,
	  GPIO_2,
	  GPIO_3,
	  GPIO_4,
	  GPIO_5,
	  GPIO_6,
	  GPIO_7,
	  GPIO_8,
	  GPIO_9,
	  GPIO_10,
	  GPIO_11,
	  GPIO_12,
	  GPIO_13,
	  GPIO_14,
	  GPIO_15
}SYSCON_Function_IO_Idx;


typedef enum
{
    sw_clkgate_qspi = 0,            // control cpu register
    sw_clkgate_cfg = 1,    
    sw_clkgate_adcc = 2,
    sw_clkgate_i2s = 3,
    sw_clkgate_gpio = 4,
    sw_clkgate_spi = 5,
    sw_clkgate_i2c1 = 6,
    sw_clkgate_i2c0 = 7,
    sw_clkgate_uart = 8,
    sw_clkgate_wdt = 9,
    sw_clkgate_timer = 10,
    sw_clkgate_timer_1 = 11,
    sw_clkgate_timer_2 = 12,
    sw_clkgate_cache = 13,
    sw_clkgate_dma = 14,
    sw_clkgate_rtc = 15,            // control awo register
    sw_clkgate_wic = 16
    
}SYSCON_ClkGate;

typedef enum
{
    sw_rst_qspi = 0,            // control cpu register
    sw_rst_cfg = 1,    
    sw_rst_adcc = 2,
    sw_rst_i2s = 3,
    sw_rst_gpio = 4,
    sw_rst_i2c1 = 5,
    sw_rst_i2c0 = 6,
    sw_rst_spi = 7,
    sw_rst_uart = 8,
    sw_rst_wdt = 9,
    sw_rst_timer = 10,
    sw_rst_cache = 11,
    sw_rst_dma = 12,
    
    sw_rst_pmu = 13,            // control awo register
    sw_rst_wic = 14,
    sw_rst_rtc = 15,
    sw_rst_all = 16
}SYSCON_SwRst;


typedef enum
{
    IO_from_pinshare = 0,
    IO_from_retention = 1
}SYSCON_IO_CtrlSel;


typedef enum
{
    clk_sel_pad = 1,
    clk_sel_rcosc = 2,
    clk_sel_pib = 4,
    clk_sel_pll = 8    
}SYSCON_Clk_Sel;


typedef enum
{
    rtcclk_from_xtal = 0,
    rtcclk_from_ahb = 1
}SYSCON_RTCClk_Src;

void HAL_SYSCON_Clk_Enable(SYSCON_ClkGate clk_src, bool ena);
void HAL_SYSCON_Set_HClk_Div(uint8_t ahb_divider);
void HAL_SYSCON_Set_PClk0_Div(uint8_t apb0_divider);
void HAL_SYSCON_Set_PClk1_Div(uint8_t apb1_divider);
void HAL_SYSCON_Set_RTC_Div(SYSCON_RTCClk_Src rtc_src, uint16_t rtc_divider);
void HAL_SYSCON_SW_Reset(SYSCON_SwRst module);
void HAL_SYSCON_HCLK_Src_Sel(SYSCON_Clk_Sel clk_sel);


/**
 ****************************************************************************************
 * @brief software generate a pulse to capture I/O for retention
 ****************************************************************************************
 */
void HAL_SYSCON_Start_Cap_IO(void);

/**
 ****************************************************************************************
 * @brief enable i/o retention. Use this function with awo_start_cap_io together.
 * @param sel: sel = IO_FROM_RETENTION: enable retention. sel = IO_FROM_PINSHARE disable retention.
 ****************************************************************************************
 */
void HAL_SYSCON_IO_Ctrl_Set(SYSCON_IO_CtrlSel sel);


/**
 * @brief use this function to let pmu control io retention. Normally we use pmu to automatically control io retention.
 */
void HAL_SYSCON_Retention_Enable(void);
void HAL_SYSCON_GPIO_Pull_Up(uint16_t gpio_map, bool en);
void HAL_SYSCON_GPIO_Pull_Down(uint16_t gpio_map, bool en);
void HAL_SYSCON_GPIO_IO_En(bool gpio_a0_en, bool gpio_a1_en);
void HAL_SYSCON_Function_IO_Set(SYSCON_Function_IO_Type io_type, SYSCON_Function_IO_Idx io_idx, uint8_t en);
void HAL_SYSCON_Function_IO_disable_all(void);


#endif

