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
#ifndef __REG_I2S_H__
#define __REG_I2S_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//ier
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            ier :  1; /* 0: 0,     DW_apb_i2s Enable Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_IER;

//irer
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           irer :  1; /* 0: 0, I2S Receiver Block Enable Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_IRER;

//iter
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           iter :  1; /* 0: 0, I2S Transmitter Block Enable Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_ITER;

//cer
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            cer :  1; /* 0: 0,          Clock Enable Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_CER;

//ccr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            ccr :  5; /* 4: 0,          Clock Enable Register*/
        uint32_t                     reserved_0 : 27; /*31: 5,                             NA*/
    } bit_field;
} T_I2S_CCR;

//rxffr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rxffr :  1; /* 0: 0,   Receiver Block FIFO Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_RXFFR;

//txffr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txffr :  1; /* 0: 0, Transmitter Block FIFO Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_TXFFR;

//lrbr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          lrbr0 : 32; /*31: 0,          Left Receive Buffer 0*/
    } bit_field;
} T_I2S_LRBR0;

//rrbr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rrbr0 : 32; /*31: 0,         Right Receive Buffer 0*/
    } bit_field;
} T_I2S_RRBR0;

//rer0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           rer0 :  1; /* 0: 0,      Receive Enable Register 0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_RER0;

//ter0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           ter0 :  1; /* 0: 0,     Transmit Enable Register 0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_TER0;

//rcr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           rcr0 :  3; /* 2: 0, Receive Configuration Register 0*/
        uint32_t                     reserved_0 : 29; /*31: 3,                             NA*/
    } bit_field;
} T_I2S_RCR0;

//tcr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           tcr0 :  3; /* 2: 0, Transmit Configuration Register 0*/
        uint32_t                     reserved_0 : 29; /*31: 3,                             NA*/
    } bit_field;
} T_I2S_TCR0;

//isr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           isr0 :  6; /* 5: 0,    Interrupt Status Register 0*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_I2S_ISR0;

//imr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           imr0 :  6; /* 5: 0,      Interrupt Mask Register 0*/
        uint32_t                     reserved_0 : 26; /*31: 6,                             NA*/
    } bit_field;
} T_I2S_IMR0;

//ror0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           ror0 :  1; /* 0: 0,     Receive Overrun Register 0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_ROR0;

//tor0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           tor0 :  1; /* 0: 0,    Transmit Overrun Register 0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_TOR0;

//rfcr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rfcr0 :  4; /* 3: 0, Receive FIFO Configuration Register 0*/
        uint32_t                     reserved_0 : 28; /*31: 4,                             NA*/
    } bit_field;
} T_I2S_RFCR0;

//tfcr0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          tfcr0 :  4; /* 3: 0, Transmit FIFO Configuration Register 0*/
        uint32_t                     reserved_0 : 28; /*31: 4,                             NA*/
    } bit_field;
} T_I2S_TFCR0;

//rff0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           rff0 :  1; /* 0: 0,           Receive FIFO Flush 0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_RFF0;

//tff0
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                           tff0 :  1; /* 0: 0,          Transmit FIFO Flush 0*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_TFF0;

//rxdma
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          rxdma : 32; /*31: 0,    Receiver Block DMA Register*/
    } bit_field;
} T_I2S_RXDMA;

//rrxdma
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         rrxdma :  1; /* 0: 0, Reset Receiver Block DMA Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_RRXDMA;

//txdma
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          txdma : 32; /*31: 0, Transmitter Block DMA Register*/
    } bit_field;
} T_I2S_TXDMA;

//rtxdma
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         rtxdma :  1; /* 0: 0, Reset Transmitter Block DMA Register*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_I2S_RTXDMA;

//i2s_comp_param_2
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               i2s_comp_param_2 : 32; /*31: 0, Component Parameter 2 Register*/
    } bit_field;
} T_I2S_I2S_COMP_PARAM_2;

//i2s_comp_param_1
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               i2s_comp_param_1 : 32; /*31: 0, Component Parameter 1 Register*/
    } bit_field;
} T_I2S_I2S_COMP_PARAM_1;

//i2s_comp_version
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               i2s_comp_version : 32; /*31: 0,           Component Version ID*/
    } bit_field;
} T_I2S_I2S_COMP_VERSION;

