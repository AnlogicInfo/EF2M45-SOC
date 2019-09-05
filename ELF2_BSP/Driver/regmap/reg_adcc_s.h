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
#ifndef __REG_ADCC_S_H__
#define __REG_ADCC_S_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//adc_cfg_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          adcen :  1; /* 0: 0,                     enable adc*/
        uint32_t                     reserved_3 :  1; /* 1: 1,              field description*/
        uint32_t                        sel_mcu :  1; /* 2: 2,    select adc work in mcu mode*/
        uint32_t                     reserved_2 :  1; /* 3: 3,              field description*/
        uint32_t                         adcpre :  3; /* 6: 4,             adc clock prescale*/
        uint32_t                     reserved_1 :  1; /* 7: 7,              field description*/
        uint32_t                   ldo_force_on :  1; /* 8: 8, force wait on before adc start work*/
        uint32_t                  ldo_force_off :  1; /* 9: 9, force wait off before adc start work*/
        uint32_t                    ldo_sd_sngl :  1; /*10:10, force wait before everytime adc start work*/
        uint32_t                     reserved_0 : 21; /*31:11,              field description*/
    } bit_field;
} T_ADCC_S_ADC_CFG_ADDRESS;

//adc_ldo_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ldo_dly : 10; /* 9: 0,           default delay number*/
        uint32_t                     reserved_1 :  6; /*15:10,              field description*/
        uint32_t                         ch_dly : 10; /*25:16, default channel delay number(no used)*/
        uint32_t                     reserved_0 :  6; /*31:26,              field description*/
    } bit_field;
} T_ADCC_S_ADC_LDO_ADDRESS;

//adc_cr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     reserved_3 :  2; /* 1: 0,              field description*/
        uint32_t                          trgen :  1; /* 2: 2, external trigger enable bit. ADC continuous mode not work in trigger mode.*/
        uint32_t                     reserved_2 :  1; /* 3: 3,              field description*/
        uint32_t                         trgsel :  3; /* 6: 4, external trigger source select.000:timer, 001:sw trigger, 010:ext trigger*/
        uint32_t                     reserved_1 :  4; /*10: 7,              field description*/
        uint32_t                           adsm :  1; /*11:11,   enable AD works in scan mode*/
        uint32_t                     reserved_0 : 20; /*31:12,              field description*/
    } bit_field;
} T_ADCC_S_ADC_CR0_ADDRESS;

//adc_cr1_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          dmaen :  1; /* 0: 0,  enable signal adc dam request*/
        uint32_t                     reserved_1 :  7; /* 7: 1,              field description*/
        uint32_t                      adc_start :  1; /* 8: 8,        SW start A/D conversion*/
        uint32_t                          adcnt :  1; /* 9: 9, enable A/D continuous work mode. When adc work in trigger mode, ADCNT does not work.*/
        uint32_t                          align :  1; /*10:10,            A/D data align mode*/
        uint32_t                     reserved_0 : 21; /*31:11,              field description*/
    } bit_field;
} T_ADCC_S_ADC_CR1_ADDRESS;

//adc_status_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          eocif :  1; /* 0: 0, end of channel conversion flag*/
        uint32_t                          eosif :  1; /* 1: 1, end of scan mode conversion flag*/
        uint32_t                           busy :  1; /* 2: 2,       A/D conversion busy flag*/
        uint32_t                     reserved_2 :  1; /* 3: 3,              field description*/
        uint32_t                    channel_run :  3; /* 6: 4, the channel which is converting*/
        uint32_t                     reserved_1 :  1; /* 7: 7,              field description*/
        uint32_t                       ch_valid :  8; /*15: 8, display which channel data is valid*/
        uint32_t                     ch_overrun :  8; /*23:16, display which channel data is overrun*/
        uint32_t                     reserved_0 :  8; /*31:24,              field description*/
    } bit_field;
} T_ADCC_S_ADC_STATUS_ADDRESS;

//adc_ie_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         eos_ie :  1; /* 0: 0,       eos interrupt enable bit*/
        uint32_t                         eoc_ie :  1; /* 1: 1,       eoc interrupt enable bit*/
        uint32_t                     reserved_1 :  1; /* 2: 2,              field description*/
        uint32_t                     overrun_ie :  1; /* 3: 3, A/D overrun interrupt enable bit*/
        uint32_t                     reserved_0 : 28; /*31: 4,              field description*/
    } bit_field;
} T_ADCC_S_ADC_IE_ADDRESS;

//adc_sqr_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            sq0 :  3; /* 2: 0,     channel num of sequence #0*/
        uint32_t                            sq1 :  3; /* 5: 3,     channel num of sequence #1*/
        uint32_t                            sq2 :  3; /* 8: 6,     channel num of sequence #2*/
        uint32_t                            sq3 :  3; /*11: 9,     channel num of sequence #3*/
        uint32_t                            sq4 :  3; /*14:12,     channel num of sequence #4*/
        uint32_t                            sq5 :  3; /*17:15,     channel num of sequence #5*/
        uint32_t                            sq6 :  3; /*20:18,     channel num of sequence #6*/
        uint32_t                            sq7 :  3; /*23:21,     channel num of sequence #7*/
        uint32_t                           losq :  3; /*26:24, total channel - 1,indicate which sequence #number is the first start.when single ch mode, losq = 0*/
        uint32_t                     reserved_0 :  5; /*31:27,              field description*/
    } bit_field;
} T_ADCC_S_ADC_SQR_ADDRESS;

//adc_swtr_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         sw_trg :  1; /* 0: 0,                software tigger*/
        uint32_t                     reserved_0 : 31; /*31: 1,              field description*/
    } bit_field;
} T_ADCC_S_ADC_SWTR_ADDRESS;

