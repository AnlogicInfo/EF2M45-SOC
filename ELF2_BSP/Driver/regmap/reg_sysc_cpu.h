//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may     
// only be used by a person authorised under and to the extent permitted       
// by a subsisting licensing agreement from FASTASIC Limited.              
//                                                                             
//            (C) COPYRIGHT 2015-2017 FASTASIC Limited.                  
//                ALL RIGHTS RESERVED                                          
//                                                                             
// This entire notice must be reproduced on all copies of this file            
// and copies of this file may only be made by a person if such person is      
// permitted to do so under the terms of a subsisting license agreement        
// from FASTASIC Limited.                                                  
//-----------------------------------------------------------------------------
#ifndef __REG_SYSC_CPU_H__
#define __REG_SYSC_CPU_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//div_update
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t              pclk0_div_para_up :  1; /* 0: 0,              write 1 to toggle*/
        uint32_t                     reserved_1 :  1; /* 1: 1,                       RESERVED*/
        uint32_t             timer0_div_para_up :  1; /* 2: 2,              write 1 to toggle*/
        uint32_t             timer1_div_para_up :  1; /* 3: 3,              write 1 to toggle*/
        uint32_t                     reserved_0 : 28; /*31: 4,                       RESERVED*/
    } bit_field;
} T_SYSC_CPU_DIV_UPDATE;

//div_para
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t              pclk0_div_para_m1 :  4; /* 3: 0,  0---not div  1--div2  2--div3*/
        uint32_t                     reserved_1 :  4; /* 7: 4,                       RESERVED*/
        uint32_t             timer0_div_para_m1 :  4; /*11: 8,  0---not div  1--div2  2--div3*/
        uint32_t             timer1_div_para_m1 :  4; /*15:12,  0---not div  1--div2  2--div3*/
        uint32_t                     reserved_0 : 16; /*31:16,                       RESERVED*/
    } bit_field;
} T_SYSC_CPU_DIV_PARA;

//sw_clkg
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   qspi_gate_en :  1; /* 0: 0,             SW clk gate enable*/
        uint32_t                    cfg_gate_en :  1; /* 1: 1,             SW clk gate enable*/
        uint32_t                   adcc_gate_en :  1; /* 2: 2,             SW clk gate enable*/
        uint32_t                    i2s_gate_en :  1; /* 3: 3,             SW clk gate enable*/
        uint32_t                   gpio_gate_en :  1; /* 4: 4,             SW clk gate enable*/
        uint32_t                    spi_gate_en :  1; /* 5: 5,             SW clk gate enable*/
        uint32_t                   i2c1_gate_en :  1; /* 6: 6,             SW clk gate enable*/
        uint32_t                   i2c0_gate_en :  1; /* 7: 7,             SW clk gate enable*/
        uint32_t                   uart_gate_en :  1; /* 8: 8,             SW clk gate enable*/
        uint32_t                    wdt_gate_en :  1; /* 9: 9,             SW clk gate enable*/
        uint32_t                  timer_gate_en :  1; /*10:10,             SW clk gate enable*/
        uint32_t                 timer1_gate_en :  1; /*11:11,             SW clk gate enable*/
        uint32_t                 timer2_gate_en :  1; /*12:12,             SW clk gate enable*/
        uint32_t                  cache_gate_en :  1; /*13:13,             SW clk gate enable*/
        uint32_t                    dma_gate_en :  1; /*14:14,             SW clk gate enable*/
        uint32_t                     reserved_0 : 17; /*31:15,                       RESERVED*/
    } bit_field;
} T_SYSC_CPU_SW_CLKG;

//sw_rstn
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     srstn_qspi :  1; /* 0: 0,           SW reset, low active*/
        uint32_t                      srstn_cfg :  1; /* 1: 1,           SW reset, low active*/
        uint32_t                     srstn_adcc :  1; /* 2: 2,           SW reset, low active*/
        uint32_t                      srstn_i2s :  1; /* 3: 3, whole chip SW reset, low active*/
        uint32_t                     srstn_gpio :  1; /* 4: 4,           SW reset, low active*/
        uint32_t                     srstn_i2c1 :  1; /* 5: 5,           SW reset, low active*/
        uint32_t                     srstn_i2c0 :  1; /* 6: 6,           SW reset, low active*/
        uint32_t                      srstn_spi :  1; /* 7: 7, whole chip SW reset, low active*/
        uint32_t                     srstn_uart :  1; /* 8: 8,           SW reset, low active*/
        uint32_t                      srstn_wdt :  1; /* 9: 9,           SW reset, low active*/
        uint32_t                    srstn_timer :  1; /*10:10,           SW reset, low active*/
        uint32_t                    srstn_cache :  1; /*11:11, whole chip SW reset, low active*/
        uint32_t                      srstn_dma :  1; /*12:12,           SW reset, low active*/
        uint32_t                     reserved_0 : 19; /*31:13,                       RESERVED*/
    } bit_field;
} T_SYSC_CPU_SW_RSTN;

