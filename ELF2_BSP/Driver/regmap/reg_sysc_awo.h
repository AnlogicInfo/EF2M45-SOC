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
#ifndef __REG_SYSC_AWO_H__
#define __REG_SYSC_AWO_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//div_update
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               hclk_div_para_up :  1; /* 0: 0,              write 1 to toggle*/
        uint32_t              pclk1_div_para_up :  1; /* 1: 1,              write 1 to toggle*/
        uint32_t                rtc_div_para_up :  1; /* 2: 2,              write 1 to toggle*/
        uint32_t                     reserved_0 : 29; /*31: 3,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_DIV_UPDATE;

//div_para
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               hclk_div_para_m1 :  4; /* 3: 0,  0---not div  1--div2  2--div3*/
        uint32_t              pclk1_div_para_m1 :  4; /* 7: 4,  0---not div  1--div2  2--div3*/
        uint32_t                rtc_div_para_m1 : 13; /*20: 8, 0---select XTAL as 32k clk source    other-----select hclk div clk as 32k clk, div num = **+1*/
        uint32_t                     reserved_0 : 11; /*31:21,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_DIV_PARA;

//sw_clkg
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     swclkg_rtc :  1; /* 0: 0,             SW clk gate enable*/
        uint32_t                     swclkg_wic :  1; /* 1: 1,             SW clk gate enable*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_SW_CLKG;

//sw_rstn
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      srstn_pmu :  1; /* 0: 0,           SW reset, low active*/
        uint32_t                      srstn_wic :  1; /* 1: 1,           SW reset, low active*/
        uint32_t                      srstn_rtc :  1; /* 2: 2,           SW reset, low active*/
        uint32_t                      srstn_all :  1; /* 3: 3, whole chip SW reset, low active*/
        uint32_t                     reserved_0 : 28; /*31: 4,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_SW_RSTN;

//clk_sel
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clk_src_sel :  4; /* 3: 0,             hclk source select*/
        uint32_t                     reserved_0 : 28; /*31: 4,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_CLK_SEL;

//io_ret
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                io_stat_ret_pmu :  1; /* 0: 0,    enable of PMU to retente IO*/
        uint32_t              io_stat_unret_pmu :  1; /* 1: 1,  enable of PMU to unretente IO*/
        uint32_t                    io_ctrl_sel :  1; /* 2: 2, SW control to seclect which IO state to output. 0---IO from pinshare  1---IO from retention by PMU or SW. Can also be controled by SW*/
        uint32_t                    io_stat_cap :  1; /* 3: 3, SW generate a pulse to retente IO*/
        uint32_t                     reserved_0 : 28; /*31: 4,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_IO_RET;

//ext_intr_sence
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               ext_inrp_sense_0 :  2; /* 1: 0, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_1 :  2; /* 3: 2, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_2 :  2; /* 5: 4, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_3 :  2; /* 7: 6, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_4 :  2; /* 9: 8, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_5 :  2; /*11:10, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_6 :  2; /*13:12, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_7 :  2; /*15:14, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_8 :  2; /*17:16, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t               ext_inrp_sense_9 :  2; /*19:18, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t              ext_inrp_sense_10 :  2; /*21:20, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t              ext_inrp_sense_11 :  2; /*23:22, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t              ext_inrp_sense_12 :  2; /*25:24, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t              ext_inrp_sense_13 :  2; /*27:26, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t              ext_inrp_sense_14 :  2; /*29:28, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
        uint32_t              ext_inrp_sense_15 :  2; /*31:30, indicate the external interrupt 0 triggle condition. 00--hi level 01--low level  10--posedge 11--negedge*/
    } bit_field;
} T_SYSC_AWO_EXT_INTR_SENCE;

//ext_intr_en
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    ext_inrp_en : 16; /*15: 0, enable of 16 external interrupt*/
        uint32_t                pin_is_inrp_src : 16; /*31:16, indicate this pin as interrupt source pin.1---as inrp pin.    0---normal pin*/
    } bit_field;
} T_SYSC_AWO_EXT_INTR_EN;

//intr_stat
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               ext_inrp_value_r : 16; /*15: 0,       external interrupt value*/
        uint32_t              ext_rawinrp_value : 16; /*31:16,   external interrupt raw value*/
    } bit_field;
} T_SYSC_AWO_INTR_STAT;

//ext_inrp_clr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 ext_inrp_clr_r : 16; /*15: 0,    clear 16 external interrupt*/
        uint32_t                     reserved_0 : 16; /*31:16,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_EXT_INRP_CLR;

//swc_time
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     pmu_enable :  1; /* 0: 0,                   o_pmu_enable*/
        uint32_t                    retsw_delay :  7; /* 7: 1,     2ms between reten to retsw*/
        uint32_t                   ldsetup_time :  8; /*15: 8,          PD ldo on stable time*/
        uint32_t                      ldswc_dly :  4; /*19:16,            the LDO switch time*/
        uint32_t                    clk_swc_dly :  4; /*23:20,            the CLK switch time*/
        uint32_t                   pmu_seq_time :  8; /*31:24, the state stay time when PMU output power dowm/up signal sequence*/
    } bit_field;
} T_SYSC_AWO_SWC_TIME;

//cfg_done_gwe
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                r2_cfg_done_gwe :  1; /* 0: 0,      read state of cf_done_gwe*/
        uint32_t                     reserved_0 : 31; /*31: 1,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_CFG_DONE_GWE;

//ram_load_en
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ram0_load_en :  1; /* 0: 0,                             NA*/
        uint32_t                   ram1_load_en :  1; /* 1: 1,                             NA*/
        uint32_t                      sleep_out :  1; /* 2: 2,                             NA*/
        uint32_t                    wakeup_flag :  1; /* 3: 3, indicate the state of wakeup or first power on*/
        uint32_t          mcu_need_wait_cfgdone :  1; /* 4: 4, indicate the mcu need wait cfg done, then can run*/
        uint32_t                  sg12r_xtal_en :  1; /* 5: 5,                32k xtal enable*/
        uint32_t                    pib_rstn_en :  1; /* 6: 6, 1----pib reset enable   0---disable*/
        uint32_t                     reserved_0 : 25; /*31: 7,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_RAM_LOAD_EN;

//flash_mode
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     flash_mode :  1; /* 0: 0,                 use flash flag*/
        uint32_t                     reserved_0 : 31; /*31: 1,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_FLASH_MODE;

//ucr_reg
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ucr_reg : 16; /*15: 0,                             NA*/
        uint32_t                     reserved_0 : 16; /*31:16,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_UCR_REG;

//trim_reg
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       trim_reg : 32; /*31: 0,                             NA*/
    } bit_field;
} T_SYSC_AWO_TRIM_REG;