//adc_tim_cr_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            cen :  1; /* 0: 0,                   timer enable*/
        uint32_t                            opm :  1; /* 1: 1,                 one pulse mode*/
        uint32_t                     reserved_0 : 30; /*31: 2,              field description*/
    } bit_field;
} T_ADCC_S_ADC_TIM_CR_ADDRESS;

//adc_tim_cnt
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            cnt : 32; /*31: 0,           timer counter number*/
    } bit_field;
} T_ADCC_S_ADC_TIM_CNT;

//adc_tim_arr_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            arr : 32; /*31: 0,     timer auto reload register*/
    } bit_field;
} T_ADCC_S_ADC_TIM_ARR_ADDRESS;

//adc_data_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       adc_data : 16; /*15: 0,            A/D conversion data*/
        uint32_t                    channel_sel :  3; /*18:16, channel which generate adc_data*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                        overrun :  1; /*20:20, channel which generate adc_data overrun flag */
        uint32_t                          valid :  1; /*21:21, channel which generate adc_data valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_ADC_DATA_ADDRESS;

//ch0_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch0_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch0_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch0_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch0_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH0_ADC_DR0_ADDRESS;

//ch1_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch1_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch1_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch1_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch1_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH1_ADC_DR0_ADDRESS;

//ch2_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch2_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch2_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch2_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch2_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH2_ADC_DR0_ADDRESS;

//ch3_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch3_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch3_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch3_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch3_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH3_ADC_DR0_ADDRESS;

//ch4_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch4_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch4_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch4_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch4_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH4_ADC_DR0_ADDRESS;

//ch5_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch5_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch5_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch5_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch5_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH5_ADC_DR0_ADDRESS;

//ch6_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch6_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch6_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch6_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch6_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH6_ADC_DR0_ADDRESS;

//ch7_adc_dr0_address
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch7_adc_data : 16; /*15: 0,           sq0 channel adc data*/
        uint32_t                ch7_channel_sel :  3; /*18:16,             sq0 channel number*/
        uint32_t                     reserved_1 :  1; /*19:19,              field description*/
        uint32_t                    ch7_overrun :  1; /*20:20,      sq0 channel overrun flag */
        uint32_t                      ch7_valid :  1; /*21:21,        sq0 channel valid flag */
        uint32_t                     reserved_0 : 10; /*31:22,              field description*/
    } bit_field;
} T_ADCC_S_CH7_ADC_DR0_ADDRESS;

//Registers Mapping to the same address

typedef struct
{
    volatile        T_ADCC_S_ADC_CFG_ADDRESS                adc_cfg_address; /*  0x0,    RW, 0x00000000,               adc cfg register*/
    volatile        T_ADCC_S_ADC_LDO_ADDRESS                adc_ldo_address; /*  0x4,    RW, 0x00000000,      adc wait counter register*/
    volatile        T_ADCC_S_ADC_CR0_ADDRESS                adc_cr0_address; /*  0x8,    RW, 0x00000000,         adc control_0 register*/
    volatile        T_ADCC_S_ADC_CR1_ADDRESS                adc_cr1_address; /*  0xc,    RW, 0x00000000,         adc control_1 register*/
    volatile     T_ADCC_S_ADC_STATUS_ADDRESS             adc_status_address; /* 0x10,    RW, 0x00000000,            adc status register*/
    volatile         T_ADCC_S_ADC_IE_ADDRESS                 adc_ie_address; /* 0x14,    RW, 0x00000000,  adc interrupt enable register*/
    volatile        T_ADCC_S_ADC_SQR_ADDRESS                adc_sqr_address; /* 0x18,    RW, 0x00000000, adc sequence channel select register*/
    volatile       T_ADCC_S_ADC_SWTR_ADDRESS               adc_swtr_address; /* 0x1c,    RW, 0x00000000,               software trigger*/
    volatile     T_ADCC_S_ADC_TIM_CR_ADDRESS             adc_tim_cr_address; /* 0x20,    RW, 0x00000000,     adc timer control register*/
    volatile            T_ADCC_S_ADC_TIM_CNT                    adc_tim_cnt; /* 0x24,    RO, 0x00000000,     adc timer counter register*/
    volatile    T_ADCC_S_ADC_TIM_ARR_ADDRESS            adc_tim_arr_address; /* 0x28,    RW, 0x00000000,     timer auto reload register*/
    volatile                        uint32_t                  reserved_0[5];
    volatile       T_ADCC_S_ADC_DATA_ADDRESS               adc_data_address; /* 0x40,    RO, 0x00000000,              adc data register*/
    volatile                        uint32_t                 reserved_1[17];
    volatile    T_ADCC_S_CH0_ADC_DR0_ADDRESS            ch0_adc_dr0_address; /* 0x88,    RO, 0x00000000,   A/D sq0 data/status register*/
    volatile    T_ADCC_S_CH1_ADC_DR0_ADDRESS            ch1_adc_dr0_address; /* 0x8c,    RO, 0x00000000,   A/D sq0 data/status register*/
    volatile    T_ADCC_S_CH2_ADC_DR0_ADDRESS            ch2_adc_dr0_address; /* 0x90,    RO, 0x00000000,   A/D sq0 data/status register*/
    volatile    T_ADCC_S_CH3_ADC_DR0_ADDRESS            ch3_adc_dr0_address; /* 0x94,    RO, 0x00000000,   A/D sq0 data/status register*/
    volatile    T_ADCC_S_CH4_ADC_DR0_ADDRESS            ch4_adc_dr0_address; /* 0x98,    RO, 0x00000000,   A/D sq0 data/status register*/
    volatile    T_ADCC_S_CH5_ADC_DR0_ADDRESS            ch5_adc_dr0_address; /* 0x9c,    RO, 0x00000000,   A/D sq0 data/status register*/
    volatile    T_ADCC_S_CH6_ADC_DR0_ADDRESS            ch6_adc_dr0_address; /* 0xa0,    RO, 0x00000000,   A/D sq0 data/status register*/
    volatile    T_ADCC_S_CH7_ADC_DR0_ADDRESS            ch7_adc_dr0_address; /* 0xa4,    RO, 0x00000000,   A/D sq0 data/status register*/
} T_HWP_ADCC_S_T;

