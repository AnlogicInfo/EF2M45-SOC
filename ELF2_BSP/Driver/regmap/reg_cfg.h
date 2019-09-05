//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may     
// only be used by a person authorised under and to the extent permitted       
// by a subsisting licensing agreement from FASTASIC Limited.              
//                                                                             
//            (C) COPYRIGHT 2015-2018 FASTASIC Limited.                  
//                ALL RIGHTS RESERVED                                          
//                                                                             
// This entire notice must be reproduced on all copies of this file            
// and copies of this file may only be made by a person if such person is      
// permitted to do so under the terms of a subsisting license agreement        
// from FASTASIC Limited.                                                  
//-----------------------------------------------------------------------------
#ifndef __REG_CFG_H__
#define __REG_CFG_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//cfg_sr_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    fpga_sr_reg : 32; /*31: 0, fpag status/control/wakeup/idcode/trim/trim_mask by cfg_srs select*/
    } bit_field;
} T_CFG_CFG_SR_ADDRESS;

//cfg_srs_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            srs :  3; /* 2: 0,        status registers select*/
        uint32_t                     reserved_0 : 29; /*31: 3,              field description*/
    } bit_field;
} T_CFG_CFG_SRS_ADDRESS;

//cfg_dr_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           data :  8; /* 7: 0,                  fpga cfg data*/
        uint32_t                     reserved_0 : 24; /*31: 8,              field description*/
    } bit_field;
} T_CFG_CFG_DR_ADDRESS;

//cfg_cr_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        sel_apb :  1; /* 0: 0,       enable cfg apb interface*/
        uint32_t                     reserved_2 :  3; /* 3: 1,              field description*/
        uint32_t                   apb_programn :  1; /* 4: 4,          fpga apb programn bit*/
        uint32_t                     reserved_1 :  3; /* 7: 5,              field description*/
        uint32_t                       apb_msel :  3; /*10: 8,                  fpga apb msel*/
        uint32_t                     reserved_0 : 21; /*31:11,              field description*/
    } bit_field;
} T_CFG_CFG_CR_ADDRESS;

//Registers Mapping to the same address

typedef struct
{
    volatile            T_CFG_CFG_SR_ADDRESS                 cfg_sr_address; /*  0x0,    RO, 0x00000000,    fpga status register_x000D_*/
    volatile           T_CFG_CFG_SRS_ADDRESS                cfg_srs_address; /*  0x4,    RW, 0x00000000, fpga status select register_x000D_*/
    volatile            T_CFG_CFG_DR_ADDRESS                 cfg_dr_address; /*  0x8,    RW, 0x00000000,         fpga cfg data register*/
    volatile            T_CFG_CFG_CR_ADDRESS                 cfg_cr_address; /*  0xc,    RW, 0x00000000, fpga cfg control register_x000D_*/
} T_HWP_CFG_T;

#define hwp_cfg ((T_HWP_CFG_T*)REG_CFG_BASE)


__STATIC_INLINE uint32_t cfg_cfg_sr_address_get(void)
{
    return hwp_cfg->cfg_sr_address.val;
}

__STATIC_INLINE void cfg_cfg_sr_address_unpack(uint32_t* fpga_sr_reg)
{
    T_CFG_CFG_SR_ADDRESS localVal = hwp_cfg->cfg_sr_address;

    *fpga_sr_reg = localVal.bit_field.fpga_sr_reg;
}

__STATIC_INLINE uint32_t cfg_fpga_sr_reg_getf(void)
{
    return hwp_cfg->cfg_sr_address.bit_field.fpga_sr_reg;
}

__STATIC_INLINE uint32_t cfg_cfg_srs_address_get(void)
{
    return hwp_cfg->cfg_srs_address.val;
}

__STATIC_INLINE void cfg_cfg_srs_address_set(uint32_t value)
{
    hwp_cfg->cfg_srs_address.val = value;
}

