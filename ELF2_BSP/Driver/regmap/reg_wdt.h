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
#ifndef __REG_WDT_H__
#define __REG_WDT_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//wdt_cr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         wdt_en :  1; /* 0: 0, When the configuration parameter WDT_ALWAYS_EN = 0, this bit can be set;otherwise, it is read-only. This bit is used to enable and disable the DW_apb_wdt.When disabled, the counter does not decrement. Thus, no interrupts or systemresets are generated.
        uint32_t                           rmod :  1; /* 1: 1, Writes have no effect when the parameter WDT_HC_RMOD = 1, thus this register becomes read-only. Selects the output response generated to a timeout. 0 = Generate a system reset. 1 = First generate an interrupt and if it is not cleared by the time a second timeout occurs then generate a system reset.*/
        uint32_t                            rpl :  3; /* 4: 2, Reset pulse length.
        uint32_t                          dummy :  1; /* 5: 5, Redundant R/W bit. Included for ping test purposes, as it is the only R/W register bit that is in every configuration of the DW_apb_wdt.*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_WDT_WDT_CR;

//wdt_torr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            top :  4; /* 3: 0, Timeout period.
        uint32_t                       top_init :  4; /* 7: 4, Timeout period for initialization.
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_WDT_WDT_TORR;

//wdt_ccvr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t     currentcountervalueregiste : 16; /*15: 0, This register, when read, is the current value of the internal counter. This value is read coherently when ever it is read, which is relevant when the APB_DATA_WIDTH is less than the counter width.*/
        uint32_t                     reserved_0 : 16; /*31:16,                             NA*/
    } bit_field;
} T_WDT_WDT_CCVR;

//wdt_crr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t         counterrestartregister :  8; /* 7: 0, This register is used to restart the WDT counter. As a safety feature to prevent accidental restarts, the value 0x76 must be written. A restart also clears the WDT interrupt. Reading this register returns zero.*/
        uint32_t                     reserved_0 : 24; /*31: 8,                             NA*/
    } bit_field;
} T_WDT_WDT_CRR;

//wdt_stat
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t        interruptstatusregister :  1; /* 0: 0, This register shows the interrupt status of the WDT.
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_WDT_WDT_STAT;

//wdt_eoi
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t         interruptclearregister :  1; /* 0: 0, Clears the watchdog interrupt. This can be used to clear the interrupt without restarting the watchdog counter.*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_WDT_WDT_EOI;

//wdt_comp_params_5
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t            cp_wdt_user_top_max : 32; /*31: 0, Upper limit of Timeout Period parameters. The value of this
    } bit_field;
} T_WDT_WDT_COMP_PARAMS_5;

//wdt_comp_params_4
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t       cp_wdt_user_top_init_max : 32; /*31: 0, Upper limit of Initial Timeout Period parameters. The value of this register is derived from the WDT_USER_TOP_INIT_* coreConsultant parameters. See Table 4-2 on page 42 for a description of these
    } bit_field;
} T_WDT_WDT_COMP_PARAMS_4;

//wdt_comp_params_3
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 cd_wdt_top_rst : 32; /*31: 0, The value of this register is derived from the WDT_TOP_RST coreConsultant parameter. See Table 4-2 on page 42 for a escription
    } bit_field;
} T_WDT_WDT_COMP_PARAMS_3;

//wdt_comp_params_2
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 cp_wdt_cnt_rst : 32; /*31: 0, The value of this register is derived from the WDT_RST_CNT coreConsultant parameter. See Table 4-2 on page 42 for a escription
    } bit_field;
} T_WDT_WDT_COMP_PARAMS_2;

//wdt_comp_params_1
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               cp_wdt_always_en :  1; /* 0: 0, (WDT_ALWAYS_EN == FALSE) =0
        uint32_t               cp_wdt_dflt_rmod :  1; /* 1: 1, (WDT_DFLT_RMOD == FALSE) =0
        uint32_t                cp_wdt_dual_top :  1; /* 2: 2, (WDT_DUAL_TOP == FALSE) =0
        uint32_t                 cp_wdt_hc_rmod :  1; /* 3: 3, (WDT_HC_RMOD == FALSE) =0
        uint32_t                  cp_wdt_hc_rpl :  1; /* 4: 4, (WDT_HC_RPL == FALSE) =0
        uint32_t                  cp_wdt_hc_top :  1; /* 5: 5, (WDT_HC_TOP == FALSE) =0
        uint32_t             cp_wdt_use_fix_top :  1; /* 6: 6, (WDT_USE_FIX_TOP == FALSE) =0
        uint32_t                   cp_wdt_pause :  1; /* 7: 7,                             NA*/
        uint32_t          cp_wdt_apb_data_width :  2; /* 9: 8, (APB_DATA_WIDTH == 8) = 0
        uint32_t                cp_wdt_dflt_rpl :  3; /*12:10,                   WDT_DFLT_RPL*/
        uint32_t                     reserved_1 :  3; /*15:13,                             NA*/
        uint32_t                cp_wdt_dflt_top :  4; /*19:16,                   WDT_DFLT_TOP*/
        uint32_t           cp_wdt_dflt_top_init :  4; /*23:20,              WDT_DFLT_TOP_INIT*/
        uint32_t               cp_wdt_cnt_width :  5; /*28:24,             WDT_CNT_WIDTH - 16*/
        uint32_t                     reserved_0 :  3; /*31:29,                             NA*/
    } bit_field;
} T_WDT_WDT_COMP_PARAMS_1;