#define hwp_adcc_s ((T_HWP_ADCC_S_T*)REG_ADCC_S_BASE)


__STATIC_INLINE uint32_t adcc_s_adc_cfg_address_get(void)
{
    return hwp_adcc_s->adc_cfg_address.val;
}

__STATIC_INLINE void adcc_s_adc_cfg_address_set(uint32_t value)
{
    hwp_adcc_s->adc_cfg_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_cfg_address_pack(uint8_t ldo_sd_sngl, uint8_t ldo_force_off, uint8_t ldo_force_on, uint8_t adcpre, uint8_t sel_mcu, uint8_t adcen)
{
    hwp_adcc_s->adc_cfg_address.val = (((uint32_t)ldo_sd_sngl << 10) | ((uint32_t)ldo_force_off << 9) | ((uint32_t)ldo_force_on << 8) | ((uint32_t)adcpre << 4) | ((uint32_t)sel_mcu << 2) | ((uint32_t)adcen << 0));
}

__STATIC_INLINE void adcc_s_adc_cfg_address_unpack(uint8_t* ldo_sd_sngl, uint8_t* ldo_force_off, uint8_t* ldo_force_on, uint8_t* adcpre, uint8_t* sel_mcu, uint8_t* adcen)
{
    T_ADCC_S_ADC_CFG_ADDRESS localVal = hwp_adcc_s->adc_cfg_address;

    *ldo_sd_sngl = localVal.bit_field.ldo_sd_sngl;
    *ldo_force_off = localVal.bit_field.ldo_force_off;
    *ldo_force_on = localVal.bit_field.ldo_force_on;
    *adcpre = localVal.bit_field.adcpre;
    *sel_mcu = localVal.bit_field.sel_mcu;
    *adcen = localVal.bit_field.adcen;
}

#if 0
__STATIC_INLINE uint8_t adcc_s_ldo_sd_sngl_getf(void)
{
    return hwp_adcc_s->adc_cfg_address.bit_field.ldo_sd_sngl;
}

__STATIC_INLINE void adcc_s_ldo_sd_sngl_setf(uint8_t ldo_sd_sngl)
{
    hwp_adcc_s->adc_cfg_address.bit_field.ldo_sd_sngl = ldo_sd_sngl;
}

__STATIC_INLINE uint8_t adcc_s_ldo_force_off_getf(void)
{
    return hwp_adcc_s->adc_cfg_address.bit_field.ldo_force_off;
}

__STATIC_INLINE void adcc_s_ldo_force_off_setf(uint8_t ldo_force_off)
{
    hwp_adcc_s->adc_cfg_address.bit_field.ldo_force_off = ldo_force_off;
}

__STATIC_INLINE uint8_t adcc_s_ldo_force_on_getf(void)
{
    return hwp_adcc_s->adc_cfg_address.bit_field.ldo_force_on;
}

__STATIC_INLINE void adcc_s_ldo_force_on_setf(uint8_t ldo_force_on)
{
    hwp_adcc_s->adc_cfg_address.bit_field.ldo_force_on = ldo_force_on;
}

__STATIC_INLINE uint8_t adcc_s_adcpre_getf(void)
{
    return hwp_adcc_s->adc_cfg_address.bit_field.adcpre;
}

__STATIC_INLINE void adcc_s_adcpre_setf(uint8_t adcpre)
{
    hwp_adcc_s->adc_cfg_address.bit_field.adcpre = adcpre;
}

__STATIC_INLINE uint8_t adcc_s_sel_mcu_getf(void)
{
    return hwp_adcc_s->adc_cfg_address.bit_field.sel_mcu;
}

__STATIC_INLINE void adcc_s_sel_mcu_setf(uint8_t sel_mcu)
{
    hwp_adcc_s->adc_cfg_address.bit_field.sel_mcu = sel_mcu;
}

__STATIC_INLINE uint8_t adcc_s_adcen_getf(void)
{
    return hwp_adcc_s->adc_cfg_address.bit_field.adcen;
}

__STATIC_INLINE void adcc_s_adcen_setf(uint8_t adcen)
{
    hwp_adcc_s->adc_cfg_address.bit_field.adcen = adcen;
}
#endif

__STATIC_INLINE uint32_t adcc_s_adc_ldo_address_get(void)
{
    return hwp_adcc_s->adc_ldo_address.val;
}

__STATIC_INLINE void adcc_s_adc_ldo_address_set(uint32_t value)
{
    hwp_adcc_s->adc_ldo_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_ldo_address_pack(uint16_t ch_dly, uint16_t ldo_dly)
{
    hwp_adcc_s->adc_ldo_address.val = (((uint32_t)ch_dly << 16) | ((uint32_t)ldo_dly << 0));
}

__STATIC_INLINE void adcc_s_adc_ldo_address_unpack(uint16_t* ch_dly, uint16_t* ldo_dly)
{
    T_ADCC_S_ADC_LDO_ADDRESS localVal = hwp_adcc_s->adc_ldo_address;

    *ch_dly = localVal.bit_field.ch_dly;
    *ldo_dly = localVal.bit_field.ldo_dly;
}

__STATIC_INLINE uint16_t adcc_s_ch_dly_getf(void)
{
    return hwp_adcc_s->adc_ldo_address.bit_field.ch_dly;
}

__STATIC_INLINE void adcc_s_ch_dly_setf(uint16_t ch_dly)
{
    hwp_adcc_s->adc_ldo_address.bit_field.ch_dly = ch_dly;
}

__STATIC_INLINE uint16_t adcc_s_ldo_dly_getf(void)
{
    return hwp_adcc_s->adc_ldo_address.bit_field.ldo_dly;
}

__STATIC_INLINE void adcc_s_ldo_dly_setf(uint16_t ldo_dly)
{
    hwp_adcc_s->adc_ldo_address.bit_field.ldo_dly = ldo_dly;
}

__STATIC_INLINE uint32_t adcc_s_adc_cr0_address_get(void)
{
    return hwp_adcc_s->adc_cr0_address.val;
}

__STATIC_INLINE void adcc_s_adc_cr0_address_set(uint32_t value)
{
    hwp_adcc_s->adc_cr0_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_cr0_address_pack(uint8_t adsm, uint8_t trgsel, uint8_t trgen)
{
    hwp_adcc_s->adc_cr0_address.val = (((uint32_t)adsm << 11) | ((uint32_t)trgsel << 4) | ((uint32_t)trgen << 2));
}

__STATIC_INLINE void adcc_s_adc_cr0_address_unpack(uint8_t* adsm, uint8_t* trgsel, uint8_t* trgen)
{
    T_ADCC_S_ADC_CR0_ADDRESS localVal = hwp_adcc_s->adc_cr0_address;

    *adsm = localVal.bit_field.adsm;
    *trgsel = localVal.bit_field.trgsel;
    *trgen = localVal.bit_field.trgen;
}

__STATIC_INLINE uint8_t adcc_s_adsm_getf(void)
{
    return hwp_adcc_s->adc_cr0_address.bit_field.adsm;
}

__STATIC_INLINE void adcc_s_adsm_setf(uint8_t adsm)
{
    hwp_adcc_s->adc_cr0_address.bit_field.adsm = adsm;
}

__STATIC_INLINE uint8_t adcc_s_trgsel_getf(void)
{
    return hwp_adcc_s->adc_cr0_address.bit_field.trgsel;
}

__STATIC_INLINE void adcc_s_trgsel_setf(uint8_t trgsel)
{
    hwp_adcc_s->adc_cr0_address.bit_field.trgsel = trgsel;
}

__STATIC_INLINE uint8_t adcc_s_trgen_getf(void)
{
    return hwp_adcc_s->adc_cr0_address.bit_field.trgen;
}

__STATIC_INLINE void adcc_s_trgen_setf(uint8_t trgen)
{
    hwp_adcc_s->adc_cr0_address.bit_field.trgen = trgen;
}

__STATIC_INLINE uint32_t adcc_s_adc_cr1_address_get(void)
{
    return hwp_adcc_s->adc_cr1_address.val;
}

__STATIC_INLINE void adcc_s_adc_cr1_address_set(uint32_t value)
{
    hwp_adcc_s->adc_cr1_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_cr1_address_pack(uint8_t align, uint8_t adcnt, uint8_t adc_start, uint8_t dmaen)
{
    hwp_adcc_s->adc_cr1_address.val = (((uint32_t)align << 10) | ((uint32_t)adcnt << 9) | ((uint32_t)adc_start << 8) | ((uint32_t)dmaen << 0));
}

__STATIC_INLINE void adcc_s_adc_cr1_address_unpack(uint8_t* align, uint8_t* adcnt, uint8_t* adc_start, uint8_t* dmaen)
{
    T_ADCC_S_ADC_CR1_ADDRESS localVal = hwp_adcc_s->adc_cr1_address;

    *align = localVal.bit_field.align;
    *adcnt = localVal.bit_field.adcnt;
    *adc_start = localVal.bit_field.adc_start;
    *dmaen = localVal.bit_field.dmaen;
}

__STATIC_INLINE uint8_t adcc_s_align_getf(void)
{
    return hwp_adcc_s->adc_cr1_address.bit_field.align;
}

__STATIC_INLINE void adcc_s_align_setf(uint8_t align)
{
    hwp_adcc_s->adc_cr1_address.bit_field.align = align;
}

__STATIC_INLINE uint8_t adcc_s_adcnt_getf(void)
{
    return hwp_adcc_s->adc_cr1_address.bit_field.adcnt;
}

__STATIC_INLINE void adcc_s_adcnt_setf(uint8_t adcnt)
{
    hwp_adcc_s->adc_cr1_address.bit_field.adcnt = adcnt;
}

__STATIC_INLINE uint8_t adcc_s_adc_start_getf(void)
{
    return hwp_adcc_s->adc_cr1_address.bit_field.adc_start;
}

__STATIC_INLINE void adcc_s_adc_start_setf(uint8_t adc_start)
{
    hwp_adcc_s->adc_cr1_address.bit_field.adc_start = adc_start;
}

__STATIC_INLINE uint8_t adcc_s_dmaen_getf(void)
{
    return hwp_adcc_s->adc_cr1_address.bit_field.dmaen;
}

__STATIC_INLINE void adcc_s_dmaen_setf(uint8_t dmaen)
{
    hwp_adcc_s->adc_cr1_address.bit_field.dmaen = dmaen;
}

__STATIC_INLINE uint32_t adcc_s_adc_status_address_get(void)
{
    return hwp_adcc_s->adc_status_address.val;
}

__STATIC_INLINE void adcc_s_adc_status_address_set(uint32_t value)
{
    hwp_adcc_s->adc_status_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_status_address_pack(uint8_t eosif, uint8_t eocif)
{
    hwp_adcc_s->adc_status_address.val = (((uint32_t)eosif << 1) | ((uint32_t)eocif << 0));
}

__STATIC_INLINE void adcc_s_adc_status_address_unpack(uint8_t* ch_overrun, uint8_t* ch_valid, uint8_t* channel_run, uint8_t* busy, uint8_t* eosif, uint8_t* eocif)
{
    T_ADCC_S_ADC_STATUS_ADDRESS localVal = hwp_adcc_s->adc_status_address;

    *ch_overrun = localVal.bit_field.ch_overrun;
    *ch_valid = localVal.bit_field.ch_valid;
    *channel_run = localVal.bit_field.channel_run;
    *busy = localVal.bit_field.busy;
    *eosif = localVal.bit_field.eosif;
    *eocif = localVal.bit_field.eocif;
}

__STATIC_INLINE uint8_t adcc_s_ch_overrun_getf(void)
{
    return hwp_adcc_s->adc_status_address.bit_field.ch_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch_valid_getf(void)
{
    return hwp_adcc_s->adc_status_address.bit_field.ch_valid;
}

__STATIC_INLINE uint8_t adcc_s_channel_run_getf(void)
{
    return hwp_adcc_s->adc_status_address.bit_field.channel_run;
}

__STATIC_INLINE uint8_t adcc_s_busy_getf(void)
{
    return hwp_adcc_s->adc_status_address.bit_field.busy;
}

__STATIC_INLINE uint8_t adcc_s_eosif_getf(void)
{
    return hwp_adcc_s->adc_status_address.bit_field.eosif;
}

__STATIC_INLINE void adcc_s_eosif_setf(uint8_t eosif)
{
    hwp_adcc_s->adc_status_address.bit_field.eosif = eosif;
}

__STATIC_INLINE uint8_t adcc_s_eocif_getf(void)
{
    return hwp_adcc_s->adc_status_address.bit_field.eocif;
}

__STATIC_INLINE void adcc_s_eocif_setf(uint8_t eocif)
{
    hwp_adcc_s->adc_status_address.bit_field.eocif = eocif;
}

__STATIC_INLINE uint32_t adcc_s_adc_ie_address_get(void)
{
    return hwp_adcc_s->adc_ie_address.val;
}

__STATIC_INLINE void adcc_s_adc_ie_address_set(uint32_t value)
{
    hwp_adcc_s->adc_ie_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_ie_address_pack(uint8_t overrun_ie, uint8_t eoc_ie, uint8_t eos_ie)
{
    hwp_adcc_s->adc_ie_address.val = (((uint32_t)overrun_ie << 3) | ((uint32_t)eoc_ie << 1) | ((uint32_t)eos_ie << 0));
}

__STATIC_INLINE void adcc_s_adc_ie_address_unpack(uint8_t* overrun_ie, uint8_t* eoc_ie, uint8_t* eos_ie)
{
    T_ADCC_S_ADC_IE_ADDRESS localVal = hwp_adcc_s->adc_ie_address;

    *overrun_ie = localVal.bit_field.overrun_ie;
    *eoc_ie = localVal.bit_field.eoc_ie;
    *eos_ie = localVal.bit_field.eos_ie;
}

__STATIC_INLINE uint8_t adcc_s_overrun_ie_getf(void)
{
    return hwp_adcc_s->adc_ie_address.bit_field.overrun_ie;
}

__STATIC_INLINE void adcc_s_overrun_ie_setf(uint8_t overrun_ie)
{
    hwp_adcc_s->adc_ie_address.bit_field.overrun_ie = overrun_ie;
}

__STATIC_INLINE uint8_t adcc_s_eoc_ie_getf(void)
{
    return hwp_adcc_s->adc_ie_address.bit_field.eoc_ie;
}

__STATIC_INLINE void adcc_s_eoc_ie_setf(uint8_t eoc_ie)
{
    hwp_adcc_s->adc_ie_address.bit_field.eoc_ie = eoc_ie;
}

__STATIC_INLINE uint8_t adcc_s_eos_ie_getf(void)
{
    return hwp_adcc_s->adc_ie_address.bit_field.eos_ie;
}

__STATIC_INLINE void adcc_s_eos_ie_setf(uint8_t eos_ie)
{
    hwp_adcc_s->adc_ie_address.bit_field.eos_ie = eos_ie;
}

__STATIC_INLINE uint32_t adcc_s_adc_sqr_address_get(void)
{
    return hwp_adcc_s->adc_sqr_address.val;
}

__STATIC_INLINE void adcc_s_adc_sqr_address_set(uint32_t value)
{
    hwp_adcc_s->adc_sqr_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_sqr_address_pack(uint8_t losq, uint8_t sq7, uint8_t sq6, uint8_t sq5, uint8_t sq4, uint8_t sq3, uint8_t sq2, uint8_t sq1, uint8_t sq0)
{
    hwp_adcc_s->adc_sqr_address.val = (((uint32_t)losq << 24) | ((uint32_t)sq7 << 21) | ((uint32_t)sq6 << 18) | ((uint32_t)sq5 << 15) | ((uint32_t)sq4 << 12) | ((uint32_t)sq3 << 9) | ((uint32_t)sq2 << 6) | ((uint32_t)sq1 << 3) | ((uint32_t)sq0 << 0));
}

__STATIC_INLINE void adcc_s_adc_sqr_address_unpack(uint8_t* losq, uint8_t* sq7, uint8_t* sq6, uint8_t* sq5, uint8_t* sq4, uint8_t* sq3, uint8_t* sq2, uint8_t* sq1, uint8_t* sq0)
{
    T_ADCC_S_ADC_SQR_ADDRESS localVal = hwp_adcc_s->adc_sqr_address;

    *losq = localVal.bit_field.losq;
    *sq7 = localVal.bit_field.sq7;
    *sq6 = localVal.bit_field.sq6;
    *sq5 = localVal.bit_field.sq5;
    *sq4 = localVal.bit_field.sq4;
    *sq3 = localVal.bit_field.sq3;
    *sq2 = localVal.bit_field.sq2;
    *sq1 = localVal.bit_field.sq1;
    *sq0 = localVal.bit_field.sq0;
}

__STATIC_INLINE uint8_t adcc_s_losq_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.losq;
}

__STATIC_INLINE void adcc_s_losq_setf(uint8_t losq)
{
    hwp_adcc_s->adc_sqr_address.bit_field.losq = losq;
}

__STATIC_INLINE uint8_t adcc_s_sq7_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq7;
}

__STATIC_INLINE void adcc_s_sq7_setf(uint8_t sq7)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq7 = sq7;
}

__STATIC_INLINE uint8_t adcc_s_sq6_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq6;
}

__STATIC_INLINE void adcc_s_sq6_setf(uint8_t sq6)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq6 = sq6;
}

__STATIC_INLINE uint8_t adcc_s_sq5_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq5;
}

__STATIC_INLINE void adcc_s_sq5_setf(uint8_t sq5)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq5 = sq5;
}

__STATIC_INLINE uint8_t adcc_s_sq4_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq4;
}