//i2s_comp_type
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  i2s_comp_type : 32; /*31: 0,      DesignWare Component Type*/
    } bit_field;
} T_I2S_I2S_COMP_TYPE;

//Registers Mapping to the same address

typedef struct
{
    volatile                       T_I2S_IER                            ier; /*  0x0,    RW, 0x00000000,                             NA*/
    volatile                      T_I2S_IRER                           irer; /*  0x4,    RW, 0x00000000,                             NA*/
    volatile                      T_I2S_ITER                           iter; /*  0x8,    RW, 0x00000000,                             NA*/
    volatile                       T_I2S_CER                            cer; /*  0xc,    RW, 0x00000000,                             NA*/
    volatile                       T_I2S_CCR                            ccr; /* 0x10,    RW, 0x00000010,                             NA*/
    volatile                     T_I2S_RXFFR                          rxffr; /* 0x14,    RW, 0x00000000,                             NA*/
    volatile                     T_I2S_TXFFR                          txffr; /* 0x18,    RW, 0x00000000,                             NA*/
    volatile                        uint32_t                     reserved_0;
    volatile                     T_I2S_LRBR0                          lrbr0; /* 0x20,    RW, 0x00000000,                             NA*/
    volatile                     T_I2S_RRBR0                          rrbr0; /* 0x24,    RW, 0x00000000,                             NA*/
    volatile                      T_I2S_RER0                           rer0; /* 0x28,    RW, 0x00000001,                             NA*/
    volatile                      T_I2S_TER0                           ter0; /* 0x2c,    RW, 0x00000001,                             NA*/
    volatile                      T_I2S_RCR0                           rcr0; /* 0x30,    RW, 0x00000005,                             NA*/
    volatile                      T_I2S_TCR0                           tcr0; /* 0x34,    RW, 0x00000005,                             NA*/
    volatile                      T_I2S_ISR0                           isr0; /* 0x38,    RO, 0x00000010,                             NA*/
    volatile                      T_I2S_IMR0                           imr0; /* 0x3c,    RW, 0x00000033,                             NA*/
    volatile                      T_I2S_ROR0                           ror0; /* 0x40,    RO, 0x00000000,                             NA*/
    volatile                      T_I2S_TOR0                           tor0; /* 0x44,    RO, 0x00000000,                             NA*/
    volatile                     T_I2S_RFCR0                          rfcr0; /* 0x48,    RW, 0x00000003,                             NA*/
    volatile                     T_I2S_TFCR0                          tfcr0; /* 0x4c,    RW, 0x00000003,                             NA*/
    volatile                      T_I2S_RFF0                           rff0; /* 0x50,    RW, 0x00000000,                             NA*/
    volatile                      T_I2S_TFF0                           tff0; /* 0x54,    RW, 0x00000000,                             NA*/
    volatile                        uint32_t                 reserved_1[90];
    volatile                     T_I2S_RXDMA                          rxdma; /*0x1c0,    RO, 0x00000000,                             NA*/
    volatile                    T_I2S_RRXDMA                         rrxdma; /*0x1c4,    RW, 0x00000000,                             NA*/
    volatile                     T_I2S_TXDMA                          txdma; /*0x1c8,    WO, 0x00000000,                             NA*/
    volatile                    T_I2S_RTXDMA                         rtxdma; /*0x1cc,    RW, 0x00000000,                             NA*/
    volatile                        uint32_t                  reserved_2[8];
    volatile          T_I2S_I2S_COMP_PARAM_2               i2s_comp_param_2; /*0x1f0,    RO, 0x0000048C,                             NA*/
    volatile          T_I2S_I2S_COMP_PARAM_1               i2s_comp_param_1; /*0x1f4,    RO, 0x024C007E,                             NA*/
    volatile          T_I2S_I2S_COMP_VERSION               i2s_comp_version; /*0x1f8,    RO, 0x3130392A,                             NA*/
    volatile             T_I2S_I2S_COMP_TYPE                  i2s_comp_type; /*0x1fc,    RO, 0x445701A0,                             NA*/
} T_HWP_I2S_T;

#define hwp_i2s ((T_HWP_I2S_T*)REG_I2S_BASE)


__STATIC_INLINE uint32_t i2s_ier_get(void)
{
    return hwp_i2s->ier.val;
}

__STATIC_INLINE void i2s_ier_set(uint32_t value)
{
    hwp_i2s->ier.val = value;
}