//wdt_comp_version
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t            wdtcomponentversion : 32; /*31: 0, ASCII value for each number in the version, followed by *. For example 32_30_31_2A represents the version 2.01* */
    } bit_field;
} T_WDT_WDT_COMP_VERSION;

//wdt_comp_type
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t          componenttyperegister : 32; /*31: 0, Designware Component Type number = 0x44_57_01_20. This assigned unique hex value is constant, and is derived from the two ASCII letters ��DW�� followed by a 16-bit unsigned number.*/
    } bit_field;
} T_WDT_WDT_COMP_TYPE;

//Registers Mapping to the same address

typedef struct
{
    volatile                    T_WDT_WDT_CR                         wdt_cr; /*  0x0,    RW, 0x00000002,               Control Register*/
    volatile                  T_WDT_WDT_TORR                       wdt_torr; /*  0x4,    RW, 0x00000000,         Timeout Range Register*/
    volatile                  T_WDT_WDT_CCVR                       wdt_ccvr; /*  0x8,    RO, 0x0000FFFF, Current Counter Value Register*/
    volatile                   T_WDT_WDT_CRR                        wdt_crr; /*  0xc,    RW, 0x00000000,       Counter Restart Register*/
    volatile                  T_WDT_WDT_STAT                       wdt_stat; /* 0x10,    RO, 0x00000000,      Interrupt Status Register*/
    volatile                   T_WDT_WDT_EOI                        wdt_eoi; /* 0x14,    RO, 0x00000000,       Interrupt Clear Register*/
    volatile                        uint32_t                 reserved_0[51];
    volatile         T_WDT_WDT_COMP_PARAMS_5              wdt_comp_params_5; /* 0xe4,    RO, 0x00000000, Component Parameters Register 5*/
    volatile         T_WDT_WDT_COMP_PARAMS_4              wdt_comp_params_4; /* 0xe8,    RO, 0x00000000, Component Parameters Register 4*/
    volatile         T_WDT_WDT_COMP_PARAMS_3              wdt_comp_params_3; /* 0xec,    RO, 0x00000000, Component Parameters Register 3*/
    volatile         T_WDT_WDT_COMP_PARAMS_2              wdt_comp_params_2; /* 0xf0,    RO, 0x0000FFFF, Component Parameters Register 2*/
    volatile         T_WDT_WDT_COMP_PARAMS_1              wdt_comp_params_1; /* 0xf4,    RO, 0x00000242, Component Parameters Register 1*/
    volatile          T_WDT_WDT_COMP_VERSION               wdt_comp_version; /* 0xf8,    RO, 0x3130392A,     Component Version Register*/
    volatile             T_WDT_WDT_COMP_TYPE                  wdt_comp_type; /* 0xfc,    RO, 0x44570120,                             NA*/
} T_HWP_WDT_T;

#define hwp_wdt ((T_HWP_WDT_T*)REG_WDT_BASE)


__STATIC_INLINE uint32_t wdt_wdt_cr_get(void)
{
    return hwp_wdt->wdt_cr.val;
}