//gpio_l_pu_reg
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      gpil_pu_n : 16; /*15: 0,                             NA*/
        uint32_t                     reserved_0 : 16; /*31:16,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_GPIO_L_PU_REG;

//gpio_l_pd_reg
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        gpil_pd : 16; /*15: 0,                             NA*/
        uint32_t                     reserved_0 : 16; /*31:16,                       RESERVED*/
    } bit_field;
} T_SYSC_AWO_GPIO_L_PD_REG;

//Registers Mapping to the same address

typedef struct
{
    volatile           T_SYSC_AWO_DIV_UPDATE                     div_update; /*  0x0,    RW, 0x00000000,                             NA*/
    volatile             T_SYSC_AWO_DIV_PARA                       div_para; /*  0x4,    RW, 0x00000000,                             NA*/
    volatile              T_SYSC_AWO_SW_CLKG                        sw_clkg; /*  0x8,    RW, 0x00000003,                             NA*/
    volatile              T_SYSC_AWO_SW_RSTN                        sw_rstn; /*  0xc,    RW, 0x0000000F,                             NA*/
    volatile              T_SYSC_AWO_CLK_SEL                        clk_sel; /* 0x10,    RW, 0x00000002,                             NA*/
    volatile               T_SYSC_AWO_IO_RET                         io_ret; /* 0x14,    RW, 0x00000000,                             NA*/
    volatile       T_SYSC_AWO_EXT_INTR_SENCE                 ext_intr_sence; /* 0x18,    RW, 0xAAAAAAAA,                             NA*/
    volatile          T_SYSC_AWO_EXT_INTR_EN                    ext_intr_en; /* 0x1c,    RW, 0x00000000,                             NA*/
    volatile            T_SYSC_AWO_INTR_STAT                      intr_stat; /* 0x20,    RO, 0x00000000,                             NA*/
    volatile         T_SYSC_AWO_EXT_INRP_CLR                   ext_inrp_clr; /* 0x24,    RW, 0x00000000,                             NA*/
    volatile             T_SYSC_AWO_SWC_TIME                       swc_time; /* 0x28,    RW, 0x08352881,                             NA*/
    volatile         T_SYSC_AWO_CFG_DONE_GWE                   cfg_done_gwe; /* 0x2c,    RO, 0x00000000,                             NA*/
    volatile          T_SYSC_AWO_RAM_LOAD_EN                    ram_load_en; /* 0x30,    RW, 0x00000063,                             NA*/
    volatile           T_SYSC_AWO_FLASH_MODE                     flash_mode; /* 0x34,    RW, 0x00000000,                             NA*/
    volatile                        uint32_t                  reserved_0[2];
    volatile              T_SYSC_AWO_UCR_REG                        ucr_reg; /* 0x40,    RW, 0x00000000,                             NA*/
    volatile             T_SYSC_AWO_TRIM_REG                       trim_reg; /* 0x44,    RW, 0x00000000,                             NA*/
    volatile        T_SYSC_AWO_GPIO_L_PU_REG                  gpio_l_pu_reg; /* 0x48,    RW, 0x00000000,                             NA*/
    volatile        T_SYSC_AWO_GPIO_L_PD_REG                  gpio_l_pd_reg; /* 0x4c,    RW, 0x00000000,                             NA*/
} T_HWP_SYSC_AWO_T;

#define hwp_sysc_awo ((T_HWP_SYSC_AWO_T*)REG_SYSC_AWO_BASE)


__STATIC_INLINE uint32_t sysc_awo_div_update_get(void)
{
    return hwp_sysc_awo->div_update.val;
}

__STATIC_INLINE void sysc_awo_div_update_set(uint32_t value)
{
    hwp_sysc_awo->div_update.val = value;
}

__STATIC_INLINE void sysc_awo_div_update_pack(uint8_t rtc_div_para_up, uint8_t pclk1_div_para_up, uint8_t hclk_div_para_up)
{
    hwp_sysc_awo->div_update.val = (((uint32_t)rtc_div_para_up << 2) | ((uint32_t)pclk1_div_para_up << 1) | ((uint32_t)hclk_div_para_up << 0));
}

__STATIC_INLINE uint32_t sysc_awo_div_para_get(void)
{
    return hwp_sysc_awo->div_para.val;
}

__STATIC_INLINE void sysc_awo_div_para_set(uint32_t value)
{
    hwp_sysc_awo->div_para.val = value;
}

__STATIC_INLINE void sysc_awo_div_para_pack(uint16_t rtc_div_para_m1, uint8_t pclk1_div_para_m1, uint8_t hclk_div_para_m1)
{
    hwp_sysc_awo->div_para.val = (((uint32_t)rtc_div_para_m1 << 8) | ((uint32_t)pclk1_div_para_m1 << 4) | ((uint32_t)hclk_div_para_m1 << 0));
}

__STATIC_INLINE void sysc_awo_div_para_unpack(uint16_t* rtc_div_para_m1, uint8_t* pclk1_div_para_m1, uint8_t* hclk_div_para_m1)
{
    T_SYSC_AWO_DIV_PARA localVal = hwp_sysc_awo->div_para;

    *rtc_div_para_m1 = localVal.bit_field.rtc_div_para_m1;
    *pclk1_div_para_m1 = localVal.bit_field.pclk1_div_para_m1;
    *hclk_div_para_m1 = localVal.bit_field.hclk_div_para_m1;
}