__STATIC_INLINE void i2s_ier_pack(uint8_t ier)
{
    hwp_i2s->ier.val = (((uint32_t)ier << 0));
}

__STATIC_INLINE void i2s_ier_unpack(uint8_t* ier)
{
    T_I2S_IER localVal = hwp_i2s->ier;

    *ier = localVal.bit_field.ier;
}

__STATIC_INLINE uint8_t i2s_ier_getf(void)
{
    return hwp_i2s->ier.bit_field.ier;
}

__STATIC_INLINE void i2s_ier_setf(uint8_t ier)
{
    hwp_i2s->ier.bit_field.ier = ier;
}

__STATIC_INLINE uint32_t i2s_irer_get(void)
{
    return hwp_i2s->irer.val;
}

__STATIC_INLINE void i2s_irer_set(uint32_t value)
{
    hwp_i2s->irer.val = value;
}

__STATIC_INLINE void i2s_irer_pack(uint8_t irer)
{
    hwp_i2s->irer.val = (((uint32_t)irer << 0));
}

__STATIC_INLINE void i2s_irer_unpack(uint8_t* irer)
{
    T_I2S_IRER localVal = hwp_i2s->irer;

    *irer = localVal.bit_field.irer;
}

__STATIC_INLINE uint8_t i2s_irer_getf(void)
{
    return hwp_i2s->irer.bit_field.irer;
}

__STATIC_INLINE void i2s_irer_setf(uint8_t irer)
{
    hwp_i2s->irer.bit_field.irer = irer;
}

__STATIC_INLINE uint32_t i2s_iter_get(void)
{
    return hwp_i2s->iter.val;
}

__STATIC_INLINE void i2s_iter_set(uint32_t value)
{
    hwp_i2s->iter.val = value;
}

__STATIC_INLINE void i2s_iter_pack(uint8_t iter)
{
    hwp_i2s->iter.val = (((uint32_t)iter << 0));
}

__STATIC_INLINE void i2s_iter_unpack(uint8_t* iter)
{
    T_I2S_ITER localVal = hwp_i2s->iter;

    *iter = localVal.bit_field.iter;
}

__STATIC_INLINE uint8_t i2s_iter_getf(void)
{
    return hwp_i2s->iter.bit_field.iter;
}

__STATIC_INLINE void i2s_iter_setf(uint8_t iter)
{
    hwp_i2s->iter.bit_field.iter = iter;
}

__STATIC_INLINE uint32_t i2s_cer_get(void)
{
    return hwp_i2s->cer.val;
}

__STATIC_INLINE void i2s_cer_set(uint32_t value)
{
    hwp_i2s->cer.val = value;
}

__STATIC_INLINE void i2s_cer_pack(uint8_t cer)
{
    hwp_i2s->cer.val = (((uint32_t)cer << 0));
}

__STATIC_INLINE void i2s_cer_unpack(uint8_t* cer)
{
    T_I2S_CER localVal = hwp_i2s->cer;

    *cer = localVal.bit_field.cer;
}

__STATIC_INLINE uint8_t i2s_cer_getf(void)
{
    return hwp_i2s->cer.bit_field.cer;
}

__STATIC_INLINE void i2s_cer_setf(uint8_t cer)
{
    hwp_i2s->cer.bit_field.cer = cer;
}

__STATIC_INLINE uint32_t i2s_ccr_get(void)
{
    return hwp_i2s->ccr.val;
}

__STATIC_INLINE void i2s_ccr_set(uint32_t value)
{
    hwp_i2s->ccr.val = value;
}

__STATIC_INLINE void i2s_ccr_pack(uint8_t ccr)
{
    hwp_i2s->ccr.val = (((uint32_t)ccr << 0));
}

__STATIC_INLINE void i2s_ccr_unpack(uint8_t* ccr)
{
    T_I2S_CCR localVal = hwp_i2s->ccr;

    *ccr = localVal.bit_field.ccr;
}

__STATIC_INLINE uint8_t i2s_ccr_getf(void)
{
    return hwp_i2s->ccr.bit_field.ccr;
}

__STATIC_INLINE void i2s_ccr_setf(uint8_t ccr)
{
    hwp_i2s->ccr.bit_field.ccr = ccr;
}