__STATIC_INLINE void cfg_cfg_srs_address_pack(uint8_t srs)
{
    hwp_cfg->cfg_srs_address.val = (((uint32_t)srs << 0));
}

__STATIC_INLINE void cfg_cfg_srs_address_unpack(uint8_t* srs)
{
    T_CFG_CFG_SRS_ADDRESS localVal = hwp_cfg->cfg_srs_address;

    *srs = localVal.bit_field.srs;
}

__STATIC_INLINE uint8_t cfg_srs_getf(void)
{
    return hwp_cfg->cfg_srs_address.bit_field.srs;
}

__STATIC_INLINE void cfg_srs_setf(uint8_t srs)
{
    hwp_cfg->cfg_srs_address.bit_field.srs = srs;
}

__STATIC_INLINE uint32_t cfg_cfg_dr_address_get(void)
{
    return hwp_cfg->cfg_dr_address.val;
}

__STATIC_INLINE void cfg_cfg_dr_address_set(uint32_t value)
{
    hwp_cfg->cfg_dr_address.val = value;
}

__STATIC_INLINE void cfg_cfg_dr_address_pack(uint8_t data)
{
    hwp_cfg->cfg_dr_address.val = (((uint32_t)data << 0));
}

__STATIC_INLINE void cfg_cfg_dr_address_unpack(uint8_t* data)
{
    T_CFG_CFG_DR_ADDRESS localVal = hwp_cfg->cfg_dr_address;

    *data = localVal.bit_field.data;
}

__STATIC_INLINE uint8_t cfg_data_getf(void)
{
    return hwp_cfg->cfg_dr_address.bit_field.data;
}

__STATIC_INLINE void cfg_data_setf(uint8_t data)
{
    hwp_cfg->cfg_dr_address.bit_field.data = data;
}

__STATIC_INLINE uint32_t cfg_cfg_cr_address_get(void)
{
    return hwp_cfg->cfg_cr_address.val;
}

__STATIC_INLINE void cfg_cfg_cr_address_set(uint32_t value)
{
    hwp_cfg->cfg_cr_address.val = value;
}

__STATIC_INLINE void cfg_cfg_cr_address_pack(uint8_t apb_msel, uint8_t apb_programn, uint8_t sel_apb)
{
    hwp_cfg->cfg_cr_address.val = (((uint32_t)apb_msel << 8) | ((uint32_t)apb_programn << 4) | ((uint32_t)sel_apb << 0));
}

__STATIC_INLINE void cfg_cfg_cr_address_unpack(uint8_t* apb_msel, uint8_t* apb_programn, uint8_t* sel_apb)
{
    T_CFG_CFG_CR_ADDRESS localVal = hwp_cfg->cfg_cr_address;

    *apb_msel = localVal.bit_field.apb_msel;
    *apb_programn = localVal.bit_field.apb_programn;
    *sel_apb = localVal.bit_field.sel_apb;
}

__STATIC_INLINE uint8_t cfg_apb_msel_getf(void)
{
    return hwp_cfg->cfg_cr_address.bit_field.apb_msel;
}

__STATIC_INLINE void cfg_apb_msel_setf(uint8_t apb_msel)
{
    hwp_cfg->cfg_cr_address.bit_field.apb_msel = apb_msel;
}

__STATIC_INLINE uint8_t cfg_apb_programn_getf(void)
{
    return hwp_cfg->cfg_cr_address.bit_field.apb_programn;
}

__STATIC_INLINE void cfg_apb_programn_setf(uint8_t apb_programn)
{
    hwp_cfg->cfg_cr_address.bit_field.apb_programn = apb_programn;
}

__STATIC_INLINE uint8_t cfg_sel_apb_getf(void)
{
    return hwp_cfg->cfg_cr_address.bit_field.sel_apb;
}

__STATIC_INLINE void cfg_sel_apb_setf(uint8_t sel_apb)
{
    hwp_cfg->cfg_cr_address.bit_field.sel_apb = sel_apb;
}
#endif