__STATIC_INLINE void wdt_wdt_cr_set(uint32_t value)
{
    hwp_wdt->wdt_cr.val = value;
}

__STATIC_INLINE void wdt_wdt_cr_pack(uint8_t dummy, uint8_t rpl, uint8_t rmod, uint8_t wdt_en)
{
    hwp_wdt->wdt_cr.val = (((uint32_t)dummy << 5) | ((uint32_t)rpl << 2) | ((uint32_t)rmod << 1) | ((uint32_t)wdt_en << 0));
}

__STATIC_INLINE void wdt_wdt_cr_unpack(uint8_t* dummy, uint8_t* rpl, uint8_t* rmod, uint8_t* wdt_en)
{
    T_WDT_WDT_CR localVal = hwp_wdt->wdt_cr;

    *dummy = localVal.bit_field.dummy;
    *rpl = localVal.bit_field.rpl;
    *rmod = localVal.bit_field.rmod;
    *wdt_en = localVal.bit_field.wdt_en;
}

__STATIC_INLINE uint8_t wdt_dummy_getf(void)
{
    return hwp_wdt->wdt_cr.bit_field.dummy;
}

__STATIC_INLINE void wdt_dummy_setf(uint8_t dummy)
{
    hwp_wdt->wdt_cr.bit_field.dummy = dummy;
}

__STATIC_INLINE uint8_t wdt_rpl_getf(void)
{
    return hwp_wdt->wdt_cr.bit_field.rpl;
}

__STATIC_INLINE void wdt_rpl_setf(uint8_t rpl)
{
    hwp_wdt->wdt_cr.bit_field.rpl = rpl;
}

__STATIC_INLINE uint8_t wdt_rmod_getf(void)
{
    return hwp_wdt->wdt_cr.bit_field.rmod;
}

__STATIC_INLINE void wdt_rmod_setf(uint8_t rmod)
{
    hwp_wdt->wdt_cr.bit_field.rmod = rmod;
}

__STATIC_INLINE uint8_t wdt_wdt_en_getf(void)
{
    return hwp_wdt->wdt_cr.bit_field.wdt_en;
}

__STATIC_INLINE void wdt_wdt_en_setf(uint8_t wdt_en)
{
    hwp_wdt->wdt_cr.bit_field.wdt_en = wdt_en;
}

__STATIC_INLINE uint32_t wdt_wdt_torr_get(void)
{
    return hwp_wdt->wdt_torr.val;
}

__STATIC_INLINE void wdt_wdt_torr_set(uint32_t value)
{
    hwp_wdt->wdt_torr.val = value;
}

__STATIC_INLINE void wdt_wdt_torr_pack(uint8_t top)
{
    hwp_wdt->wdt_torr.val = (((uint32_t)top << 0));
}

__STATIC_INLINE void wdt_wdt_torr_unpack(uint8_t* top_init, uint8_t* top)
{
    T_WDT_WDT_TORR localVal = hwp_wdt->wdt_torr;

    *top_init = localVal.bit_field.top_init;
    *top = localVal.bit_field.top;
}

__STATIC_INLINE uint8_t wdt_top_init_getf(void)
{
    return hwp_wdt->wdt_torr.bit_field.top_init;
}

__STATIC_INLINE uint8_t wdt_top_getf(void)
{
    return hwp_wdt->wdt_torr.bit_field.top;
}

__STATIC_INLINE void wdt_top_setf(uint8_t top)
{
    hwp_wdt->wdt_torr.bit_field.top = top;
}

__STATIC_INLINE uint32_t wdt_wdt_ccvr_get(void)
{
    return hwp_wdt->wdt_ccvr.val;
}

__STATIC_INLINE void wdt_wdt_ccvr_unpack(uint16_t* currentcountervalueregiste)
{
    T_WDT_WDT_CCVR localVal = hwp_wdt->wdt_ccvr;

    *currentcountervalueregiste = localVal.bit_field.currentcountervalueregiste;
}

__STATIC_INLINE uint16_t wdt_currentcountervalueregiste_getf(void)
{
    return hwp_wdt->wdt_ccvr.bit_field.currentcountervalueregiste;
}

__STATIC_INLINE uint32_t wdt_wdt_crr_get(void)
{
    return hwp_wdt->wdt_crr.val;
}