__STATIC_INLINE uint32_t i2s_rxffr_get(void)
{
    return hwp_i2s->rxffr.val;
}

__STATIC_INLINE void i2s_rxffr_set(uint32_t value)
{
    hwp_i2s->rxffr.val = value;
}

__STATIC_INLINE void i2s_rxffr_pack(uint8_t rxffr)
{
    hwp_i2s->rxffr.val = (((uint32_t)rxffr << 0));
}

__STATIC_INLINE uint32_t i2s_txffr_get(void)
{
    return hwp_i2s->txffr.val;
}

__STATIC_INLINE void i2s_txffr_set(uint32_t value)
{
    hwp_i2s->txffr.val = value;
}

__STATIC_INLINE void i2s_txffr_pack(uint8_t txffr)
{
    hwp_i2s->txffr.val = (((uint32_t)txffr << 0));
}

__STATIC_INLINE uint32_t i2s_lrbr0_get(void)
{
    return hwp_i2s->lrbr0.val;
}

__STATIC_INLINE void i2s_lrbr0_set(uint32_t value)
{
    hwp_i2s->lrbr0.val = value;
}

__STATIC_INLINE void i2s_lrbr0_pack(uint32_t lrbr0)
{
    hwp_i2s->lrbr0.val = (((uint32_t)lrbr0 << 0));
}

__STATIC_INLINE void i2s_lrbr0_unpack(uint32_t* lrbr0)
{
    T_I2S_LRBR0 localVal = hwp_i2s->lrbr0;

    *lrbr0 = localVal.bit_field.lrbr0;
}

__STATIC_INLINE uint32_t i2s_lrbr0_getf(void)
{
    return hwp_i2s->lrbr0.bit_field.lrbr0;
}

__STATIC_INLINE void i2s_lrbr0_setf(uint32_t lrbr0)
{
    hwp_i2s->lrbr0.bit_field.lrbr0 = lrbr0;
}

__STATIC_INLINE uint32_t i2s_rrbr0_get(void)
{
    return hwp_i2s->rrbr0.val;
}

__STATIC_INLINE void i2s_rrbr0_set(uint32_t value)
{
    hwp_i2s->rrbr0.val = value;
}

__STATIC_INLINE void i2s_rrbr0_pack(uint32_t rrbr0)
{
    hwp_i2s->rrbr0.val = (((uint32_t)rrbr0 << 0));
}

__STATIC_INLINE void i2s_rrbr0_unpack(uint32_t* rrbr0)
{
    T_I2S_RRBR0 localVal = hwp_i2s->rrbr0;

    *rrbr0 = localVal.bit_field.rrbr0;
}

__STATIC_INLINE uint32_t i2s_rrbr0_getf(void)
{
    return hwp_i2s->rrbr0.bit_field.rrbr0;
}

__STATIC_INLINE void i2s_rrbr0_setf(uint32_t rrbr0)
{
    hwp_i2s->rrbr0.bit_field.rrbr0 = rrbr0;
}

__STATIC_INLINE uint32_t i2s_rer0_get(void)
{
    return hwp_i2s->rer0.val;
}

__STATIC_INLINE void i2s_rer0_set(uint32_t value)
{
    hwp_i2s->rer0.val = value;
}

__STATIC_INLINE void i2s_rer0_pack(uint8_t rer0)
{
    hwp_i2s->rer0.val = (((uint32_t)rer0 << 0));
}

__STATIC_INLINE void i2s_rer0_unpack(uint8_t* rer0)
{
    T_I2S_RER0 localVal = hwp_i2s->rer0;

    *rer0 = localVal.bit_field.rer0;
}

__STATIC_INLINE uint8_t i2s_rer0_getf(void)
{
    return hwp_i2s->rer0.bit_field.rer0;
}

__STATIC_INLINE void i2s_rer0_setf(uint8_t rer0)
{
    hwp_i2s->rer0.bit_field.rer0 = rer0;
}

__STATIC_INLINE uint32_t i2s_ter0_get(void)
{
    return hwp_i2s->ter0.val;
}

__STATIC_INLINE void i2s_ter0_set(uint32_t value)
{
    hwp_i2s->ter0.val = value;
}

__STATIC_INLINE void i2s_ter0_pack(uint8_t ter0)
{
    hwp_i2s->ter0.val = (((uint32_t)ter0 << 0));
}