__STATIC_INLINE uint16_t sysc_awo_rtc_div_para_m1_getf(void)
{
    return hwp_sysc_awo->div_para.bit_field.rtc_div_para_m1;
}

__STATIC_INLINE void sysc_awo_rtc_div_para_m1_setf(uint16_t rtc_div_para_m1)
{
    hwp_sysc_awo->div_para.bit_field.rtc_div_para_m1 = rtc_div_para_m1;
}

__STATIC_INLINE uint8_t sysc_awo_pclk1_div_para_m1_getf(void)
{
    return hwp_sysc_awo->div_para.bit_field.pclk1_div_para_m1;
}

__STATIC_INLINE void sysc_awo_pclk1_div_para_m1_setf(uint8_t pclk1_div_para_m1)
{
    hwp_sysc_awo->div_para.bit_field.pclk1_div_para_m1 = pclk1_div_para_m1;
}

__STATIC_INLINE uint8_t sysc_awo_hclk_div_para_m1_getf(void)
{
    return hwp_sysc_awo->div_para.bit_field.hclk_div_para_m1;
}

__STATIC_INLINE void sysc_awo_hclk_div_para_m1_setf(uint8_t hclk_div_para_m1)
{
    hwp_sysc_awo->div_para.bit_field.hclk_div_para_m1 = hclk_div_para_m1;
}

__STATIC_INLINE uint32_t sysc_awo_sw_clkg_get(void)
{
    return hwp_sysc_awo->sw_clkg.val;
}

__STATIC_INLINE void sysc_awo_sw_clkg_set(uint32_t value)
{
    hwp_sysc_awo->sw_clkg.val = value;
}

__STATIC_INLINE void sysc_awo_sw_clkg_pack(uint8_t swclkg_wic, uint8_t swclkg_rtc)
{
    hwp_sysc_awo->sw_clkg.val = (((uint32_t)swclkg_wic << 1) | ((uint32_t)swclkg_rtc << 0));
}

__STATIC_INLINE void sysc_awo_sw_clkg_unpack(uint8_t* swclkg_wic, uint8_t* swclkg_rtc)
{
    T_SYSC_AWO_SW_CLKG localVal = hwp_sysc_awo->sw_clkg;

    *swclkg_wic = localVal.bit_field.swclkg_wic;
    *swclkg_rtc = localVal.bit_field.swclkg_rtc;
}

__STATIC_INLINE uint8_t sysc_awo_swclkg_wic_getf(void)
{
    return hwp_sysc_awo->sw_clkg.bit_field.swclkg_wic;
}

__STATIC_INLINE void sysc_awo_swclkg_wic_setf(uint8_t swclkg_wic)
{
    hwp_sysc_awo->sw_clkg.bit_field.swclkg_wic = swclkg_wic;
}

__STATIC_INLINE uint8_t sysc_awo_swclkg_rtc_getf(void)
{
    return hwp_sysc_awo->sw_clkg.bit_field.swclkg_rtc;
}

__STATIC_INLINE void sysc_awo_swclkg_rtc_setf(uint8_t swclkg_rtc)
{
    hwp_sysc_awo->sw_clkg.bit_field.swclkg_rtc = swclkg_rtc;
}

__STATIC_INLINE uint32_t sysc_awo_sw_rstn_get(void)
{
    return hwp_sysc_awo->sw_rstn.val;
}

__STATIC_INLINE void sysc_awo_sw_rstn_set(uint32_t value)
{
    hwp_sysc_awo->sw_rstn.val = value;
}

__STATIC_INLINE void sysc_awo_sw_rstn_pack(uint8_t srstn_all, uint8_t srstn_rtc, uint8_t srstn_wic, uint8_t srstn_pmu)
{
    hwp_sysc_awo->sw_rstn.val = (((uint32_t)srstn_all << 3) | ((uint32_t)srstn_rtc << 2) | ((uint32_t)srstn_wic << 1) | ((uint32_t)srstn_pmu << 0));
}

__STATIC_INLINE void sysc_awo_sw_rstn_unpack(uint8_t* srstn_all, uint8_t* srstn_rtc, uint8_t* srstn_wic, uint8_t* srstn_pmu)
{
    T_SYSC_AWO_SW_RSTN localVal = hwp_sysc_awo->sw_rstn;

    *srstn_all = localVal.bit_field.srstn_all;
    *srstn_rtc = localVal.bit_field.srstn_rtc;
    *srstn_wic = localVal.bit_field.srstn_wic;
    *srstn_pmu = localVal.bit_field.srstn_pmu;
}

__STATIC_INLINE uint8_t sysc_awo_srstn_all_getf(void)
{
    return hwp_sysc_awo->sw_rstn.bit_field.srstn_all;
}

__STATIC_INLINE void sysc_awo_srstn_all_setf(uint8_t srstn_all)
{
    hwp_sysc_awo->sw_rstn.bit_field.srstn_all = srstn_all;
}

__STATIC_INLINE uint8_t sysc_awo_srstn_rtc_getf(void)
{
    return hwp_sysc_awo->sw_rstn.bit_field.srstn_rtc;
}

__STATIC_INLINE void sysc_awo_srstn_rtc_setf(uint8_t srstn_rtc)
{
    hwp_sysc_awo->sw_rstn.bit_field.srstn_rtc = srstn_rtc;
}

__STATIC_INLINE uint8_t sysc_awo_srstn_wic_getf(void)
{
    return hwp_sysc_awo->sw_rstn.bit_field.srstn_wic;
}

__STATIC_INLINE void sysc_awo_srstn_wic_setf(uint8_t srstn_wic)
{
    hwp_sysc_awo->sw_rstn.bit_field.srstn_wic = srstn_wic;
}

__STATIC_INLINE uint8_t sysc_awo_srstn_pmu_getf(void)
{
    return hwp_sysc_awo->sw_rstn.bit_field.srstn_pmu;
}

__STATIC_INLINE void sysc_awo_srstn_pmu_setf(uint8_t srstn_pmu)
{
    hwp_sysc_awo->sw_rstn.bit_field.srstn_pmu = srstn_pmu;
}

