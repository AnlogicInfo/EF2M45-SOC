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
#ifndef __REG_GPIO_H__
#define __REG_GPIO_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//gpio_swporta_dr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t              portadataregister : 16; /*15: 0, Values written to this register are output on the I/O signals forPort A if the corresponding data direction bits for Port A are setto Output mode and the corresponding control bit for Port A isset to Software mode. The value read back is equal to the lastvalue written to this register.*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_SWPORTA_DR;

//gpio_swporta_ddr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t     portadatadirectionregister : 16; /*15: 0, Values written to this register independently control thedirection of the corresponding data bit in Port A. The defaultdirection can be configured as input or output after systemreset through the GPIO_DFLT_DIR_A parameter.0 每 Input (default)1 每 Output*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_SWPORTA_DDR;

//gpio_swportb_dr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t              portbdataregister : 16; /*15: 0, Values written to this register are output on the I/O signals forPort B if the corresponding data direction bits for Port B are setto Output mode and the corresponding control bit for Port B isset to Software mode. The value read back is equal to the lastvalue written to this register.*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_SWPORTB_DR;

//gpio_swportb_ddr
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t     portbdatadirectionregister : 16; /*15: 0, Values written to this register independently control thedirection of the corresponding data bit in Port B. The defaultdirection can be configured as input or output after systemreset through the GPIO_DFLT_DIR_A parameter.0 每 Input (default)1 每 Output*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_SWPORTB_DDR;

//gpio_inten
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                interruptenable : 16; /*15: 0, Allows each bit of Port A to be configured for interrupts. By default the generation of interrupts is disabled. Whenever a 1 is written to a bit of this register, it configures the corresponding bit on Port A to become an interrupt; otherwise, Port A operates as a normal GPIO signal. Interrupts are disabled on the corresponding bits of Port A if the corresponding data direction register is set to Output or if Port A mode is set to Hardware.0 每 Configure Port A bit as normal GPIO signal (default)1 每 Configure Port A bit as interrupt*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_INTEN;

//gpio_intmask
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       int_mask : 16; /*15: 0, Controls whether an interrupt on Port A can create an interrupt for the interrupt controller by not masking it. By default, all interrupts bits are unmasked. Whenever a 1 is written to a bit in this register, it masks the interrupt generation capability for this signal; otherwise interrupts are allowed through. The unmasked status can be read as well as the resultant status after masking.0 每 Interrupt bits are unmasked (default)1 每 Mask interrupt*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_INTMASK;

//gpio_inttype_level
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      int_level : 16; /*15: 0, Controls the type of interrupt that can occur on Port A. Whenever a 0 is written to a bit of this register, it configures the interrupt type to be level-sensitive; otherwise, it is edge-sensitive.0 每 Level-sensitive (default)1 每 Edge-sensitive*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_INTTYPE_LEVEL;

//gpio_int_polarity
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   int_polarity : 16; /*15: 0, Controls the polarity of edge or level sensitivity that can occur on input of Port A. Whenever a 0 is written to a bit of this register, it configures the interrupt type to falling-edge or active-low sensitive; otherwise, it is rising-edge or active-high sensitive.0 每 Active-low (default)1 每 Active-high*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_INT_POLARITY;

//gpio_intstatus
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     int_status : 16; /*15: 0,     Interrupt status of Port A*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_INTSTATUS;

//gpio_raw_intstatus
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 raw_int_status : 16; /*15: 0, Raw interrupt of status of Port A (premasking bits)*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_RAW_INTSTATUS;

//gpio_debounce
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 debounceenable : 16; /*15: 0, Controls whether an external signal that is the source of an interrupt needs to be debounced to remove any spurious glitches. Writing a 1 to a bit in this register enables the debouncing circuitry. A signal must be valid for two periods of an external clock before it is internally processed.0 每 No debounce (default)1 每 Enable debounce*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_DEBOUNCE;

//gpio_porta_eoi
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      int_clear : 16; /*15: 0, Controls the clearing of edge type interrupts from Port A. When a 1 is written into a corresponding bit of this register, the interrupt is cleared. All interrupts are cleared when Port A is not configured for interrupts.0 每 No interrupt clear (default)1 每 Clear interrupt*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_PORTA_EOI;

//gpio_ext_porta
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      ext_porta : 16; /*15: 0, This register always reflects the signals value on the External Port A.*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_EXT_PORTA;

//gpio_ext_portb
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      ext_portb : 16; /*15: 0, This register always reflects the signals value on the External Port B.*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_EXT_PORTB;

//gpio_ls_sync
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     sync_level :  1; /* 0: 0, Writing a 1 to this register results in all level-sensitive interrupts being synchronized to pclk_intr.0 每 No synchronization to pclk_intr (default)1 每 Synchronize to pclk_intr*/
        uint32_t                     reserved_0 : 31; /*31: 1,                             NA*/
    } bit_field;
} T_GPIO_GPIO_LS_SYNC;