//gpien
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     gpioa_en_0 :  1; /* 0: 0,         select gpioa[0] as pad*/
        uint32_t                     gpioa_en_1 :  1; /* 1: 1,         select gpioa[1] as pad*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       RESERVED*/
    } bit_field;
} T_SYSC_CPU_GPIEN;

//func_en
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       func_ien : 32; /*31: 0, enable function of each GPIO, FUNC_ISEL_07/15 can be further used.*/
    } bit_field;
} T_SYSC_CPU_FUNC_EN;

//func_isel_07
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  func_io00_sel :  4; /* 3: 0, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io01_sel :  4; /* 7: 4, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io02_sel :  4; /*11: 8, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io03_sel :  4; /*15:12, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io04_sel :  4; /*19:16, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io05_sel :  4; /*23:20, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io06_sel :  4; /*27:24, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io07_sel :  4; /*31:28, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
    } bit_field;
} T_SYSC_CPU_FUNC_ISEL_07;

//func_isel_15
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  func_io08_sel :  4; /* 3: 0, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io09_sel :  4; /* 7: 4, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io10_sel :  4; /*11: 8, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io11_sel :  4; /*15:12, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io12_sel :  4; /*19:16, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io13_sel :  4; /*23:20, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io14_sel :  4; /*27:24, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
        uint32_t                  func_io15_sel :  4; /*31:28, 0: uart_tdx1: uart_rxd2: uart_cts3: uart_rts4: spi_clk5: spi_ss6: spi_sdo7: spi_sdi8: i2c0_scl9: i2c0_sda10: i2c1_scl11: i2c1_sda12: i2s_clk13: i2s_ws14: i2s_sdo15: i2s_sdi*/
    } bit_field;
} T_SYSC_CPU_FUNC_ISEL_15;

//mcu_stcalib
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    mcu_stcalib : 25; /*24: 0, mcu system tick calibration reg*/
        uint32_t                     reserved_0 :  7; /*31:25,                       RESERVED*/
    } bit_field;
} T_SYSC_CPU_MCU_STCALIB;

//Registers Mapping to the same address

typedef struct
{
    volatile           T_SYSC_CPU_DIV_UPDATE                     div_update; /*  0x0,    RW, 0x00000000,                             NA*/
    volatile             T_SYSC_CPU_DIV_PARA                       div_para; /*  0x4,    RW, 0x00000000,                             NA*/
    volatile              T_SYSC_CPU_SW_CLKG                        sw_clkg; /*  0x8,    RW, 0x00007FFF,                             NA*/
    volatile              T_SYSC_CPU_SW_RSTN                        sw_rstn; /*  0xc,    RW, 0x00001FFF,                             NA*/
    volatile                T_SYSC_CPU_GPIEN                          gpien; /* 0x10,    RW, 0x00000000,                             NA*/
    volatile              T_SYSC_CPU_FUNC_EN                        func_en; /* 0x14,    RW, 0x00000000,                             NA*/
    volatile         T_SYSC_CPU_FUNC_ISEL_07                   func_isel_07; /* 0x18,    RW, 0x00000000,                             NA*/
    volatile         T_SYSC_CPU_FUNC_ISEL_15                   func_isel_15; /* 0x1c,    RW, 0x00000000,                             NA*/
    volatile          T_SYSC_CPU_MCU_STCALIB                    mcu_stcalib; /* 0x20,    RW, 0x00000000,                             NA*/
} T_HWP_SYSC_CPU_T;

#define hwp_sysc_cpu ((T_HWP_SYSC_CPU_T*)REG_SYSC_CPU_BASE)


__STATIC_INLINE uint32_t sysc_cpu_div_update_get(void)
{
    return hwp_sysc_cpu->div_update.val;
}

__STATIC_INLINE void sysc_cpu_div_update_set(uint32_t value)
{
    hwp_sysc_cpu->div_update.val = value;
}