__STATIC_INLINE uint32_t sysc_awo_clk_sel_get(void)
{
    return hwp_sysc_awo->clk_sel.val;
}

__STATIC_INLINE void sysc_awo_clk_sel_set(uint32_t value)
{
    hwp_sysc_awo->clk_sel.val = value;
}

__STATIC_INLINE void sysc_awo_clk_sel_pack(uint8_t clk_src_sel)
{
    hwp_sysc_awo->clk_sel.val = (((uint32_t)clk_src_sel << 0));
}

__STATIC_INLINE void sysc_awo_clk_sel_unpack(uint8_t* clk_src_sel)
{
    T_SYSC_AWO_CLK_SEL localVal = hwp_sysc_awo->clk_sel;

    *clk_src_sel = localVal.bit_field.clk_src_sel;
}

__STATIC_INLINE uint8_t sysc_awo_clk_src_sel_getf(void)
{
    return hwp_sysc_awo->clk_sel.bit_field.clk_src_sel;
}

__STATIC_INLINE void sysc_awo_clk_src_sel_setf(uint8_t clk_src_sel)
{
    hwp_sysc_awo->clk_sel.bit_field.clk_src_sel = clk_src_sel;
}

__STATIC_INLINE uint32_t sysc_awo_io_ret_get(void)
{
    return hwp_sysc_awo->io_ret.val;
}

__STATIC_INLINE void sysc_awo_io_ret_set(uint32_t value)
{
    hwp_sysc_awo->io_ret.val = value;
}

__STATIC_INLINE void sysc_awo_io_ret_pack(uint8_t io_stat_cap, uint8_t io_ctrl_sel, uint8_t io_stat_unret_pmu, uint8_t io_stat_ret_pmu)
{
    hwp_sysc_awo->io_ret.val = (((uint32_t)io_stat_cap << 3) | ((uint32_t)io_ctrl_sel << 2) | ((uint32_t)io_stat_unret_pmu << 1) | ((uint32_t)io_stat_ret_pmu << 0));
}

__STATIC_INLINE void sysc_awo_io_ret_unpack(uint8_t* io_ctrl_sel, uint8_t* io_stat_unret_pmu, uint8_t* io_stat_ret_pmu)
{
    T_SYSC_AWO_IO_RET localVal = hwp_sysc_awo->io_ret;

    *io_ctrl_sel = localVal.bit_field.io_ctrl_sel;
    *io_stat_unret_pmu = localVal.bit_field.io_stat_unret_pmu;
    *io_stat_ret_pmu = localVal.bit_field.io_stat_ret_pmu;
}

__STATIC_INLINE uint8_t sysc_awo_io_ctrl_sel_getf(void)
{
    return hwp_sysc_awo->io_ret.bit_field.io_ctrl_sel;
}

__STATIC_INLINE void sysc_awo_io_ctrl_sel_setf(uint8_t io_ctrl_sel)
{
    hwp_sysc_awo->io_ret.bit_field.io_ctrl_sel = io_ctrl_sel;
}

__STATIC_INLINE uint8_t sysc_awo_io_stat_unret_pmu_getf(void)
{
    return hwp_sysc_awo->io_ret.bit_field.io_stat_unret_pmu;
}

__STATIC_INLINE void sysc_awo_io_stat_unret_pmu_setf(uint8_t io_stat_unret_pmu)
{
    hwp_sysc_awo->io_ret.bit_field.io_stat_unret_pmu = io_stat_unret_pmu;
}

__STATIC_INLINE uint8_t sysc_awo_io_stat_ret_pmu_getf(void)
{
    return hwp_sysc_awo->io_ret.bit_field.io_stat_ret_pmu;
}

__STATIC_INLINE void sysc_awo_io_stat_ret_pmu_setf(uint8_t io_stat_ret_pmu)
{
    hwp_sysc_awo->io_ret.bit_field.io_stat_ret_pmu = io_stat_ret_pmu;
}

__STATIC_INLINE uint32_t sysc_awo_ext_intr_sence_get(void)
{
    return hwp_sysc_awo->ext_intr_sence.val;
}

__STATIC_INLINE void sysc_awo_ext_intr_sence_set(uint32_t value)
{
    hwp_sysc_awo->ext_intr_sence.val = value;
}

__STATIC_INLINE void sysc_awo_ext_intr_sence_pack(uint8_t ext_inrp_sense_15, uint8_t ext_inrp_sense_14, uint8_t ext_inrp_sense_13, uint8_t ext_inrp_sense_12, uint8_t ext_inrp_sense_11, uint8_t ext_inrp_sense_10, uint8_t ext_inrp_sense_9, uint8_t ext_inrp_sense_8, uint8_t ext_inrp_sense_7, uint8_t ext_inrp_sense_6, uint8_t ext_inrp_sense_5, uint8_t ext_inrp_sense_4, uint8_t ext_inrp_sense_3, uint8_t ext_inrp_sense_2, uint8_t ext_inrp_sense_1, uint8_t ext_inrp_sense_0)
{
    hwp_sysc_awo->ext_intr_sence.val = (((uint32_t)ext_inrp_sense_15 << 30) | ((uint32_t)ext_inrp_sense_14 << 28) | ((uint32_t)ext_inrp_sense_13 << 26) | ((uint32_t)ext_inrp_sense_12 << 24) | ((uint32_t)ext_inrp_sense_11 << 22) | ((uint32_t)ext_inrp_sense_10 << 20) | ((uint32_t)ext_inrp_sense_9 << 18) | ((uint32_t)ext_inrp_sense_8 << 16) | ((uint32_t)ext_inrp_sense_7 << 14) | ((uint32_t)ext_inrp_sense_6 << 12) | ((uint32_t)ext_inrp_sense_5 << 10) | ((uint32_t)ext_inrp_sense_4 << 8) | ((uint32_t)ext_inrp_sense_3 << 6) | ((uint32_t)ext_inrp_sense_2 << 4) | ((uint32_t)ext_inrp_sense_1 << 2) | ((uint32_t)ext_inrp_sense_0 << 0));
}