//gpio_int_bothedge
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  int_both_edge : 16; /*15: 0, Controls the edge type of interrupt that can occur on Port A.← Whenever a particular bit is programmed to 1, it enables the generation of interrupts on both the rising edge and the falling edge of an external input signal corresponding to that bit on port A.The values programmed in the registers gpio_intype_level and gpio_int_polarity for this particular bit are not considered when the corresponding bit of this register is set to 1.← Whenever a particular bit is programmed to 0, the interrupt type depends on the value of the corresponding bits in the gpio_inttype_level and gpio_int_polarity registers.0 每 Active-low (default)1 每 Active-high*/
        uint32_t                     reserved_0 : 16; /*31:16,                       reserved*/
    } bit_field;
} T_GPIO_GPIO_INT_BOTHEDGE;

//gpio_ver_id_code
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    gpio_ver_id : 32; /*31: 0, ASCII value for each number in the version, followed by *. For example 32_30_31_2A represents the version 2.01*Reset Value: See the releases table in the Release Notes*/
    } bit_field;
} T_GPIO_GPIO_VER_ID_CODE;

//Registers Mapping to the same address

typedef struct
{
    volatile          T_GPIO_GPIO_SWPORTA_DR                gpio_swporta_dr; /*  0x0,    RW, 0x00000000,           Port A Data Register*/
    volatile         T_GPIO_GPIO_SWPORTA_DDR               gpio_swporta_ddr; /*  0x4,    RW, 0x00000000,  Port A Data Direction Registe*/
    volatile                        uint32_t                     reserved_0;
    volatile          T_GPIO_GPIO_SWPORTB_DR                gpio_swportb_dr; /*  0xc,    RW, 0x00000000,           Port B Data Register*/
    volatile         T_GPIO_GPIO_SWPORTB_DDR               gpio_swportb_ddr; /* 0x10,    RW, 0x00000000,  Port B Data Direction Registe*/
    volatile                        uint32_t                  reserved_1[7];
    volatile               T_GPIO_GPIO_INTEN                     gpio_inten; /* 0x30,    RW, 0x00000000,               Interrupt enable*/
    volatile             T_GPIO_GPIO_INTMASK                   gpio_intmask; /* 0x34,    RW, 0x00000000,                 Interrupt mask*/
    volatile       T_GPIO_GPIO_INTTYPE_LEVEL             gpio_inttype_level; /* 0x38,    RW, 0x00000000,                Interrupt level*/
    volatile        T_GPIO_GPIO_INT_POLARITY              gpio_int_polarity; /* 0x3c,    RW, 0x00000000,             Interrupt polarity*/
    volatile           T_GPIO_GPIO_INTSTATUS                 gpio_intstatus; /* 0x40,    RO, 0x00000000,     Interrupt status of Port A*/
    volatile       T_GPIO_GPIO_RAW_INTSTATUS             gpio_raw_intstatus; /* 0x44,    RO, 0x00000000, Raw interrupt status of Port A (premasking)*/
    volatile            T_GPIO_GPIO_DEBOUNCE                  gpio_debounce; /* 0x48,    RW, 0x00000000,                Debounce enable*/
    volatile           T_GPIO_GPIO_PORTA_EOI                 gpio_porta_eoi; /* 0x4c,    WO, 0x00000000,         Port A clear interrupt*/
    volatile           T_GPIO_GPIO_EXT_PORTA                 gpio_ext_porta; /* 0x50,    RO, 0x00000000,           Port A external port*/
    volatile           T_GPIO_GPIO_EXT_PORTB                 gpio_ext_portb; /* 0x54,    RO, 0x00000000,           Port B external port*/
    volatile                        uint32_t                  reserved_2[2];
    volatile             T_GPIO_GPIO_LS_SYNC                   gpio_ls_sync; /* 0x60,    RW, 0x00000000, Level-sensitive synchronization enable*/
    volatile                        uint32_t                     reserved_3;
    volatile        T_GPIO_GPIO_INT_BOTHEDGE              gpio_int_bothedge; /* 0x68,    RW, 0x00000000,       Interrupt both edge type*/
    volatile         T_GPIO_GPIO_VER_ID_CODE               gpio_ver_id_code; /* 0x6c,    RO, 0x3231312A,              Component Version*/
} T_HWP_GPIO_T;