__STATIC_INLINE void sysc_cpu_div_update_pack(uint8_t timer1_div_para_up, uint8_t timer0_div_para_up, uint8_t pclk0_div_para_up)
{
    hwp_sysc_cpu->div_update.val = (((uint32_t)timer1_div_para_up << 3) | ((uint32_t)timer0_div_para_up << 2) | ((uint32_t)pclk0_div_para_up << 0));
}

__STATIC_INLINE uint32_t sysc_cpu_div_para_get(void)
{
    return hwp_sysc_cpu->div_para.val;
}

__STATIC_INLINE void sysc_cpu_div_para_set(uint32_t value)
{
    hwp_sysc_cpu->div_para.val = value;
}

__STATIC_INLINE void sysc_cpu_div_para_pack(uint8_t timer1_div_para_m1, uint8_t timer0_div_para_m1, uint8_t pclk0_div_para_m1)
{
    hwp_sysc_cpu->div_para.val = (((uint32_t)timer1_div_para_m1 << 12) | ((uint32_t)timer0_div_para_m1 << 8) | ((uint32_t)pclk0_div_para_m1 << 0));
}

__STATIC_INLINE void sysc_cpu_div_para_unpack(uint8_t* timer1_div_para_m1, uint8_t* timer0_div_para_m1, uint8_t* pclk0_div_para_m1)
{
    T_SYSC_CPU_DIV_PARA localVal = hwp_sysc_cpu->div_para;

    *timer1_div_para_m1 = localVal.bit_field.timer1_div_para_m1;
    *timer0_div_para_m1 = localVal.bit_field.timer0_div_para_m1;
    *pclk0_div_para_m1 = localVal.bit_field.pclk0_div_para_m1;
}

__STATIC_INLINE uint8_t sysc_cpu_timer1_div_para_m1_getf(void)
{
    return hwp_sysc_cpu->div_para.bit_field.timer1_div_para_m1;
}

__STATIC_INLINE void sysc_cpu_timer1_div_para_m1_setf(uint8_t timer1_div_para_m1)
{
    hwp_sysc_cpu->div_para.bit_field.timer1_div_para_m1 = timer1_div_para_m1;
}

__STATIC_INLINE uint8_t sysc_cpu_timer0_div_para_m1_getf(void)
{
    return hwp_sysc_cpu->div_para.bit_field.timer0_div_para_m1;
}

__STATIC_INLINE void sysc_cpu_timer0_div_para_m1_setf(uint8_t timer0_div_para_m1)
{
    hwp_sysc_cpu->div_para.bit_field.timer0_div_para_m1 = timer0_div_para_m1;
}

__STATIC_INLINE uint8_t sysc_cpu_pclk0_div_para_m1_getf(void)
{
    return hwp_sysc_cpu->div_para.bit_field.pclk0_div_para_m1;
}

__STATIC_INLINE void sysc_cpu_pclk0_div_para_m1_setf(uint8_t pclk0_div_para_m1)
{
    hwp_sysc_cpu->div_para.bit_field.pclk0_div_para_m1 = pclk0_div_para_m1;
}

__STATIC_INLINE uint32_t sysc_cpu_sw_clkg_get(void)
{
    return hwp_sysc_cpu->sw_clkg.val;
}

__STATIC_INLINE void sysc_cpu_sw_clkg_set(uint32_t value)
{
    hwp_sysc_cpu->sw_clkg.val = value;
}

__STATIC_INLINE void sysc_cpu_sw_clkg_pack(uint8_t dma_gate_en, uint8_t cache_gate_en, uint8_t timer2_gate_en, uint8_t timer1_gate_en, uint8_t timer_gate_en, uint8_t wdt_gate_en, uint8_t uart_gate_en, uint8_t i2c0_gate_en, uint8_t i2c1_gate_en, uint8_t spi_gate_en, uint8_t gpio_gate_en, uint8_t i2s_gate_en, uint8_t adcc_gate_en, uint8_t cfg_gate_en, uint8_t qspi_gate_en)
{
    hwp_sysc_cpu->sw_clkg.val = (((uint32_t)dma_gate_en << 14) | ((uint32_t)cache_gate_en << 13) | ((uint32_t)timer2_gate_en << 12) | ((uint32_t)timer1_gate_en << 11) | ((uint32_t)timer_gate_en << 10) | ((uint32_t)wdt_gate_en << 9) | ((uint32_t)uart_gate_en << 8) | ((uint32_t)i2c0_gate_en << 7) | ((uint32_t)i2c1_gate_en << 6) | ((uint32_t)spi_gate_en << 5) | ((uint32_t)gpio_gate_en << 4) | ((uint32_t)i2s_gate_en << 3) | ((uint32_t)adcc_gate_en << 2) | ((uint32_t)cfg_gate_en << 1) | ((uint32_t)qspi_gate_en << 0));
}