__STATIC_INLINE void sysc_awo_ext_intr_sence_unpack(uint8_t* ext_inrp_sense_15, uint8_t* ext_inrp_sense_14, uint8_t* ext_inrp_sense_13, uint8_t* ext_inrp_sense_12, uint8_t* ext_inrp_sense_11, uint8_t* ext_inrp_sense_10, uint8_t* ext_inrp_sense_9, uint8_t* ext_inrp_sense_8, uint8_t* ext_inrp_sense_7, uint8_t* ext_inrp_sense_6, uint8_t* ext_inrp_sense_5, uint8_t* ext_inrp_sense_4, uint8_t* ext_inrp_sense_3, uint8_t* ext_inrp_sense_2, uint8_t* ext_inrp_sense_1, uint8_t* ext_inrp_sense_0)
{
    T_SYSC_AWO_EXT_INTR_SENCE localVal = hwp_sysc_awo->ext_intr_sence;

    *ext_inrp_sense_15 = localVal.bit_field.ext_inrp_sense_15;
    *ext_inrp_sense_14 = localVal.bit_field.ext_inrp_sense_14;
    *ext_inrp_sense_13 = localVal.bit_field.ext_inrp_sense_13;
    *ext_inrp_sense_12 = localVal.bit_field.ext_inrp_sense_12;
    *ext_inrp_sense_11 = localVal.bit_field.ext_inrp_sense_11;
    *ext_inrp_sense_10 = localVal.bit_field.ext_inrp_sense_10;
    *ext_inrp_sense_9 = localVal.bit_field.ext_inrp_sense_9;
    *ext_inrp_sense_8 = localVal.bit_field.ext_inrp_sense_8;
    *ext_inrp_sense_7 = localVal.bit_field.ext_inrp_sense_7;
    *ext_inrp_sense_6 = localVal.bit_field.ext_inrp_sense_6;
    *ext_inrp_sense_5 = localVal.bit_field.ext_inrp_sense_5;
    *ext_inrp_sense_4 = localVal.bit_field.ext_inrp_sense_4;
    *ext_inrp_sense_3 = localVal.bit_field.ext_inrp_sense_3;
    *ext_inrp_sense_2 = localVal.bit_field.ext_inrp_sense_2;
    *ext_inrp_sense_1 = localVal.bit_field.ext_inrp_sense_1;
    *ext_inrp_sense_0 = localVal.bit_field.ext_inrp_sense_0;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_15_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_15;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_15_setf(uint8_t ext_inrp_sense_15)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_15 = ext_inrp_sense_15;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_14_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_14;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_14_setf(uint8_t ext_inrp_sense_14)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_14 = ext_inrp_sense_14;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_13_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_13;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_13_setf(uint8_t ext_inrp_sense_13)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_13 = ext_inrp_sense_13;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_12_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_12;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_12_setf(uint8_t ext_inrp_sense_12)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_12 = ext_inrp_sense_12;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_11_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_11;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_11_setf(uint8_t ext_inrp_sense_11)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_11 = ext_inrp_sense_11;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_10_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_10;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_10_setf(uint8_t ext_inrp_sense_10)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_10 = ext_inrp_sense_10;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_9_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_9;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_9_setf(uint8_t ext_inrp_sense_9)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_9 = ext_inrp_sense_9;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_8_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_8;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_8_setf(uint8_t ext_inrp_sense_8)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_8 = ext_inrp_sense_8;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_7_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_7;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_7_setf(uint8_t ext_inrp_sense_7)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_7 = ext_inrp_sense_7;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_6_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_6;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_6_setf(uint8_t ext_inrp_sense_6)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_6 = ext_inrp_sense_6;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_5_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_5;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_5_setf(uint8_t ext_inrp_sense_5)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_5 = ext_inrp_sense_5;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_4_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_4;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_4_setf(uint8_t ext_inrp_sense_4)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_4 = ext_inrp_sense_4;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_3_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_3;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_3_setf(uint8_t ext_inrp_sense_3)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_3 = ext_inrp_sense_3;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_2_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_2;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_2_setf(uint8_t ext_inrp_sense_2)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_2 = ext_inrp_sense_2;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_1_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_1;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_1_setf(uint8_t ext_inrp_sense_1)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_1 = ext_inrp_sense_1;
}

__STATIC_INLINE uint8_t sysc_awo_ext_inrp_sense_0_getf(void)
{
    return hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_0;
}

__STATIC_INLINE void sysc_awo_ext_inrp_sense_0_setf(uint8_t ext_inrp_sense_0)
{
    hwp_sysc_awo->ext_intr_sence.bit_field.ext_inrp_sense_0 = ext_inrp_sense_0;
}

__STATIC_INLINE uint32_t sysc_awo_ext_intr_en_get(void)
{
    return hwp_sysc_awo->ext_intr_en.val;
}

__STATIC_INLINE void sysc_awo_ext_intr_en_set(uint32_t value)
{
    hwp_sysc_awo->ext_intr_en.val = value;
}

__STATIC_INLINE void sysc_awo_ext_intr_en_pack(uint16_t pin_is_inrp_src, uint16_t ext_inrp_en)
{
    hwp_sysc_awo->ext_intr_en.val = (((uint32_t)pin_is_inrp_src << 16) | ((uint32_t)ext_inrp_en << 0));
}

__STATIC_INLINE void sysc_awo_ext_intr_en_unpack(uint16_t* pin_is_inrp_src, uint16_t* ext_inrp_en)
{
    T_SYSC_AWO_EXT_INTR_EN localVal = hwp_sysc_awo->ext_intr_en;

    *pin_is_inrp_src = localVal.bit_field.pin_is_inrp_src;
    *ext_inrp_en = localVal.bit_field.ext_inrp_en;
}

__STATIC_INLINE uint16_t sysc_awo_pin_is_inrp_src_getf(void)
{
    return hwp_sysc_awo->ext_intr_en.bit_field.pin_is_inrp_src;
}

__STATIC_INLINE void sysc_awo_pin_is_inrp_src_setf(uint16_t pin_is_inrp_src)
{
    hwp_sysc_awo->ext_intr_en.bit_field.pin_is_inrp_src = pin_is_inrp_src;
}