__STATIC_INLINE void i2s_ter0_unpack(uint8_t* ter0)
{
    T_I2S_TER0 localVal = hwp_i2s->ter0;

    *ter0 = localVal.bit_field.ter0;
}

__STATIC_INLINE uint8_t i2s_ter0_getf(void)
{
    return hwp_i2s->ter0.bit_field.ter0;
}

__STATIC_INLINE void i2s_ter0_setf(uint8_t ter0)
{
    hwp_i2s->ter0.bit_field.ter0 = ter0;
}

__STATIC_INLINE uint32_t i2s_rcr0_get(void)
{
    return hwp_i2s->rcr0.val;
}

__STATIC_INLINE void i2s_rcr0_set(uint32_t value)
{
    hwp_i2s->rcr0.val = value;
}

__STATIC_INLINE void i2s_rcr0_pack(uint8_t rcr0)
{
    hwp_i2s->rcr0.val = (((uint32_t)rcr0 << 0));
}

__STATIC_INLINE void i2s_rcr0_unpack(uint8_t* rcr0)
{
    T_I2S_RCR0 localVal = hwp_i2s->rcr0;

    *rcr0 = localVal.bit_field.rcr0;
}

__STATIC_INLINE uint8_t i2s_rcr0_getf(void)
{
    return hwp_i2s->rcr0.bit_field.rcr0;
}

__STATIC_INLINE void i2s_rcr0_setf(uint8_t rcr0)
{
    hwp_i2s->rcr0.bit_field.rcr0 = rcr0;
}

__STATIC_INLINE uint32_t i2s_tcr0_get(void)
{
    return hwp_i2s->tcr0.val;
}

__STATIC_INLINE void i2s_tcr0_set(uint32_t value)
{
    hwp_i2s->tcr0.val = value;
}

__STATIC_INLINE void i2s_tcr0_pack(uint8_t tcr0)
{
    hwp_i2s->tcr0.val = (((uint32_t)tcr0 << 0));
}

__STATIC_INLINE void i2s_tcr0_unpack(uint8_t* tcr0)
{
    T_I2S_TCR0 localVal = hwp_i2s->tcr0;

    *tcr0 = localVal.bit_field.tcr0;
}

__STATIC_INLINE uint8_t i2s_tcr0_getf(void)
{
    return hwp_i2s->tcr0.bit_field.tcr0;
}

__STATIC_INLINE void i2s_tcr0_setf(uint8_t tcr0)
{
    hwp_i2s->tcr0.bit_field.tcr0 = tcr0;
}

__STATIC_INLINE uint32_t i2s_isr0_get(void)
{
    return hwp_i2s->isr0.val;
}

__STATIC_INLINE void i2s_isr0_unpack(uint8_t* isr0)
{
    T_I2S_ISR0 localVal = hwp_i2s->isr0;

    *isr0 = localVal.bit_field.isr0;
}

__STATIC_INLINE uint8_t i2s_isr0_getf(void)
{
    return hwp_i2s->isr0.bit_field.isr0;
}

__STATIC_INLINE uint32_t i2s_imr0_get(void)
{
    return hwp_i2s->imr0.val;
}

__STATIC_INLINE void i2s_imr0_set(uint32_t value)
{
    hwp_i2s->imr0.val = value;
}

__STATIC_INLINE void i2s_imr0_pack(uint8_t imr0)
{
    hwp_i2s->imr0.val = (((uint32_t)imr0 << 0));
}

__STATIC_INLINE void i2s_imr0_unpack(uint8_t* imr0)
{
    T_I2S_IMR0 localVal = hwp_i2s->imr0;

    *imr0 = localVal.bit_field.imr0;
}

__STATIC_INLINE uint8_t i2s_imr0_getf(void)
{
    return hwp_i2s->imr0.bit_field.imr0;
}

__STATIC_INLINE void i2s_imr0_setf(uint8_t imr0)
{
    hwp_i2s->imr0.bit_field.imr0 = imr0;
}

__STATIC_INLINE uint32_t i2s_ror0_get(void)
{
    return hwp_i2s->ror0.val;
}

__STATIC_INLINE void i2s_ror0_unpack(uint8_t* ror0)
{
    T_I2S_ROR0 localVal = hwp_i2s->ror0;

    *ror0 = localVal.bit_field.ror0;
}