__STATIC_INLINE void sysc_cpu_sw_clkg_unpack(uint8_t* dma_gate_en, uint8_t* cache_gate_en, uint8_t* timer2_gate_en, uint8_t* timer1_gate_en, uint8_t* timer_gate_en, uint8_t* wdt_gate_en, uint8_t* uart_gate_en, uint8_t* i2c0_gate_en, uint8_t* i2c1_gate_en, uint8_t* spi_gate_en, uint8_t* gpio_gate_en, uint8_t* i2s_gate_en, uint8_t* adcc_gate_en, uint8_t* cfg_gate_en, uint8_t* qspi_gate_en)
{
    T_SYSC_CPU_SW_CLKG localVal = hwp_sysc_cpu->sw_clkg;

    *dma_gate_en = localVal.bit_field.dma_gate_en;
    *cache_gate_en = localVal.bit_field.cache_gate_en;
    *timer2_gate_en = localVal.bit_field.timer2_gate_en;
    *timer1_gate_en = localVal.bit_field.timer1_gate_en;
    *timer_gate_en = localVal.bit_field.timer_gate_en;
    *wdt_gate_en = localVal.bit_field.wdt_gate_en;
    *uart_gate_en = localVal.bit_field.uart_gate_en;
    *i2c0_gate_en = localVal.bit_field.i2c0_gate_en;
    *i2c1_gate_en = localVal.bit_field.i2c1_gate_en;
    *spi_gate_en = localVal.bit_field.spi_gate_en;
    *gpio_gate_en = localVal.bit_field.gpio_gate_en;
    *i2s_gate_en = localVal.bit_field.i2s_gate_en;
    *adcc_gate_en = localVal.bit_field.adcc_gate_en;
    *cfg_gate_en = localVal.bit_field.cfg_gate_en;
    *qspi_gate_en = localVal.bit_field.qspi_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_dma_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.dma_gate_en;
}

__STATIC_INLINE void sysc_cpu_dma_gate_en_setf(uint8_t dma_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.dma_gate_en = dma_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_cache_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.cache_gate_en;
}

__STATIC_INLINE void sysc_cpu_cache_gate_en_setf(uint8_t cache_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.cache_gate_en = cache_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_timer2_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.timer2_gate_en;
}

__STATIC_INLINE void sysc_cpu_timer2_gate_en_setf(uint8_t timer2_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.timer2_gate_en = timer2_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_timer1_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.timer1_gate_en;
}

__STATIC_INLINE void sysc_cpu_timer1_gate_en_setf(uint8_t timer1_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.timer1_gate_en = timer1_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_timer_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.timer_gate_en;
}

__STATIC_INLINE void sysc_cpu_timer_gate_en_setf(uint8_t timer_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.timer_gate_en = timer_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_wdt_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.wdt_gate_en;
}

__STATIC_INLINE void sysc_cpu_wdt_gate_en_setf(uint8_t wdt_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.wdt_gate_en = wdt_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_uart_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.uart_gate_en;
}

__STATIC_INLINE void sysc_cpu_uart_gate_en_setf(uint8_t uart_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.uart_gate_en = uart_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_i2c0_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.i2c0_gate_en;
}

__STATIC_INLINE void sysc_cpu_i2c0_gate_en_setf(uint8_t i2c0_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.i2c0_gate_en = i2c0_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_i2c1_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.i2c1_gate_en;
}

__STATIC_INLINE void sysc_cpu_i2c1_gate_en_setf(uint8_t i2c1_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.i2c1_gate_en = i2c1_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_spi_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.spi_gate_en;
}

__STATIC_INLINE void sysc_cpu_spi_gate_en_setf(uint8_t spi_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.spi_gate_en = spi_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_gpio_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.gpio_gate_en;
}

__STATIC_INLINE void sysc_cpu_gpio_gate_en_setf(uint8_t gpio_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.gpio_gate_en = gpio_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_i2s_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.i2s_gate_en;
}

__STATIC_INLINE void sysc_cpu_i2s_gate_en_setf(uint8_t i2s_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.i2s_gate_en = i2s_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_adcc_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.adcc_gate_en;
}

__STATIC_INLINE void sysc_cpu_adcc_gate_en_setf(uint8_t adcc_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.adcc_gate_en = adcc_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_cfg_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.cfg_gate_en;
}