__STATIC_INLINE uint16_t sysc_awo_ext_inrp_en_getf(void)
{
    return hwp_sysc_awo->ext_intr_en.bit_field.ext_inrp_en;
}

__STATIC_INLINE void sysc_awo_ext_inrp_en_setf(uint16_t ext_inrp_en)
{
    hwp_sysc_awo->ext_intr_en.bit_field.ext_inrp_en = ext_inrp_en;
}

__STATIC_INLINE uint32_t sysc_awo_intr_stat_get(void)
{
    return hwp_sysc_awo->intr_stat.val;
}

__STATIC_INLINE void sysc_awo_intr_stat_unpack(uint16_t* ext_rawinrp_value, uint16_t* ext_inrp_value_r)
{
    T_SYSC_AWO_INTR_STAT localVal = hwp_sysc_awo->intr_stat;

    *ext_rawinrp_value = localVal.bit_field.ext_rawinrp_value;
    *ext_inrp_value_r = localVal.bit_field.ext_inrp_value_r;
}

__STATIC_INLINE uint16_t sysc_awo_ext_rawinrp_value_getf(void)
{
    return hwp_sysc_awo->intr_stat.bit_field.ext_rawinrp_value;
}

__STATIC_INLINE uint16_t sysc_awo_ext_inrp_value_r_getf(void)
{
    return hwp_sysc_awo->intr_stat.bit_field.ext_inrp_value_r;
}

__STATIC_INLINE uint32_t sysc_awo_ext_inrp_clr_get(void)
{
    return hwp_sysc_awo->ext_inrp_clr.val;
}

__STATIC_INLINE void sysc_awo_ext_inrp_clr_set(uint32_t value)
{
    hwp_sysc_awo->ext_inrp_clr.val = value;
}

__STATIC_INLINE void sysc_awo_ext_inrp_clr_pack(uint16_t ext_inrp_clr_r)
{
    hwp_sysc_awo->ext_inrp_clr.val = (((uint32_t)ext_inrp_clr_r << 0));
}

__STATIC_INLINE uint32_t sysc_awo_swc_time_get(void)
{
    return hwp_sysc_awo->swc_time.val;
}

__STATIC_INLINE void sysc_awo_swc_time_set(uint32_t value)
{
    hwp_sysc_awo->swc_time.val = value;
}

__STATIC_INLINE void sysc_awo_swc_time_pack(uint8_t pmu_seq_time, uint8_t clk_swc_dly, uint8_t ldswc_dly, uint8_t ldsetup_time, uint8_t retsw_delay, uint8_t pmu_enable)
{
    hwp_sysc_awo->swc_time.val = (((uint32_t)pmu_seq_time << 24) | ((uint32_t)clk_swc_dly << 20) | ((uint32_t)ldswc_dly << 16) | ((uint32_t)ldsetup_time << 8) | ((uint32_t)retsw_delay << 1) | ((uint32_t)pmu_enable << 0));
}

__STATIC_INLINE void sysc_awo_swc_time_unpack(uint8_t* pmu_seq_time, uint8_t* clk_swc_dly, uint8_t* ldswc_dly, uint8_t* ldsetup_time, uint8_t* retsw_delay, uint8_t* pmu_enable)
{
    T_SYSC_AWO_SWC_TIME localVal = hwp_sysc_awo->swc_time;

    *pmu_seq_time = localVal.bit_field.pmu_seq_time;
    *clk_swc_dly = localVal.bit_field.clk_swc_dly;
    *ldswc_dly = localVal.bit_field.ldswc_dly;
    *ldsetup_time = localVal.bit_field.ldsetup_time;
    *retsw_delay = localVal.bit_field.retsw_delay;
    *pmu_enable = localVal.bit_field.pmu_enable;
}

__STATIC_INLINE uint8_t sysc_awo_pmu_seq_time_getf(void)
{
    return hwp_sysc_awo->swc_time.bit_field.pmu_seq_time;
}

__STATIC_INLINE void sysc_awo_pmu_seq_time_setf(uint8_t pmu_seq_time)
{
    hwp_sysc_awo->swc_time.bit_field.pmu_seq_time = pmu_seq_time;
}

__STATIC_INLINE uint8_t sysc_awo_clk_swc_dly_getf(void)
{
    return hwp_sysc_awo->swc_time.bit_field.clk_swc_dly;
}

__STATIC_INLINE void sysc_awo_clk_swc_dly_setf(uint8_t clk_swc_dly)
{
    hwp_sysc_awo->swc_time.bit_field.clk_swc_dly = clk_swc_dly;
}

__STATIC_INLINE uint8_t sysc_awo_ldswc_dly_getf(void)
{
    return hwp_sysc_awo->swc_time.bit_field.ldswc_dly;
}

__STATIC_INLINE void sysc_awo_ldswc_dly_setf(uint8_t ldswc_dly)
{
    hwp_sysc_awo->swc_time.bit_field.ldswc_dly = ldswc_dly;
}

__STATIC_INLINE uint8_t sysc_awo_ldsetup_time_getf(void)
{
    return hwp_sysc_awo->swc_time.bit_field.ldsetup_time;
}

__STATIC_INLINE void sysc_awo_ldsetup_time_setf(uint8_t ldsetup_time)
{
    hwp_sysc_awo->swc_time.bit_field.ldsetup_time = ldsetup_time;
}

__STATIC_INLINE uint8_t sysc_awo_retsw_delay_getf(void)
{
    return hwp_sysc_awo->swc_time.bit_field.retsw_delay;
}

__STATIC_INLINE void sysc_awo_retsw_delay_setf(uint8_t retsw_delay)
{
    hwp_sysc_awo->swc_time.bit_field.retsw_delay = retsw_delay;
}

__STATIC_INLINE uint8_t sysc_awo_pmu_enable_getf(void)
{
    return hwp_sysc_awo->swc_time.bit_field.pmu_enable;
}