#define hwp_gpio ((T_HWP_GPIO_T*)REG_GPIO_BASE)


__STATIC_INLINE uint32_t gpio_gpio_swporta_dr_get(void)
{
    return hwp_gpio->gpio_swporta_dr.val;
}

__STATIC_INLINE void gpio_gpio_swporta_dr_set(uint32_t value)
{
    hwp_gpio->gpio_swporta_dr.val = value;
}

__STATIC_INLINE void gpio_gpio_swporta_dr_pack(uint16_t portadataregister)
{
    hwp_gpio->gpio_swporta_dr.val = (((uint32_t)portadataregister << 0));
}

__STATIC_INLINE void gpio_gpio_swporta_dr_unpack(uint16_t* portadataregister)
{
    T_GPIO_GPIO_SWPORTA_DR localVal = hwp_gpio->gpio_swporta_dr;

    *portadataregister = localVal.bit_field.portadataregister;
}

__STATIC_INLINE uint16_t gpio_portadataregister_getf(void)
{
    return hwp_gpio->gpio_swporta_dr.bit_field.portadataregister;
}

__STATIC_INLINE void gpio_portadataregister_setf(uint16_t portadataregister)
{
    hwp_gpio->gpio_swporta_dr.bit_field.portadataregister = portadataregister;
}

__STATIC_INLINE uint32_t gpio_gpio_swporta_ddr_get(void)
{
    return hwp_gpio->gpio_swporta_ddr.val;
}

__STATIC_INLINE void gpio_gpio_swporta_ddr_set(uint32_t value)
{
    hwp_gpio->gpio_swporta_ddr.val = value;
}

__STATIC_INLINE void gpio_gpio_swporta_ddr_pack(uint16_t portadatadirectionregister)
{
    hwp_gpio->gpio_swporta_ddr.val = (((uint32_t)portadatadirectionregister << 0));
}

__STATIC_INLINE void gpio_gpio_swporta_ddr_unpack(uint16_t* portadatadirectionregister)
{
    T_GPIO_GPIO_SWPORTA_DDR localVal = hwp_gpio->gpio_swporta_ddr;

    *portadatadirectionregister = localVal.bit_field.portadatadirectionregister;
}

__STATIC_INLINE uint16_t gpio_portadatadirectionregister_getf(void)
{
    return hwp_gpio->gpio_swporta_ddr.bit_field.portadatadirectionregister;
}

__STATIC_INLINE void gpio_portadatadirectionregister_setf(uint16_t portadatadirectionregister)
{
    hwp_gpio->gpio_swporta_ddr.bit_field.portadatadirectionregister = portadatadirectionregister;
}

__STATIC_INLINE uint32_t gpio_gpio_swportb_dr_get(void)
{
    return hwp_gpio->gpio_swportb_dr.val;
}

__STATIC_INLINE void gpio_gpio_swportb_dr_set(uint32_t value)
{
    hwp_gpio->gpio_swportb_dr.val = value;
}

__STATIC_INLINE void gpio_gpio_swportb_dr_pack(uint16_t portbdataregister)
{
    hwp_gpio->gpio_swportb_dr.val = (((uint32_t)portbdataregister << 0));
}

__STATIC_INLINE void gpio_gpio_swportb_dr_unpack(uint16_t* portbdataregister)
{
    T_GPIO_GPIO_SWPORTB_DR localVal = hwp_gpio->gpio_swportb_dr;

    *portbdataregister = localVal.bit_field.portbdataregister;
}

__STATIC_INLINE uint16_t gpio_portbdataregister_getf(void)
{
    return hwp_gpio->gpio_swportb_dr.bit_field.portbdataregister;
}