__STATIC_INLINE void sysc_cpu_cfg_gate_en_setf(uint8_t cfg_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.cfg_gate_en = cfg_gate_en;
}

__STATIC_INLINE uint8_t sysc_cpu_qspi_gate_en_getf(void)
{
    return hwp_sysc_cpu->sw_clkg.bit_field.qspi_gate_en;
}

__STATIC_INLINE void sysc_cpu_qspi_gate_en_setf(uint8_t qspi_gate_en)
{
    hwp_sysc_cpu->sw_clkg.bit_field.qspi_gate_en = qspi_gate_en;
}

__STATIC_INLINE uint32_t sysc_cpu_sw_rstn_get(void)
{
    return hwp_sysc_cpu->sw_rstn.val;
}

__STATIC_INLINE void sysc_cpu_sw_rstn_set(uint32_t value)
{
    hwp_sysc_cpu->sw_rstn.val = value;
}

__STATIC_INLINE void sysc_cpu_sw_rstn_pack(uint8_t srstn_dma, uint8_t srstn_cache, uint8_t srstn_timer, uint8_t srstn_wdt, uint8_t srstn_uart, uint8_t srstn_spi, uint8_t srstn_i2c0, uint8_t srstn_i2c1, uint8_t srstn_gpio, uint8_t srstn_i2s, uint8_t srstn_adcc, uint8_t srstn_cfg, uint8_t srstn_qspi)
{
    hwp_sysc_cpu->sw_rstn.val = (((uint32_t)srstn_dma << 12) | ((uint32_t)srstn_cache << 11) | ((uint32_t)srstn_timer << 10) | ((uint32_t)srstn_wdt << 9) | ((uint32_t)srstn_uart << 8) | ((uint32_t)srstn_spi << 7) | ((uint32_t)srstn_i2c0 << 6) | ((uint32_t)srstn_i2c1 << 5) | ((uint32_t)srstn_gpio << 4) | ((uint32_t)srstn_i2s << 3) | ((uint32_t)srstn_adcc << 2) | ((uint32_t)srstn_cfg << 1) | ((uint32_t)srstn_qspi << 0));
}

__STATIC_INLINE void sysc_cpu_sw_rstn_unpack(uint8_t* srstn_dma, uint8_t* srstn_cache, uint8_t* srstn_timer, uint8_t* srstn_wdt, uint8_t* srstn_uart, uint8_t* srstn_spi, uint8_t* srstn_i2c0, uint8_t* srstn_i2c1, uint8_t* srstn_gpio, uint8_t* srstn_i2s, uint8_t* srstn_adcc, uint8_t* srstn_cfg, uint8_t* srstn_qspi)
{
    T_SYSC_CPU_SW_RSTN localVal = hwp_sysc_cpu->sw_rstn;

    *srstn_dma = localVal.bit_field.srstn_dma;
    *srstn_cache = localVal.bit_field.srstn_cache;
    *srstn_timer = localVal.bit_field.srstn_timer;
    *srstn_wdt = localVal.bit_field.srstn_wdt;
    *srstn_uart = localVal.bit_field.srstn_uart;
    *srstn_spi = localVal.bit_field.srstn_spi;
    *srstn_i2c0 = localVal.bit_field.srstn_i2c0;
    *srstn_i2c1 = localVal.bit_field.srstn_i2c1;
    *srstn_gpio = localVal.bit_field.srstn_gpio;
    *srstn_i2s = localVal.bit_field.srstn_i2s;
    *srstn_adcc = localVal.bit_field.srstn_adcc;
    *srstn_cfg = localVal.bit_field.srstn_cfg;
    *srstn_qspi = localVal.bit_field.srstn_qspi;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_dma_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_dma;
}

__STATIC_INLINE void sysc_cpu_srstn_dma_setf(uint8_t srstn_dma)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_dma = srstn_dma;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_cache_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_cache;
}

__STATIC_INLINE void sysc_cpu_srstn_cache_setf(uint8_t srstn_cache)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_cache = srstn_cache;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_timer_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_timer;
}

__STATIC_INLINE void sysc_cpu_srstn_timer_setf(uint8_t srstn_timer)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_timer = srstn_timer;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_wdt_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_wdt;
}

__STATIC_INLINE void sysc_cpu_srstn_wdt_setf(uint8_t srstn_wdt)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_wdt = srstn_wdt;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_uart_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_uart;
}