__STATIC_INLINE void adcc_s_sq4_setf(uint8_t sq4)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq4 = sq4;
}

__STATIC_INLINE uint8_t adcc_s_sq3_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq3;
}

__STATIC_INLINE void adcc_s_sq3_setf(uint8_t sq3)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq3 = sq3;
}

__STATIC_INLINE uint8_t adcc_s_sq2_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq2;
}

__STATIC_INLINE void adcc_s_sq2_setf(uint8_t sq2)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq2 = sq2;
}

__STATIC_INLINE uint8_t adcc_s_sq1_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq1;
}

__STATIC_INLINE void adcc_s_sq1_setf(uint8_t sq1)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq1 = sq1;
}

__STATIC_INLINE uint8_t adcc_s_sq0_getf(void)
{
    return hwp_adcc_s->adc_sqr_address.bit_field.sq0;
}

__STATIC_INLINE void adcc_s_sq0_setf(uint8_t sq0)
{
    hwp_adcc_s->adc_sqr_address.bit_field.sq0 = sq0;
}

__STATIC_INLINE uint32_t adcc_s_adc_swtr_address_get(void)
{
    return hwp_adcc_s->adc_swtr_address.val;
}

__STATIC_INLINE void adcc_s_adc_swtr_address_set(uint32_t value)
{
    hwp_adcc_s->adc_swtr_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_swtr_address_pack(uint8_t sw_trg)
{
    hwp_adcc_s->adc_swtr_address.val = (((uint32_t)sw_trg << 0));
}

__STATIC_INLINE void adcc_s_adc_swtr_address_unpack(uint8_t* sw_trg)
{
    T_ADCC_S_ADC_SWTR_ADDRESS localVal = hwp_adcc_s->adc_swtr_address;

    *sw_trg = localVal.bit_field.sw_trg;
}

__STATIC_INLINE uint8_t adcc_s_sw_trg_getf(void)
{
    return hwp_adcc_s->adc_swtr_address.bit_field.sw_trg;
}

__STATIC_INLINE void adcc_s_sw_trg_setf(uint8_t sw_trg)
{
    hwp_adcc_s->adc_swtr_address.bit_field.sw_trg = sw_trg;
}

__STATIC_INLINE uint32_t adcc_s_adc_tim_cr_address_get(void)
{
    return hwp_adcc_s->adc_tim_cr_address.val;
}

__STATIC_INLINE void adcc_s_adc_tim_cr_address_set(uint32_t value)
{
    hwp_adcc_s->adc_tim_cr_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_tim_cr_address_pack(uint8_t opm, uint8_t cen)
{
    hwp_adcc_s->adc_tim_cr_address.val = (((uint32_t)opm << 1) | ((uint32_t)cen << 0));
}

__STATIC_INLINE void adcc_s_adc_tim_cr_address_unpack(uint8_t* opm, uint8_t* cen)
{
    T_ADCC_S_ADC_TIM_CR_ADDRESS localVal = hwp_adcc_s->adc_tim_cr_address;

    *opm = localVal.bit_field.opm;
    *cen = localVal.bit_field.cen;
}

__STATIC_INLINE uint8_t adcc_s_opm_getf(void)
{
    return hwp_adcc_s->adc_tim_cr_address.bit_field.opm;
}

__STATIC_INLINE void adcc_s_opm_setf(uint8_t opm)
{
    hwp_adcc_s->adc_tim_cr_address.bit_field.opm = opm;
}

__STATIC_INLINE uint8_t adcc_s_cen_getf(void)
{
    return hwp_adcc_s->adc_tim_cr_address.bit_field.cen;
}

__STATIC_INLINE void adcc_s_cen_setf(uint8_t cen)
{
    hwp_adcc_s->adc_tim_cr_address.bit_field.cen = cen;
}

__STATIC_INLINE uint32_t adcc_s_adc_tim_cnt_get(void)
{
    return hwp_adcc_s->adc_tim_cnt.val;
}

__STATIC_INLINE void adcc_s_adc_tim_cnt_unpack(uint32_t* cnt)
{
    T_ADCC_S_ADC_TIM_CNT localVal = hwp_adcc_s->adc_tim_cnt;

    *cnt = localVal.bit_field.cnt;
}

__STATIC_INLINE uint32_t adcc_s_cnt_getf(void)
{
    return hwp_adcc_s->adc_tim_cnt.bit_field.cnt;
}

__STATIC_INLINE uint32_t adcc_s_adc_tim_arr_address_get(void)
{
    return hwp_adcc_s->adc_tim_arr_address.val;
}

__STATIC_INLINE void adcc_s_adc_tim_arr_address_set(uint32_t value)
{
    hwp_adcc_s->adc_tim_arr_address.val = value;
}

__STATIC_INLINE void adcc_s_adc_tim_arr_address_pack(uint32_t arr)
{
    hwp_adcc_s->adc_tim_arr_address.val = (((uint32_t)arr << 0));
}

__STATIC_INLINE void adcc_s_adc_tim_arr_address_unpack(uint32_t* arr)
{
    T_ADCC_S_ADC_TIM_ARR_ADDRESS localVal = hwp_adcc_s->adc_tim_arr_address;

    *arr = localVal.bit_field.arr;
}

__STATIC_INLINE uint32_t adcc_s_arr_getf(void)
{
    return hwp_adcc_s->adc_tim_arr_address.bit_field.arr;
}

__STATIC_INLINE void adcc_s_arr_setf(uint32_t arr)
{
    hwp_adcc_s->adc_tim_arr_address.bit_field.arr = arr;
}

__STATIC_INLINE uint32_t adcc_s_adc_data_address_get(void)
{
    return hwp_adcc_s->adc_data_address.val;
}

__STATIC_INLINE void adcc_s_adc_data_address_unpack(uint8_t* valid, uint8_t* overrun, uint8_t* channel_sel, uint16_t* adc_data)
{
    T_ADCC_S_ADC_DATA_ADDRESS localVal = hwp_adcc_s->adc_data_address;

    *valid = localVal.bit_field.valid;
    *overrun = localVal.bit_field.overrun;
    *channel_sel = localVal.bit_field.channel_sel;
    *adc_data = localVal.bit_field.adc_data;
}

__STATIC_INLINE uint8_t adcc_s_valid_getf(void)
{
    return hwp_adcc_s->adc_data_address.bit_field.valid;
}

__STATIC_INLINE uint8_t adcc_s_overrun_getf(void)
{
    return hwp_adcc_s->adc_data_address.bit_field.overrun;
}

__STATIC_INLINE uint8_t adcc_s_channel_sel_getf(void)
{
    return hwp_adcc_s->adc_data_address.bit_field.channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_adc_data_getf(void)
{
    return hwp_adcc_s->adc_data_address.bit_field.adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch0_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch0_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch0_adc_dr0_address_unpack(uint8_t* ch0_valid, uint8_t* ch0_overrun, uint8_t* ch0_channel_sel, uint16_t* ch0_adc_data)
{
    T_ADCC_S_CH0_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch0_adc_dr0_address;

    *ch0_valid = localVal.bit_field.ch0_valid;
    *ch0_overrun = localVal.bit_field.ch0_overrun;
    *ch0_channel_sel = localVal.bit_field.ch0_channel_sel;
    *ch0_adc_data = localVal.bit_field.ch0_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch0_valid_getf(void)
{
    return hwp_adcc_s->ch0_adc_dr0_address.bit_field.ch0_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch0_overrun_getf(void)
{
    return hwp_adcc_s->ch0_adc_dr0_address.bit_field.ch0_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch0_channel_sel_getf(void)
{
    return hwp_adcc_s->ch0_adc_dr0_address.bit_field.ch0_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch0_adc_data_getf(void)
{
    return hwp_adcc_s->ch0_adc_dr0_address.bit_field.ch0_adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch1_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch1_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch1_adc_dr0_address_unpack(uint8_t* ch1_valid, uint8_t* ch1_overrun, uint8_t* ch1_channel_sel, uint16_t* ch1_adc_data)
{
    T_ADCC_S_CH1_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch1_adc_dr0_address;

    *ch1_valid = localVal.bit_field.ch1_valid;
    *ch1_overrun = localVal.bit_field.ch1_overrun;
    *ch1_channel_sel = localVal.bit_field.ch1_channel_sel;
    *ch1_adc_data = localVal.bit_field.ch1_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch1_valid_getf(void)
{
    return hwp_adcc_s->ch1_adc_dr0_address.bit_field.ch1_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch1_overrun_getf(void)
{
    return hwp_adcc_s->ch1_adc_dr0_address.bit_field.ch1_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch1_channel_sel_getf(void)
{
    return hwp_adcc_s->ch1_adc_dr0_address.bit_field.ch1_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch1_adc_data_getf(void)
{
    return hwp_adcc_s->ch1_adc_dr0_address.bit_field.ch1_adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch2_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch2_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch2_adc_dr0_address_unpack(uint8_t* ch2_valid, uint8_t* ch2_overrun, uint8_t* ch2_channel_sel, uint16_t* ch2_adc_data)
{
    T_ADCC_S_CH2_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch2_adc_dr0_address;

    *ch2_valid = localVal.bit_field.ch2_valid;
    *ch2_overrun = localVal.bit_field.ch2_overrun;
    *ch2_channel_sel = localVal.bit_field.ch2_channel_sel;
    *ch2_adc_data = localVal.bit_field.ch2_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch2_valid_getf(void)
{
    return hwp_adcc_s->ch2_adc_dr0_address.bit_field.ch2_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch2_overrun_getf(void)
{
    return hwp_adcc_s->ch2_adc_dr0_address.bit_field.ch2_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch2_channel_sel_getf(void)
{
    return hwp_adcc_s->ch2_adc_dr0_address.bit_field.ch2_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch2_adc_data_getf(void)
{
    return hwp_adcc_s->ch2_adc_dr0_address.bit_field.ch2_adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch3_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch3_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch3_adc_dr0_address_unpack(uint8_t* ch3_valid, uint8_t* ch3_overrun, uint8_t* ch3_channel_sel, uint16_t* ch3_adc_data)
{
    T_ADCC_S_CH3_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch3_adc_dr0_address;

    *ch3_valid = localVal.bit_field.ch3_valid;
    *ch3_overrun = localVal.bit_field.ch3_overrun;
    *ch3_channel_sel = localVal.bit_field.ch3_channel_sel;
    *ch3_adc_data = localVal.bit_field.ch3_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch3_valid_getf(void)
{
    return hwp_adcc_s->ch3_adc_dr0_address.bit_field.ch3_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch3_overrun_getf(void)
{
    return hwp_adcc_s->ch3_adc_dr0_address.bit_field.ch3_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch3_channel_sel_getf(void)
{
    return hwp_adcc_s->ch3_adc_dr0_address.bit_field.ch3_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch3_adc_data_getf(void)
{
    return hwp_adcc_s->ch3_adc_dr0_address.bit_field.ch3_adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch4_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch4_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch4_adc_dr0_address_unpack(uint8_t* ch4_valid, uint8_t* ch4_overrun, uint8_t* ch4_channel_sel, uint16_t* ch4_adc_data)
{
    T_ADCC_S_CH4_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch4_adc_dr0_address;

    *ch4_valid = localVal.bit_field.ch4_valid;
    *ch4_overrun = localVal.bit_field.ch4_overrun;
    *ch4_channel_sel = localVal.bit_field.ch4_channel_sel;
    *ch4_adc_data = localVal.bit_field.ch4_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch4_valid_getf(void)
{
    return hwp_adcc_s->ch4_adc_dr0_address.bit_field.ch4_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch4_overrun_getf(void)
{
    return hwp_adcc_s->ch4_adc_dr0_address.bit_field.ch4_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch4_channel_sel_getf(void)
{
    return hwp_adcc_s->ch4_adc_dr0_address.bit_field.ch4_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch4_adc_data_getf(void)
{
    return hwp_adcc_s->ch4_adc_dr0_address.bit_field.ch4_adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch5_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch5_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch5_adc_dr0_address_unpack(uint8_t* ch5_valid, uint8_t* ch5_overrun, uint8_t* ch5_channel_sel, uint16_t* ch5_adc_data)
{
    T_ADCC_S_CH5_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch5_adc_dr0_address;

    *ch5_valid = localVal.bit_field.ch5_valid;
    *ch5_overrun = localVal.bit_field.ch5_overrun;
    *ch5_channel_sel = localVal.bit_field.ch5_channel_sel;
    *ch5_adc_data = localVal.bit_field.ch5_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch5_valid_getf(void)
{
    return hwp_adcc_s->ch5_adc_dr0_address.bit_field.ch5_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch5_overrun_getf(void)
{
    return hwp_adcc_s->ch5_adc_dr0_address.bit_field.ch5_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch5_channel_sel_getf(void)
{
    return hwp_adcc_s->ch5_adc_dr0_address.bit_field.ch5_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch5_adc_data_getf(void)
{
    return hwp_adcc_s->ch5_adc_dr0_address.bit_field.ch5_adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch6_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch6_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch6_adc_dr0_address_unpack(uint8_t* ch6_valid, uint8_t* ch6_overrun, uint8_t* ch6_channel_sel, uint16_t* ch6_adc_data)
{
    T_ADCC_S_CH6_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch6_adc_dr0_address;

    *ch6_valid = localVal.bit_field.ch6_valid;
    *ch6_overrun = localVal.bit_field.ch6_overrun;
    *ch6_channel_sel = localVal.bit_field.ch6_channel_sel;
    *ch6_adc_data = localVal.bit_field.ch6_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch6_valid_getf(void)
{
    return hwp_adcc_s->ch6_adc_dr0_address.bit_field.ch6_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch6_overrun_getf(void)
{
    return hwp_adcc_s->ch6_adc_dr0_address.bit_field.ch6_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch6_channel_sel_getf(void)
{
    return hwp_adcc_s->ch6_adc_dr0_address.bit_field.ch6_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch6_adc_data_getf(void)
{
    return hwp_adcc_s->ch6_adc_dr0_address.bit_field.ch6_adc_data;
}

__STATIC_INLINE uint32_t adcc_s_ch7_adc_dr0_address_get(void)
{
    return hwp_adcc_s->ch7_adc_dr0_address.val;
}

__STATIC_INLINE void adcc_s_ch7_adc_dr0_address_unpack(uint8_t* ch7_valid, uint8_t* ch7_overrun, uint8_t* ch7_channel_sel, uint16_t* ch7_adc_data)
{
    T_ADCC_S_CH7_ADC_DR0_ADDRESS localVal = hwp_adcc_s->ch7_adc_dr0_address;

    *ch7_valid = localVal.bit_field.ch7_valid;
    *ch7_overrun = localVal.bit_field.ch7_overrun;
    *ch7_channel_sel = localVal.bit_field.ch7_channel_sel;
    *ch7_adc_data = localVal.bit_field.ch7_adc_data;
}

__STATIC_INLINE uint8_t adcc_s_ch7_valid_getf(void)
{
    return hwp_adcc_s->ch7_adc_dr0_address.bit_field.ch7_valid;
}

__STATIC_INLINE uint8_t adcc_s_ch7_overrun_getf(void)
{
    return hwp_adcc_s->ch7_adc_dr0_address.bit_field.ch7_overrun;
}

__STATIC_INLINE uint8_t adcc_s_ch7_channel_sel_getf(void)
{
    return hwp_adcc_s->ch7_adc_dr0_address.bit_field.ch7_channel_sel;
}

__STATIC_INLINE uint16_t adcc_s_ch7_adc_data_getf(void)
{
    return hwp_adcc_s->ch7_adc_dr0_address.bit_field.ch7_adc_data;
}
#endif