__STATIC_INLINE void sysc_awo_pmu_enable_setf(uint8_t pmu_enable)
{
    hwp_sysc_awo->swc_time.bit_field.pmu_enable = pmu_enable;
}

__STATIC_INLINE uint32_t sysc_awo_cfg_done_gwe_get(void)
{
    return hwp_sysc_awo->cfg_done_gwe.val;
}

__STATIC_INLINE void sysc_awo_cfg_done_gwe_unpack(uint8_t* r2_cfg_done_gwe)
{
    T_SYSC_AWO_CFG_DONE_GWE localVal = hwp_sysc_awo->cfg_done_gwe;

    *r2_cfg_done_gwe = localVal.bit_field.r2_cfg_done_gwe;
}

__STATIC_INLINE uint8_t sysc_awo_r2_cfg_done_gwe_getf(void)
{
    return hwp_sysc_awo->cfg_done_gwe.bit_field.r2_cfg_done_gwe;
}

__STATIC_INLINE uint32_t sysc_awo_ram_load_en_get(void)
{
    return hwp_sysc_awo->ram_load_en.val;
}

__STATIC_INLINE void sysc_awo_ram_load_en_set(uint32_t value)
{
    hwp_sysc_awo->ram_load_en.val = value;
}

__STATIC_INLINE void sysc_awo_ram_load_en_pack(uint8_t pib_rstn_en, uint8_t sg12r_xtal_en, uint8_t mcu_need_wait_cfgdone, uint8_t wakeup_flag, uint8_t sleep_out, uint8_t ram1_load_en, uint8_t ram0_load_en)
{
    hwp_sysc_awo->ram_load_en.val = (((uint32_t)pib_rstn_en << 6) | ((uint32_t)sg12r_xtal_en << 5) | ((uint32_t)mcu_need_wait_cfgdone << 4) | ((uint32_t)wakeup_flag << 3) | ((uint32_t)sleep_out << 2) | ((uint32_t)ram1_load_en << 1) | ((uint32_t)ram0_load_en << 0));
}

__STATIC_INLINE void sysc_awo_ram_load_en_unpack(uint8_t* pib_rstn_en, uint8_t* sg12r_xtal_en, uint8_t* mcu_need_wait_cfgdone, uint8_t* wakeup_flag, uint8_t* sleep_out, uint8_t* ram1_load_en, uint8_t* ram0_load_en)
{
    T_SYSC_AWO_RAM_LOAD_EN localVal = hwp_sysc_awo->ram_load_en;

    *pib_rstn_en = localVal.bit_field.pib_rstn_en;
    *sg12r_xtal_en = localVal.bit_field.sg12r_xtal_en;
    *mcu_need_wait_cfgdone = localVal.bit_field.mcu_need_wait_cfgdone;
    *wakeup_flag = localVal.bit_field.wakeup_flag;
    *sleep_out = localVal.bit_field.sleep_out;
    *ram1_load_en = localVal.bit_field.ram1_load_en;
    *ram0_load_en = localVal.bit_field.ram0_load_en;
}

__STATIC_INLINE uint8_t sysc_awo_pib_rstn_en_getf(void)
{
    return hwp_sysc_awo->ram_load_en.bit_field.pib_rstn_en;
}

__STATIC_INLINE void sysc_awo_pib_rstn_en_setf(uint8_t pib_rstn_en)
{
    hwp_sysc_awo->ram_load_en.bit_field.pib_rstn_en = pib_rstn_en;
}

__STATIC_INLINE uint8_t sysc_awo_sg12r_xtal_en_getf(void)
{
    return hwp_sysc_awo->ram_load_en.bit_field.sg12r_xtal_en;
}

__STATIC_INLINE void sysc_awo_sg12r_xtal_en_setf(uint8_t sg12r_xtal_en)
{
    hwp_sysc_awo->ram_load_en.bit_field.sg12r_xtal_en = sg12r_xtal_en;
}

__STATIC_INLINE uint8_t sysc_awo_mcu_need_wait_cfgdone_getf(void)
{
    return hwp_sysc_awo->ram_load_en.bit_field.mcu_need_wait_cfgdone;
}

__STATIC_INLINE void sysc_awo_mcu_need_wait_cfgdone_setf(uint8_t mcu_need_wait_cfgdone)
{
    hwp_sysc_awo->ram_load_en.bit_field.mcu_need_wait_cfgdone = mcu_need_wait_cfgdone;
}

__STATIC_INLINE uint8_t sysc_awo_wakeup_flag_getf(void)
{
    return hwp_sysc_awo->ram_load_en.bit_field.wakeup_flag;
}

__STATIC_INLINE void sysc_awo_wakeup_flag_setf(uint8_t wakeup_flag)
{
    hwp_sysc_awo->ram_load_en.bit_field.wakeup_flag = wakeup_flag;
}

__STATIC_INLINE uint8_t sysc_awo_sleep_out_getf(void)
{
    return hwp_sysc_awo->ram_load_en.bit_field.sleep_out;
}

__STATIC_INLINE void sysc_awo_sleep_out_setf(uint8_t sleep_out)
{
    hwp_sysc_awo->ram_load_en.bit_field.sleep_out = sleep_out;
}

__STATIC_INLINE uint8_t sysc_awo_ram1_load_en_getf(void)
{
    return hwp_sysc_awo->ram_load_en.bit_field.ram1_load_en;
}

__STATIC_INLINE void sysc_awo_ram1_load_en_setf(uint8_t ram1_load_en)
{
    hwp_sysc_awo->ram_load_en.bit_field.ram1_load_en = ram1_load_en;
}

__STATIC_INLINE uint8_t sysc_awo_ram0_load_en_getf(void)
{
    return hwp_sysc_awo->ram_load_en.bit_field.ram0_load_en;
}

__STATIC_INLINE void sysc_awo_ram0_load_en_setf(uint8_t ram0_load_en)
{
    hwp_sysc_awo->ram_load_en.bit_field.ram0_load_en = ram0_load_en;
}

__STATIC_INLINE uint32_t sysc_awo_flash_mode_get(void)
{
    return hwp_sysc_awo->flash_mode.val;
}