__STATIC_INLINE void sysc_cpu_srstn_uart_setf(uint8_t srstn_uart)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_uart = srstn_uart;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_spi_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_spi;
}

__STATIC_INLINE void sysc_cpu_srstn_spi_setf(uint8_t srstn_spi)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_spi = srstn_spi;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_i2c0_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_i2c0;
}

__STATIC_INLINE void sysc_cpu_srstn_i2c0_setf(uint8_t srstn_i2c0)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_i2c0 = srstn_i2c0;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_i2c1_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_i2c1;
}

__STATIC_INLINE void sysc_cpu_srstn_i2c1_setf(uint8_t srstn_i2c1)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_i2c1 = srstn_i2c1;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_gpio_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_gpio;
}

__STATIC_INLINE void sysc_cpu_srstn_gpio_setf(uint8_t srstn_gpio)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_gpio = srstn_gpio;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_i2s_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_i2s;
}

__STATIC_INLINE void sysc_cpu_srstn_i2s_setf(uint8_t srstn_i2s)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_i2s = srstn_i2s;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_adcc_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_adcc;
}

__STATIC_INLINE void sysc_cpu_srstn_adcc_setf(uint8_t srstn_adcc)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_adcc = srstn_adcc;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_cfg_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_cfg;
}

__STATIC_INLINE void sysc_cpu_srstn_cfg_setf(uint8_t srstn_cfg)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_cfg = srstn_cfg;
}

__STATIC_INLINE uint8_t sysc_cpu_srstn_qspi_getf(void)
{
    return hwp_sysc_cpu->sw_rstn.bit_field.srstn_qspi;
}

__STATIC_INLINE void sysc_cpu_srstn_qspi_setf(uint8_t srstn_qspi)
{
    hwp_sysc_cpu->sw_rstn.bit_field.srstn_qspi = srstn_qspi;
}

__STATIC_INLINE uint32_t sysc_cpu_gpien_get(void)
{
    return hwp_sysc_cpu->gpien.val;
}

__STATIC_INLINE void sysc_cpu_gpien_set(uint32_t value)
{
    hwp_sysc_cpu->gpien.val = value;
}

__STATIC_INLINE void sysc_cpu_gpien_pack(uint8_t gpioa_en_1, uint8_t gpioa_en_0)
{
    hwp_sysc_cpu->gpien.val = (((uint32_t)gpioa_en_1 << 1) | ((uint32_t)gpioa_en_0 << 0));
}

__STATIC_INLINE void sysc_cpu_gpien_unpack(uint8_t* gpioa_en_1, uint8_t* gpioa_en_0)
{
    T_SYSC_CPU_GPIEN localVal = hwp_sysc_cpu->gpien;

    *gpioa_en_1 = localVal.bit_field.gpioa_en_1;
    *gpioa_en_0 = localVal.bit_field.gpioa_en_0;
}

__STATIC_INLINE uint8_t sysc_cpu_gpioa_en_1_getf(void)
{
    return hwp_sysc_cpu->gpien.bit_field.gpioa_en_1;
}

__STATIC_INLINE void sysc_cpu_gpioa_en_1_setf(uint8_t gpioa_en_1)
{
    hwp_sysc_cpu->gpien.bit_field.gpioa_en_1 = gpioa_en_1;
}

__STATIC_INLINE uint8_t sysc_cpu_gpioa_en_0_getf(void)
{
    return hwp_sysc_cpu->gpien.bit_field.gpioa_en_0;
}

__STATIC_INLINE void sysc_cpu_gpioa_en_0_setf(uint8_t gpioa_en_0)
{
    hwp_sysc_cpu->gpien.bit_field.gpioa_en_0 = gpioa_en_0;
}

__STATIC_INLINE uint32_t sysc_cpu_func_en_get(void)
{
    return hwp_sysc_cpu->func_en.val;
}

__STATIC_INLINE void sysc_cpu_func_en_set(uint32_t value)
{
    hwp_sysc_cpu->func_en.val = value;
}

__STATIC_INLINE void sysc_cpu_func_en_pack(uint32_t func_ien)
{
    hwp_sysc_cpu->func_en.val = (((uint32_t)func_ien << 0));
}

__STATIC_INLINE void sysc_cpu_func_en_unpack(uint32_t* func_ien)
{
    T_SYSC_CPU_FUNC_EN localVal = hwp_sysc_cpu->func_en;

    *func_ien = localVal.bit_field.func_ien;
}

__STATIC_INLINE uint32_t sysc_cpu_func_ien_getf(void)
{
    return hwp_sysc_cpu->func_en.bit_field.func_ien;
}