__STATIC_INLINE void gpio_portbdataregister_setf(uint16_t portbdataregister)
{
    hwp_gpio->gpio_swportb_dr.bit_field.portbdataregister = portbdataregister;
}

__STATIC_INLINE uint32_t gpio_gpio_swportb_ddr_get(void)
{
    return hwp_gpio->gpio_swportb_ddr.val;
}

__STATIC_INLINE void gpio_gpio_swportb_ddr_set(uint32_t value)
{
    hwp_gpio->gpio_swportb_ddr.val = value;
}

__STATIC_INLINE void gpio_gpio_swportb_ddr_pack(uint16_t portbdatadirectionregister)
{
    hwp_gpio->gpio_swportb_ddr.val = (((uint32_t)portbdatadirectionregister << 0));
}

__STATIC_INLINE void gpio_gpio_swportb_ddr_unpack(uint16_t* portbdatadirectionregister)
{
    T_GPIO_GPIO_SWPORTB_DDR localVal = hwp_gpio->gpio_swportb_ddr;

    *portbdatadirectionregister = localVal.bit_field.portbdatadirectionregister;
}

__STATIC_INLINE uint16_t gpio_portbdatadirectionregister_getf(void)
{
    return hwp_gpio->gpio_swportb_ddr.bit_field.portbdatadirectionregister;
}

__STATIC_INLINE void gpio_portbdatadirectionregister_setf(uint16_t portbdatadirectionregister)
{
    hwp_gpio->gpio_swportb_ddr.bit_field.portbdatadirectionregister = portbdatadirectionregister;
}

__STATIC_INLINE uint32_t gpio_gpio_inten_get(void)
{
    return hwp_gpio->gpio_inten.val;
}

__STATIC_INLINE void gpio_gpio_inten_set(uint32_t value)
{
    hwp_gpio->gpio_inten.val = value;
}

__STATIC_INLINE void gpio_gpio_inten_pack(uint16_t interruptenable)
{
    hwp_gpio->gpio_inten.val = (((uint32_t)interruptenable << 0));
}

__STATIC_INLINE void gpio_gpio_inten_unpack(uint16_t* interruptenable)
{
    T_GPIO_GPIO_INTEN localVal = hwp_gpio->gpio_inten;

    *interruptenable = localVal.bit_field.interruptenable;
}

__STATIC_INLINE uint16_t gpio_interruptenable_getf(void)
{
    return hwp_gpio->gpio_inten.bit_field.interruptenable;
}

__STATIC_INLINE void gpio_interruptenable_setf(uint16_t interruptenable)
{
    hwp_gpio->gpio_inten.bit_field.interruptenable = interruptenable;
}

__STATIC_INLINE uint32_t gpio_gpio_intmask_get(void)
{
    return hwp_gpio->gpio_intmask.val;
}

__STATIC_INLINE void gpio_gpio_intmask_set(uint32_t value)
{
    hwp_gpio->gpio_intmask.val = value;
}

__STATIC_INLINE void gpio_gpio_intmask_pack(uint16_t int_mask)
{
    hwp_gpio->gpio_intmask.val = (((uint32_t)int_mask << 0));
}

__STATIC_INLINE void gpio_gpio_intmask_unpack(uint16_t* int_mask)
{
    T_GPIO_GPIO_INTMASK localVal = hwp_gpio->gpio_intmask;

    *int_mask = localVal.bit_field.int_mask;
}

__STATIC_INLINE uint16_t gpio_int_mask_getf(void)
{
    return hwp_gpio->gpio_intmask.bit_field.int_mask;
}

__STATIC_INLINE void gpio_int_mask_setf(uint16_t int_mask)
{
    hwp_gpio->gpio_intmask.bit_field.int_mask = int_mask;
}

__STATIC_INLINE uint32_t gpio_gpio_inttype_level_get(void)
{
    return hwp_gpio->gpio_inttype_level.val;
}

__STATIC_INLINE void gpio_gpio_inttype_level_set(uint32_t value)
{
    hwp_gpio->gpio_inttype_level.val = value;
}

__STATIC_INLINE void gpio_gpio_inttype_level_pack(uint16_t int_level)
{
    hwp_gpio->gpio_inttype_level.val = (((uint32_t)int_level << 0));
}