__STATIC_INLINE void sysc_awo_flash_mode_set(uint32_t value)
{
    hwp_sysc_awo->flash_mode.val = value;
}

__STATIC_INLINE void sysc_awo_flash_mode_pack(uint8_t flash_mode)
{
    hwp_sysc_awo->flash_mode.val = (((uint32_t)flash_mode << 0));
}

__STATIC_INLINE void sysc_awo_flash_mode_unpack(uint8_t* flash_mode)
{
    T_SYSC_AWO_FLASH_MODE localVal = hwp_sysc_awo->flash_mode;

    *flash_mode = localVal.bit_field.flash_mode;
}

__STATIC_INLINE uint8_t sysc_awo_flash_mode_getf(void)
{
    return hwp_sysc_awo->flash_mode.bit_field.flash_mode;
}

__STATIC_INLINE void sysc_awo_flash_mode_setf(uint8_t flash_mode)
{
    hwp_sysc_awo->flash_mode.bit_field.flash_mode = flash_mode;
}

__STATIC_INLINE uint32_t sysc_awo_ucr_reg_get(void)
{
    return hwp_sysc_awo->ucr_reg.val;
}

__STATIC_INLINE void sysc_awo_ucr_reg_set(uint32_t value)
{
    hwp_sysc_awo->ucr_reg.val = value;
}

__STATIC_INLINE void sysc_awo_ucr_reg_pack(uint16_t ucr_reg)
{
    hwp_sysc_awo->ucr_reg.val = (((uint32_t)ucr_reg << 0));
}

__STATIC_INLINE void sysc_awo_ucr_reg_unpack(uint16_t* ucr_reg)
{
    T_SYSC_AWO_UCR_REG localVal = hwp_sysc_awo->ucr_reg;

    *ucr_reg = localVal.bit_field.ucr_reg;
}

__STATIC_INLINE uint16_t sysc_awo_ucr_reg_getf(void)
{
    return hwp_sysc_awo->ucr_reg.bit_field.ucr_reg;
}

__STATIC_INLINE void sysc_awo_ucr_reg_setf(uint16_t ucr_reg)
{
    hwp_sysc_awo->ucr_reg.bit_field.ucr_reg = ucr_reg;
}

__STATIC_INLINE uint32_t sysc_awo_trim_reg_get(void)
{
    return hwp_sysc_awo->trim_reg.val;
}

__STATIC_INLINE void sysc_awo_trim_reg_set(uint32_t value)
{
    hwp_sysc_awo->trim_reg.val = value;
}

__STATIC_INLINE void sysc_awo_trim_reg_pack(uint32_t trim_reg)
{
    hwp_sysc_awo->trim_reg.val = (((uint32_t)trim_reg << 0));
}

__STATIC_INLINE void sysc_awo_trim_reg_unpack(uint32_t* trim_reg)
{
    T_SYSC_AWO_TRIM_REG localVal = hwp_sysc_awo->trim_reg;

    *trim_reg = localVal.bit_field.trim_reg;
}

__STATIC_INLINE uint32_t sysc_awo_trim_reg_getf(void)
{
    return hwp_sysc_awo->trim_reg.bit_field.trim_reg;
}

__STATIC_INLINE void sysc_awo_trim_reg_setf(uint32_t trim_reg)
{
    hwp_sysc_awo->trim_reg.bit_field.trim_reg = trim_reg;
}

__STATIC_INLINE uint32_t sysc_awo_gpio_l_pu_reg_get(void)
{
    return hwp_sysc_awo->gpio_l_pu_reg.val;
}

__STATIC_INLINE void sysc_awo_gpio_l_pu_reg_set(uint32_t value)
{
    hwp_sysc_awo->gpio_l_pu_reg.val = value;
}

__STATIC_INLINE void sysc_awo_gpio_l_pu_reg_pack(uint16_t gpil_pu_n)
{
    hwp_sysc_awo->gpio_l_pu_reg.val = (((uint32_t)gpil_pu_n << 0));
}

__STATIC_INLINE void sysc_awo_gpio_l_pu_reg_unpack(uint16_t* gpil_pu_n)
{
    T_SYSC_AWO_GPIO_L_PU_REG localVal = hwp_sysc_awo->gpio_l_pu_reg;

    *gpil_pu_n = localVal.bit_field.gpil_pu_n;
}

__STATIC_INLINE uint16_t sysc_awo_gpil_pu_n_getf(void)
{
    return hwp_sysc_awo->gpio_l_pu_reg.bit_field.gpil_pu_n;
}

__STATIC_INLINE void sysc_awo_gpil_pu_n_setf(uint16_t gpil_pu_n)
{
    hwp_sysc_awo->gpio_l_pu_reg.bit_field.gpil_pu_n = gpil_pu_n;
}

__STATIC_INLINE uint32_t sysc_awo_gpio_l_pd_reg_get(void)
{
    return hwp_sysc_awo->gpio_l_pd_reg.val;
}

__STATIC_INLINE void sysc_awo_gpio_l_pd_reg_set(uint32_t value)
{
    hwp_sysc_awo->gpio_l_pd_reg.val = value;
}

__STATIC_INLINE void sysc_awo_gpio_l_pd_reg_pack(uint16_t gpil_pd)
{
    hwp_sysc_awo->gpio_l_pd_reg.val = (((uint32_t)gpil_pd << 0));
}

__STATIC_INLINE void sysc_awo_gpio_l_pd_reg_unpack(uint16_t* gpil_pd)
{
    T_SYSC_AWO_GPIO_L_PD_REG localVal = hwp_sysc_awo->gpio_l_pd_reg;

    *gpil_pd = localVal.bit_field.gpil_pd;
}

__STATIC_INLINE uint16_t sysc_awo_gpil_pd_getf(void)
{
    return hwp_sysc_awo->gpio_l_pd_reg.bit_field.gpil_pd;
}

__STATIC_INLINE void sysc_awo_gpil_pd_setf(uint16_t gpil_pd)
{
    hwp_sysc_awo->gpio_l_pd_reg.bit_field.gpil_pd = gpil_pd;
}
#endif