__STATIC_INLINE void sysc_cpu_func_ien_setf(uint32_t func_ien)
{
    hwp_sysc_cpu->func_en.bit_field.func_ien = func_ien;
}

__STATIC_INLINE uint32_t sysc_cpu_func_isel_07_get(void)
{
    return hwp_sysc_cpu->func_isel_07.val;
}

__STATIC_INLINE void sysc_cpu_func_isel_07_set(uint32_t value)
{
    hwp_sysc_cpu->func_isel_07.val = value;
}

__STATIC_INLINE void sysc_cpu_func_isel_07_pack(uint8_t func_io07_sel, uint8_t func_io06_sel, uint8_t func_io05_sel, uint8_t func_io04_sel, uint8_t func_io03_sel, uint8_t func_io02_sel, uint8_t func_io01_sel, uint8_t func_io00_sel)
{
    hwp_sysc_cpu->func_isel_07.val = (((uint32_t)func_io07_sel << 28) | ((uint32_t)func_io06_sel << 24) | ((uint32_t)func_io05_sel << 20) | ((uint32_t)func_io04_sel << 16) | ((uint32_t)func_io03_sel << 12) | ((uint32_t)func_io02_sel << 8) | ((uint32_t)func_io01_sel << 4) | ((uint32_t)func_io00_sel << 0));
}

__STATIC_INLINE void sysc_cpu_func_isel_07_unpack(uint8_t* func_io07_sel, uint8_t* func_io06_sel, uint8_t* func_io05_sel, uint8_t* func_io04_sel, uint8_t* func_io03_sel, uint8_t* func_io02_sel, uint8_t* func_io01_sel, uint8_t* func_io00_sel)
{
    T_SYSC_CPU_FUNC_ISEL_07 localVal = hwp_sysc_cpu->func_isel_07;

    *func_io07_sel = localVal.bit_field.func_io07_sel;
    *func_io06_sel = localVal.bit_field.func_io06_sel;
    *func_io05_sel = localVal.bit_field.func_io05_sel;
    *func_io04_sel = localVal.bit_field.func_io04_sel;
    *func_io03_sel = localVal.bit_field.func_io03_sel;
    *func_io02_sel = localVal.bit_field.func_io02_sel;
    *func_io01_sel = localVal.bit_field.func_io01_sel;
    *func_io00_sel = localVal.bit_field.func_io00_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io07_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io07_sel;
}

__STATIC_INLINE void sysc_cpu_func_io07_sel_setf(uint8_t func_io07_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io07_sel = func_io07_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io06_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io06_sel;
}

__STATIC_INLINE void sysc_cpu_func_io06_sel_setf(uint8_t func_io06_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io06_sel = func_io06_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io05_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io05_sel;
}

__STATIC_INLINE void sysc_cpu_func_io05_sel_setf(uint8_t func_io05_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io05_sel = func_io05_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io04_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io04_sel;
}

__STATIC_INLINE void sysc_cpu_func_io04_sel_setf(uint8_t func_io04_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io04_sel = func_io04_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io03_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io03_sel;
}

__STATIC_INLINE void sysc_cpu_func_io03_sel_setf(uint8_t func_io03_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io03_sel = func_io03_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io02_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io02_sel;
}

__STATIC_INLINE void sysc_cpu_func_io02_sel_setf(uint8_t func_io02_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io02_sel = func_io02_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io01_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io01_sel;
}

__STATIC_INLINE void sysc_cpu_func_io01_sel_setf(uint8_t func_io01_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io01_sel = func_io01_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io00_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_07.bit_field.func_io00_sel;
}

__STATIC_INLINE void sysc_cpu_func_io00_sel_setf(uint8_t func_io00_sel)
{
    hwp_sysc_cpu->func_isel_07.bit_field.func_io00_sel = func_io00_sel;
}

__STATIC_INLINE uint32_t sysc_cpu_func_isel_15_get(void)
{
    return hwp_sysc_cpu->func_isel_15.val;
}

__STATIC_INLINE void sysc_cpu_func_isel_15_set(uint32_t value)
{
    hwp_sysc_cpu->func_isel_15.val = value;
}