__STATIC_INLINE void gpio_gpio_inttype_level_unpack(uint16_t* int_level)
{
    T_GPIO_GPIO_INTTYPE_LEVEL localVal = hwp_gpio->gpio_inttype_level;

    *int_level = localVal.bit_field.int_level;
}

__STATIC_INLINE uint16_t gpio_int_level_getf(void)
{
    return hwp_gpio->gpio_inttype_level.bit_field.int_level;
}

__STATIC_INLINE void gpio_int_level_setf(uint16_t int_level)
{
    hwp_gpio->gpio_inttype_level.bit_field.int_level = int_level;
}

__STATIC_INLINE uint32_t gpio_gpio_int_polarity_get(void)
{
    return hwp_gpio->gpio_int_polarity.val;
}

__STATIC_INLINE void gpio_gpio_int_polarity_set(uint32_t value)
{
    hwp_gpio->gpio_int_polarity.val = value;
}

__STATIC_INLINE void gpio_gpio_int_polarity_pack(uint16_t int_polarity)
{
    hwp_gpio->gpio_int_polarity.val = (((uint32_t)int_polarity << 0));
}

__STATIC_INLINE void gpio_gpio_int_polarity_unpack(uint16_t* int_polarity)
{
    T_GPIO_GPIO_INT_POLARITY localVal = hwp_gpio->gpio_int_polarity;

    *int_polarity = localVal.bit_field.int_polarity;
}

__STATIC_INLINE uint16_t gpio_int_polarity_getf(void)
{
    return hwp_gpio->gpio_int_polarity.bit_field.int_polarity;
}

__STATIC_INLINE void gpio_int_polarity_setf(uint16_t int_polarity)
{
    hwp_gpio->gpio_int_polarity.bit_field.int_polarity = int_polarity;
}

__STATIC_INLINE uint32_t gpio_gpio_intstatus_get(void)
{
    return hwp_gpio->gpio_intstatus.val;
}

__STATIC_INLINE void gpio_gpio_intstatus_unpack(uint16_t* int_status)
{
    T_GPIO_GPIO_INTSTATUS localVal = hwp_gpio->gpio_intstatus;

    *int_status = localVal.bit_field.int_status;
}

__STATIC_INLINE uint16_t gpio_int_status_getf(void)
{
    return hwp_gpio->gpio_intstatus.bit_field.int_status;
}

__STATIC_INLINE uint32_t gpio_gpio_raw_intstatus_get(void)
{
    return hwp_gpio->gpio_raw_intstatus.val;
}

__STATIC_INLINE void gpio_gpio_raw_intstatus_unpack(uint16_t* raw_int_status)
{
    T_GPIO_GPIO_RAW_INTSTATUS localVal = hwp_gpio->gpio_raw_intstatus;

    *raw_int_status = localVal.bit_field.raw_int_status;
}

__STATIC_INLINE uint16_t gpio_raw_int_status_getf(void)
{
    return hwp_gpio->gpio_raw_intstatus.bit_field.raw_int_status;
}

__STATIC_INLINE uint32_t gpio_gpio_debounce_get(void)
{
    return hwp_gpio->gpio_debounce.val;
}

__STATIC_INLINE void gpio_gpio_debounce_set(uint32_t value)
{
    hwp_gpio->gpio_debounce.val = value;
}

__STATIC_INLINE void gpio_gpio_debounce_pack(uint16_t debounceenable)
{
    hwp_gpio->gpio_debounce.val = (((uint32_t)debounceenable << 0));
}

__STATIC_INLINE void gpio_gpio_debounce_unpack(uint16_t* debounceenable)
{
    T_GPIO_GPIO_DEBOUNCE localVal = hwp_gpio->gpio_debounce;

    *debounceenable = localVal.bit_field.debounceenable;
}

__STATIC_INLINE uint16_t gpio_debounceenable_getf(void)
{
    return hwp_gpio->gpio_debounce.bit_field.debounceenable;
}

__STATIC_INLINE void gpio_debounceenable_setf(uint16_t debounceenable)
{
    hwp_gpio->gpio_debounce.bit_field.debounceenable = debounceenable;
}

__STATIC_INLINE void gpio_gpio_porta_eoi_set(uint32_t value)
{
    hwp_gpio->gpio_porta_eoi.val = value;
}

__STATIC_INLINE void gpio_gpio_porta_eoi_pack(uint16_t int_clear)
{
    hwp_gpio->gpio_porta_eoi.val = (((uint32_t)int_clear << 0));
}