__STATIC_INLINE uint8_t i2s_ror0_getf(void)
{
    return hwp_i2s->ror0.bit_field.ror0;
}

__STATIC_INLINE uint32_t i2s_tor0_get(void)
{
    return hwp_i2s->tor0.val;
}

__STATIC_INLINE void i2s_tor0_unpack(uint8_t* tor0)
{
    T_I2S_TOR0 localVal = hwp_i2s->tor0;

    *tor0 = localVal.bit_field.tor0;
}

__STATIC_INLINE uint8_t i2s_tor0_getf(void)
{
    return hwp_i2s->tor0.bit_field.tor0;
}

__STATIC_INLINE uint32_t i2s_rfcr0_get(void)
{
    return hwp_i2s->rfcr0.val;
}

__STATIC_INLINE void i2s_rfcr0_set(uint32_t value)
{
    hwp_i2s->rfcr0.val = value;
}

__STATIC_INLINE void i2s_rfcr0_pack(uint8_t rfcr0)
{
    hwp_i2s->rfcr0.val = (((uint32_t)rfcr0 << 0));
}

__STATIC_INLINE void i2s_rfcr0_unpack(uint8_t* rfcr0)
{
    T_I2S_RFCR0 localVal = hwp_i2s->rfcr0;

    *rfcr0 = localVal.bit_field.rfcr0;
}

__STATIC_INLINE uint8_t i2s_rfcr0_getf(void)
{
    return hwp_i2s->rfcr0.bit_field.rfcr0;
}

__STATIC_INLINE void i2s_rfcr0_setf(uint8_t rfcr0)
{
    hwp_i2s->rfcr0.bit_field.rfcr0 = rfcr0;
}

__STATIC_INLINE uint32_t i2s_tfcr0_get(void)
{
    return hwp_i2s->tfcr0.val;
}

__STATIC_INLINE void i2s_tfcr0_set(uint32_t value)
{
    hwp_i2s->tfcr0.val = value;
}

__STATIC_INLINE void i2s_tfcr0_pack(uint8_t tfcr0)
{
    hwp_i2s->tfcr0.val = (((uint32_t)tfcr0 << 0));
}

__STATIC_INLINE void i2s_tfcr0_unpack(uint8_t* tfcr0)
{
    T_I2S_TFCR0 localVal = hwp_i2s->tfcr0;

    *tfcr0 = localVal.bit_field.tfcr0;
}

__STATIC_INLINE uint8_t i2s_tfcr0_getf(void)
{
    return hwp_i2s->tfcr0.bit_field.tfcr0;
}

__STATIC_INLINE void i2s_tfcr0_setf(uint8_t tfcr0)
{
    hwp_i2s->tfcr0.bit_field.tfcr0 = tfcr0;
}

__STATIC_INLINE uint32_t i2s_rff0_get(void)
{
    return hwp_i2s->rff0.val;
}

__STATIC_INLINE void i2s_rff0_set(uint32_t value)
{
    hwp_i2s->rff0.val = value;
}

__STATIC_INLINE void i2s_rff0_pack(uint8_t rff0)
{
    hwp_i2s->rff0.val = (((uint32_t)rff0 << 0));
}

__STATIC_INLINE uint32_t i2s_tff0_get(void)
{
    return hwp_i2s->tff0.val;
}

__STATIC_INLINE void i2s_tff0_set(uint32_t value)
{
    hwp_i2s->tff0.val = value;
}

__STATIC_INLINE void i2s_tff0_pack(uint8_t tff0)
{
    hwp_i2s->tff0.val = (((uint32_t)tff0 << 0));
}

__STATIC_INLINE uint32_t i2s_rxdma_get(void)
{
    return hwp_i2s->rxdma.val;
}

__STATIC_INLINE void i2s_rxdma_unpack(uint32_t* rxdma)
{
    T_I2S_RXDMA localVal = hwp_i2s->rxdma;

    *rxdma = localVal.bit_field.rxdma;
}

__STATIC_INLINE uint32_t i2s_rxdma_getf(void)
{
    return hwp_i2s->rxdma.bit_field.rxdma;
}

__STATIC_INLINE uint32_t i2s_rrxdma_get(void)
{
    return hwp_i2s->rrxdma.val;
}

__STATIC_INLINE void i2s_rrxdma_set(uint32_t value)
{
    hwp_i2s->rrxdma.val = value;
}