__STATIC_INLINE void wdt_wdt_crr_set(uint32_t value)
{
    hwp_wdt->wdt_crr.val = value;
}

__STATIC_INLINE void wdt_wdt_crr_pack(uint8_t counterrestartregister)
{
    hwp_wdt->wdt_crr.val = (((uint32_t)counterrestartregister << 0));
}

__STATIC_INLINE uint32_t wdt_wdt_stat_get(void)
{
    return hwp_wdt->wdt_stat.val;
}

__STATIC_INLINE void wdt_wdt_stat_unpack(uint8_t* interruptstatusregister)
{
    T_WDT_WDT_STAT localVal = hwp_wdt->wdt_stat;

    *interruptstatusregister = localVal.bit_field.interruptstatusregister;
}

__STATIC_INLINE uint8_t wdt_interruptstatusregister_getf(void)
{
    return hwp_wdt->wdt_stat.bit_field.interruptstatusregister;
}

__STATIC_INLINE uint32_t wdt_wdt_eoi_get(void)
{
    return hwp_wdt->wdt_eoi.val;
}

__STATIC_INLINE void wdt_wdt_eoi_unpack(uint8_t* interruptclearregister)
{
    T_WDT_WDT_EOI localVal = hwp_wdt->wdt_eoi;

    *interruptclearregister = localVal.bit_field.interruptclearregister;
}

__STATIC_INLINE uint8_t wdt_interruptclearregister_getf(void)
{
    return hwp_wdt->wdt_eoi.bit_field.interruptclearregister;
}

__STATIC_INLINE uint32_t wdt_wdt_comp_params_5_get(void)
{
    return hwp_wdt->wdt_comp_params_5.val;
}

__STATIC_INLINE void wdt_wdt_comp_params_5_unpack(uint32_t* cp_wdt_user_top_max)
{
    T_WDT_WDT_COMP_PARAMS_5 localVal = hwp_wdt->wdt_comp_params_5;

    *cp_wdt_user_top_max = localVal.bit_field.cp_wdt_user_top_max;
}

__STATIC_INLINE uint32_t wdt_cp_wdt_user_top_max_getf(void)
{
    return hwp_wdt->wdt_comp_params_5.bit_field.cp_wdt_user_top_max;
}

__STATIC_INLINE uint32_t wdt_wdt_comp_params_4_get(void)
{
    return hwp_wdt->wdt_comp_params_4.val;
}

__STATIC_INLINE void wdt_wdt_comp_params_4_unpack(uint32_t* cp_wdt_user_top_init_max)
{
    T_WDT_WDT_COMP_PARAMS_4 localVal = hwp_wdt->wdt_comp_params_4;

    *cp_wdt_user_top_init_max = localVal.bit_field.cp_wdt_user_top_init_max;
}

__STATIC_INLINE uint32_t wdt_cp_wdt_user_top_init_max_getf(void)
{
    return hwp_wdt->wdt_comp_params_4.bit_field.cp_wdt_user_top_init_max;
}

__STATIC_INLINE uint32_t wdt_wdt_comp_params_3_get(void)
{
    return hwp_wdt->wdt_comp_params_3.val;
}

__STATIC_INLINE void wdt_wdt_comp_params_3_unpack(uint32_t* cd_wdt_top_rst)
{
    T_WDT_WDT_COMP_PARAMS_3 localVal = hwp_wdt->wdt_comp_params_3;

    *cd_wdt_top_rst = localVal.bit_field.cd_wdt_top_rst;
}

__STATIC_INLINE uint32_t wdt_cd_wdt_top_rst_getf(void)
{
    return hwp_wdt->wdt_comp_params_3.bit_field.cd_wdt_top_rst;
}

__STATIC_INLINE uint32_t wdt_wdt_comp_params_2_get(void)
{
    return hwp_wdt->wdt_comp_params_2.val;
}

__STATIC_INLINE void wdt_wdt_comp_params_2_unpack(uint32_t* cp_wdt_cnt_rst)
{
    T_WDT_WDT_COMP_PARAMS_2 localVal = hwp_wdt->wdt_comp_params_2;

    *cp_wdt_cnt_rst = localVal.bit_field.cp_wdt_cnt_rst;
}

__STATIC_INLINE uint32_t wdt_cp_wdt_cnt_rst_getf(void)
{
    return hwp_wdt->wdt_comp_params_2.bit_field.cp_wdt_cnt_rst;
}