__STATIC_INLINE uint32_t gpio_gpio_ext_porta_get(void)
{
    return hwp_gpio->gpio_ext_porta.val;
}

__STATIC_INLINE void gpio_gpio_ext_porta_unpack(uint16_t* ext_porta)
{
    T_GPIO_GPIO_EXT_PORTA localVal = hwp_gpio->gpio_ext_porta;

    *ext_porta = localVal.bit_field.ext_porta;
}

__STATIC_INLINE uint16_t gpio_ext_porta_getf(void)
{
    return hwp_gpio->gpio_ext_porta.bit_field.ext_porta;
}

__STATIC_INLINE uint32_t gpio_gpio_ext_portb_get(void)
{
    return hwp_gpio->gpio_ext_portb.val;
}

__STATIC_INLINE void gpio_gpio_ext_portb_unpack(uint16_t* ext_portb)
{
    T_GPIO_GPIO_EXT_PORTB localVal = hwp_gpio->gpio_ext_portb;

    *ext_portb = localVal.bit_field.ext_portb;
}

__STATIC_INLINE uint16_t gpio_ext_portb_getf(void)
{
    return hwp_gpio->gpio_ext_portb.bit_field.ext_portb;
}

__STATIC_INLINE uint32_t gpio_gpio_ls_sync_get(void)
{
    return hwp_gpio->gpio_ls_sync.val;
}

__STATIC_INLINE void gpio_gpio_ls_sync_set(uint32_t value)
{
    hwp_gpio->gpio_ls_sync.val = value;
}

__STATIC_INLINE void gpio_gpio_ls_sync_pack(uint8_t sync_level)
{
    hwp_gpio->gpio_ls_sync.val = (((uint32_t)sync_level << 0));
}

__STATIC_INLINE void gpio_gpio_ls_sync_unpack(uint8_t* sync_level)
{
    T_GPIO_GPIO_LS_SYNC localVal = hwp_gpio->gpio_ls_sync;

    *sync_level = localVal.bit_field.sync_level;
}

__STATIC_INLINE uint8_t gpio_sync_level_getf(void)
{
    return hwp_gpio->gpio_ls_sync.bit_field.sync_level;
}

__STATIC_INLINE void gpio_sync_level_setf(uint8_t sync_level)
{
    hwp_gpio->gpio_ls_sync.bit_field.sync_level = sync_level;
}

__STATIC_INLINE uint32_t gpio_gpio_int_bothedge_get(void)
{
    return hwp_gpio->gpio_int_bothedge.val;
}

__STATIC_INLINE void gpio_gpio_int_bothedge_set(uint32_t value)
{
    hwp_gpio->gpio_int_bothedge.val = value;
}

__STATIC_INLINE void gpio_gpio_int_bothedge_pack(uint16_t int_both_edge)
{
    hwp_gpio->gpio_int_bothedge.val = (((uint32_t)int_both_edge << 0));
}

__STATIC_INLINE void gpio_gpio_int_bothedge_unpack(uint16_t* int_both_edge)
{
    T_GPIO_GPIO_INT_BOTHEDGE localVal = hwp_gpio->gpio_int_bothedge;

    *int_both_edge = localVal.bit_field.int_both_edge;
}

__STATIC_INLINE uint16_t gpio_int_both_edge_getf(void)
{
    return hwp_gpio->gpio_int_bothedge.bit_field.int_both_edge;
}

__STATIC_INLINE void gpio_int_both_edge_setf(uint16_t int_both_edge)
{
    hwp_gpio->gpio_int_bothedge.bit_field.int_both_edge = int_both_edge;
}

__STATIC_INLINE uint32_t gpio_gpio_ver_id_code_get(void)
{
    return hwp_gpio->gpio_ver_id_code.val;
}

__STATIC_INLINE void gpio_gpio_ver_id_code_unpack(uint32_t* gpio_ver_id)
{
    T_GPIO_GPIO_VER_ID_CODE localVal = hwp_gpio->gpio_ver_id_code;

    *gpio_ver_id = localVal.bit_field.gpio_ver_id;
}

__STATIC_INLINE uint32_t gpio_gpio_ver_id_getf(void)
{
    return hwp_gpio->gpio_ver_id_code.bit_field.gpio_ver_id;
}
#endif