__STATIC_INLINE void i2s_rrxdma_pack(uint8_t rrxdma)
{
    hwp_i2s->rrxdma.val = (((uint32_t)rrxdma << 0));
}

__STATIC_INLINE void i2s_rrxdma_unpack(uint8_t* rrxdma)
{
    T_I2S_RRXDMA localVal = hwp_i2s->rrxdma;

    *rrxdma = localVal.bit_field.rrxdma;
}

__STATIC_INLINE uint8_t i2s_rrxdma_getf(void)
{
    return hwp_i2s->rrxdma.bit_field.rrxdma;
}

__STATIC_INLINE void i2s_rrxdma_setf(uint8_t rrxdma)
{
    hwp_i2s->rrxdma.bit_field.rrxdma = rrxdma;
}

__STATIC_INLINE void i2s_txdma_set(uint32_t value)
{
    hwp_i2s->txdma.val = value;
}

__STATIC_INLINE void i2s_txdma_pack(uint32_t txdma)
{
    hwp_i2s->txdma.val = (((uint32_t)txdma << 0));
}

__STATIC_INLINE uint32_t i2s_rtxdma_get(void)
{
    return hwp_i2s->rtxdma.val;
}

__STATIC_INLINE void i2s_rtxdma_set(uint32_t value)
{
    hwp_i2s->rtxdma.val = value;
}

__STATIC_INLINE void i2s_rtxdma_pack(uint8_t rtxdma)
{
    hwp_i2s->rtxdma.val = (((uint32_t)rtxdma << 0));
}

__STATIC_INLINE void i2s_rtxdma_unpack(uint8_t* rtxdma)
{
    T_I2S_RTXDMA localVal = hwp_i2s->rtxdma;

    *rtxdma = localVal.bit_field.rtxdma;
}

__STATIC_INLINE uint8_t i2s_rtxdma_getf(void)
{
    return hwp_i2s->rtxdma.bit_field.rtxdma;
}

__STATIC_INLINE void i2s_rtxdma_setf(uint8_t rtxdma)
{
    hwp_i2s->rtxdma.bit_field.rtxdma = rtxdma;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_param_2_get(void)
{
    return hwp_i2s->i2s_comp_param_2.val;
}

__STATIC_INLINE void i2s_i2s_comp_param_2_unpack(uint32_t* i2s_comp_param_2)
{
    T_I2S_I2S_COMP_PARAM_2 localVal = hwp_i2s->i2s_comp_param_2;

    *i2s_comp_param_2 = localVal.bit_field.i2s_comp_param_2;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_param_2_getf(void)
{
    return hwp_i2s->i2s_comp_param_2.bit_field.i2s_comp_param_2;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_param_1_get(void)
{
    return hwp_i2s->i2s_comp_param_1.val;
}

__STATIC_INLINE void i2s_i2s_comp_param_1_unpack(uint32_t* i2s_comp_param_1)
{
    T_I2S_I2S_COMP_PARAM_1 localVal = hwp_i2s->i2s_comp_param_1;

    *i2s_comp_param_1 = localVal.bit_field.i2s_comp_param_1;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_param_1_getf(void)
{
    return hwp_i2s->i2s_comp_param_1.bit_field.i2s_comp_param_1;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_version_get(void)
{
    return hwp_i2s->i2s_comp_version.val;
}

__STATIC_INLINE void i2s_i2s_comp_version_unpack(uint32_t* i2s_comp_version)
{
    T_I2S_I2S_COMP_VERSION localVal = hwp_i2s->i2s_comp_version;

    *i2s_comp_version = localVal.bit_field.i2s_comp_version;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_version_getf(void)
{
    return hwp_i2s->i2s_comp_version.bit_field.i2s_comp_version;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_type_get(void)
{
    return hwp_i2s->i2s_comp_type.val;
}

__STATIC_INLINE void i2s_i2s_comp_type_unpack(uint32_t* i2s_comp_type)
{
    T_I2S_I2S_COMP_TYPE localVal = hwp_i2s->i2s_comp_type;

    *i2s_comp_type = localVal.bit_field.i2s_comp_type;
}

__STATIC_INLINE uint32_t i2s_i2s_comp_type_getf(void)
{
    return hwp_i2s->i2s_comp_type.bit_field.i2s_comp_type;
}
#endif