__STATIC_INLINE void sysc_cpu_func_isel_15_pack(uint8_t func_io15_sel, uint8_t func_io14_sel, uint8_t func_io13_sel, uint8_t func_io12_sel, uint8_t func_io11_sel, uint8_t func_io10_sel, uint8_t func_io09_sel, uint8_t func_io08_sel)
{
    hwp_sysc_cpu->func_isel_15.val = (((uint32_t)func_io15_sel << 28) | ((uint32_t)func_io14_sel << 24) | ((uint32_t)func_io13_sel << 20) | ((uint32_t)func_io12_sel << 16) | ((uint32_t)func_io11_sel << 12) | ((uint32_t)func_io10_sel << 8) | ((uint32_t)func_io09_sel << 4) | ((uint32_t)func_io08_sel << 0));
}

__STATIC_INLINE void sysc_cpu_func_isel_15_unpack(uint8_t* func_io15_sel, uint8_t* func_io14_sel, uint8_t* func_io13_sel, uint8_t* func_io12_sel, uint8_t* func_io11_sel, uint8_t* func_io10_sel, uint8_t* func_io09_sel, uint8_t* func_io08_sel)
{
    T_SYSC_CPU_FUNC_ISEL_15 localVal = hwp_sysc_cpu->func_isel_15;

    *func_io15_sel = localVal.bit_field.func_io15_sel;
    *func_io14_sel = localVal.bit_field.func_io14_sel;
    *func_io13_sel = localVal.bit_field.func_io13_sel;
    *func_io12_sel = localVal.bit_field.func_io12_sel;
    *func_io11_sel = localVal.bit_field.func_io11_sel;
    *func_io10_sel = localVal.bit_field.func_io10_sel;
    *func_io09_sel = localVal.bit_field.func_io09_sel;
    *func_io08_sel = localVal.bit_field.func_io08_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io15_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io15_sel;
}

__STATIC_INLINE void sysc_cpu_func_io15_sel_setf(uint8_t func_io15_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io15_sel = func_io15_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io14_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io14_sel;
}

__STATIC_INLINE void sysc_cpu_func_io14_sel_setf(uint8_t func_io14_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io14_sel = func_io14_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io13_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io13_sel;
}

__STATIC_INLINE void sysc_cpu_func_io13_sel_setf(uint8_t func_io13_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io13_sel = func_io13_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io12_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io12_sel;
}

__STATIC_INLINE void sysc_cpu_func_io12_sel_setf(uint8_t func_io12_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io12_sel = func_io12_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io11_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io11_sel;
}

__STATIC_INLINE void sysc_cpu_func_io11_sel_setf(uint8_t func_io11_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io11_sel = func_io11_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io10_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io10_sel;
}

__STATIC_INLINE void sysc_cpu_func_io10_sel_setf(uint8_t func_io10_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io10_sel = func_io10_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io09_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io09_sel;
}

__STATIC_INLINE void sysc_cpu_func_io09_sel_setf(uint8_t func_io09_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io09_sel = func_io09_sel;
}

__STATIC_INLINE uint8_t sysc_cpu_func_io08_sel_getf(void)
{
    return hwp_sysc_cpu->func_isel_15.bit_field.func_io08_sel;
}

__STATIC_INLINE void sysc_cpu_func_io08_sel_setf(uint8_t func_io08_sel)
{
    hwp_sysc_cpu->func_isel_15.bit_field.func_io08_sel = func_io08_sel;
}

__STATIC_INLINE uint32_t sysc_cpu_mcu_stcalib_get(void)
{
    return hwp_sysc_cpu->mcu_stcalib.val;
}

__STATIC_INLINE void sysc_cpu_mcu_stcalib_set(uint32_t value)
{
    hwp_sysc_cpu->mcu_stcalib.val = value;
}

__STATIC_INLINE void sysc_cpu_mcu_stcalib_pack(uint32_t mcu_stcalib)
{
    hwp_sysc_cpu->mcu_stcalib.val = (((uint32_t)mcu_stcalib << 0));
}

__STATIC_INLINE void sysc_cpu_mcu_stcalib_unpack(uint32_t* mcu_stcalib)
{
    T_SYSC_CPU_MCU_STCALIB localVal = hwp_sysc_cpu->mcu_stcalib;

    *mcu_stcalib = localVal.bit_field.mcu_stcalib;
}

__STATIC_INLINE uint32_t sysc_cpu_mcu_stcalib_getf(void)
{
    return hwp_sysc_cpu->mcu_stcalib.bit_field.mcu_stcalib;
}

__STATIC_INLINE void sysc_cpu_mcu_stcalib_setf(uint32_t mcu_stcalib)
{
    hwp_sysc_cpu->mcu_stcalib.bit_field.mcu_stcalib = mcu_stcalib;
}
#endif