__STATIC_INLINE uint32_t wdt_wdt_comp_params_1_get(void)
{
    return hwp_wdt->wdt_comp_params_1.val;
}

__STATIC_INLINE void wdt_wdt_comp_params_1_unpack(uint8_t* cp_wdt_cnt_width, uint8_t* cp_wdt_dflt_top_init, uint8_t* cp_wdt_dflt_top, uint8_t* cp_wdt_dflt_rpl, uint8_t* cp_wdt_apb_data_width, uint8_t* cp_wdt_pause, uint8_t* cp_wdt_use_fix_top, uint8_t* cp_wdt_hc_top, uint8_t* cp_wdt_hc_rpl, uint8_t* cp_wdt_hc_rmod, uint8_t* cp_wdt_dual_top, uint8_t* cp_wdt_dflt_rmod, uint8_t* cp_wdt_always_en)
{
    T_WDT_WDT_COMP_PARAMS_1 localVal = hwp_wdt->wdt_comp_params_1;

    *cp_wdt_cnt_width = localVal.bit_field.cp_wdt_cnt_width;
    *cp_wdt_dflt_top_init = localVal.bit_field.cp_wdt_dflt_top_init;
    *cp_wdt_dflt_top = localVal.bit_field.cp_wdt_dflt_top;
    *cp_wdt_dflt_rpl = localVal.bit_field.cp_wdt_dflt_rpl;
    *cp_wdt_apb_data_width = localVal.bit_field.cp_wdt_apb_data_width;
    *cp_wdt_pause = localVal.bit_field.cp_wdt_pause;
    *cp_wdt_use_fix_top = localVal.bit_field.cp_wdt_use_fix_top;
    *cp_wdt_hc_top = localVal.bit_field.cp_wdt_hc_top;
    *cp_wdt_hc_rpl = localVal.bit_field.cp_wdt_hc_rpl;
    *cp_wdt_hc_rmod = localVal.bit_field.cp_wdt_hc_rmod;
    *cp_wdt_dual_top = localVal.bit_field.cp_wdt_dual_top;
    *cp_wdt_dflt_rmod = localVal.bit_field.cp_wdt_dflt_rmod;
    *cp_wdt_always_en = localVal.bit_field.cp_wdt_always_en;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_cnt_width_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_cnt_width;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_dflt_top_init_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_dflt_top_init;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_dflt_top_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_dflt_top;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_dflt_rpl_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_dflt_rpl;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_apb_data_width_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_apb_data_width;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_pause_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_pause;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_use_fix_top_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_use_fix_top;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_hc_top_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_hc_top;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_hc_rpl_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_hc_rpl;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_hc_rmod_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_hc_rmod;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_dual_top_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_dual_top;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_dflt_rmod_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_dflt_rmod;
}

__STATIC_INLINE uint8_t wdt_cp_wdt_always_en_getf(void)
{
    return hwp_wdt->wdt_comp_params_1.bit_field.cp_wdt_always_en;
}

__STATIC_INLINE uint32_t wdt_wdt_comp_version_get(void)
{
    return hwp_wdt->wdt_comp_version.val;
}

__STATIC_INLINE void wdt_wdt_comp_version_unpack(uint32_t* wdtcomponentversion)
{
    T_WDT_WDT_COMP_VERSION localVal = hwp_wdt->wdt_comp_version;

    *wdtcomponentversion = localVal.bit_field.wdtcomponentversion;
}

__STATIC_INLINE uint32_t wdt_wdtcomponentversion_getf(void)
{
    return hwp_wdt->wdt_comp_version.bit_field.wdtcomponentversion;
}

__STATIC_INLINE uint32_t wdt_wdt_comp_type_get(void)
{
    return hwp_wdt->wdt_comp_type.val;
}

__STATIC_INLINE void wdt_wdt_comp_type_unpack(uint32_t* componenttyperegister)
{
    T_WDT_WDT_COMP_TYPE localVal = hwp_wdt->wdt_comp_type;

    *componenttyperegister = localVal.bit_field.componenttyperegister;
}

__STATIC_INLINE uint32_t wdt_componenttyperegister_getf(void)
{
    return hwp_wdt->wdt_comp_type.bit_field.componenttyperegister;
}
#endif

