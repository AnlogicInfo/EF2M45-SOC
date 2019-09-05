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
#ifndef __REG_DMAC_H__
#define __REG_DMAC_H__
//Auto-gen by fr
#include "_reg_base_addr.h"
//ch0_sar_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ch0_sar : 32; /*31: 0, Current Source Address of DMA transfer. Updated after each sourcetransfer. The SINC field in the CTLx register determines whether the address increments, decrements, or is left unchanged on every source transfer throughout the block transfer.*/
    } bit_field;
} T_DMAC_CH0_SAR_L;

//ch0_dar_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ch0_dar : 32; /*31: 0, Current Destination address of DMA transfer. Updated after eachdestination transfer. The DINC field in the CTLx register determines whetherthe address increments, decrements, or is left unchanged on everydestination transfer throughout the block transfer.*/
    } bit_field;
} T_DMAC_CH0_DAR_L;

//ch0_ctrl_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     ch0_int_en :  1; /* 0: 0, Interrupt Enable Bit. If set, then all interrupt-generating sources areenabled. Functions as a global mask bit for all interrupts for thechannel; raw* interrupt registers still assert if CTLx.INT_EN = 0.Reset Value: 0x1*/
        uint32_t               ch0_dst_tr_width :  3; /* 3: 1, Destination Transfer Width. Table 6-3 on page 175 lists thedecoding for this field. Mapped to AHB bus ※hsize.§ For anon-memory peripheral, typically rgw peripheral (destination) FIFOwidth.This value must be less than or equal to DMAH_Mk_HDATA_WIDTH,where k is the AHB layer 1 to 4 where the destination resides.Reset Value: Encoded value; refer to Table 6-3 on page 175.Dependencies: This field does not exist if DMAH_CHx_DTW(page 129) is hardcoded. In this case, the read-back value is alwaysthe hardcoded destination transfer width, DMAH_CHx_DTW.*/
        uint32_t               ch0_src_tr_width :  3; /* 6: 4, Source Transfer Width. Table 6-3 on page 175 lists the decoding forthis field.Mapped to AHB bus ※hsize.§ For a non-memory peripheral, typicallythe peripheral (source) FIFO width.This value must be less than or equal to DMAH_Mx_HDATA_WIDTH,where x is the AHB layer 1 to 4 where the source resides.Reset Value: Encoded value; refer to Table 6-3 on page 175.Dependencies: This field does not exist if the parameterDMAH_CHx_STW (page 129) is hardcoded. In this case, theread-back value is always the hardcoded source transfer width,DMAH_CHx_STW.*/
        uint32_t                       ch0_dinc :  2; /* 8: 7, Destination Address Increment. Indicates whether to increment ordecrement the destination address on every destination transfer. Ifyour device is writing data to a destination peripheral FIFO with afixed address, then set this field to ※No change.§00 = Increment01 = Decrement1x = No changeNOTE: Incrementing or decrementing is done for alignment to thenext CTLx.DST_TR_WIDTH boundary.Reset Value: 0x0*/
        uint32_t                       ch0_sinc :  2; /*10: 9, Source Address Increment. Indicates whether to increment ordecrement the source address on every source transfer. If the deviceis fetching data from a source peripheral FIFO with a fixed address,then set this field to ※No change.§00 = Increment01 = Decrement1x = No changeNOTE: Incrementing or decrementing is done for alignment to thenext CTLx.SRC_TR_WIDTH boundary.Reset Value: 0x0*/
        uint32_t                 ch0_dest_msize :  3; /*13:11, Destination Burst Transaction Length. Number of data items, eachof width CTLx.DST_TR_WIDTH, to be written to the destinationevery time a destination burst transaction request is made from eitherthe corresponding hardware or software handshaking interface.NOTE: This value is not related to the AHB bus master HBURSTbus.Reset Value: 0x1Dependencies: DMAH_CHx_MAX_MULT_SIZE determines the bit width of this field. All surplus bits in this field do not exist and read back as 0.*/
        uint32_t                  ch0_src_msize :  3; /*16:14, Source Burst Transaction Length. Number of data items, each ofwidth CTLx.SRC_TR_WIDTH, to be read from the source every timea source burst transaction request is made from either thecorresponding hardware or software handshaking interface.Table 6-2 on page 174 lists the decoding for this field; refer to※Choosing the Receive Watermark level§ on page 101.NOTE: This value is not related to the AHB bus master HBURSTbus.Reset Value: 0x1Dependencies: The configuration parameter DMAH_CHx_MAX_MULT_SIZE determines the bit widthof this field. All remaining bits in this field do not exist and read backas 0.*/
        uint32_t              ch0_src_gather_en :  1; /*17:17, Source gather enable bit:0 = Gather disabled1 = Gather enabledGather on the source side is applicable only when the CTLx.SINC bitindicates an incrementing or decrementing address control.Reset Value: 0x0Dependencies: This field does not exist ifDMAH_CHx_SRC_GAT_EN is not selected; in this case, the read-back value is always 0.*/
        uint32_t             ch0_dst_scatter_en :  1; /*18:18, Destination scatter enable bit:0 = Scatter disabled1 = Scatter enabledScatter on the destination side is applicable only when theCTLx.DINC bit indicates an incrementing or decrementing addresscontrol.Reset Value: 0x0Dependencies: This field does not exist if DMAH_CHx_DST_SCA_EN is not selected; in this case, the read-back value is always 0.*/
        uint32_t                     reserved_1 :  1; /*19:19,                       Reserved*/
        uint32_t                      ch0_tt_fc :  2; /*21:20, Transfer Type and Flow Control. The following transfer types aresupported.? Memory to Memory? Memory to Peripheral? Peripheral to Memory? Peripheral to PeripheralFlow Control can be assigned to the DW_ahb_dmac, the sourceperipheral, or the destination peripheral. Reset Value: Configuration dependent:TT_FC[0] = 1＊b1TT_FC[1] = DMAH_CHx_FC[1] || (!DMAH_CHx_FC[0])TT_FC[2] = DMAH_CHx_FC[1] ^ DMAH_CHx_FC[0]Dependencies: If the configuration parameter DMAH_CHx_FCis set to DMA_FC_ONLY, then TT_FC[2] does not existand TT_FC[2] always reads back 0.If DMAH_CHx_FC is set to SRC_FC_ONLY, then TT_FC[2:1] doesnot exist and TT_FC[2:1] always reads back 2＊b10.If DMAH_CHx_FC is set to DST_FC_ONLY, then TT_FC[2:1] doesnot exist and TT_FC[2:1] always reads back 2＊b11.For multi-block transfers using linked list operation, TT_FC must beconstant for all blocks of this multi-block transfer.*/
        uint32_t                        ch0_dms :  3; /*24:22, Destination Master Select. Identifies the Master Interface layerwhere the destination device (peripheral or memory) resides.00 = AHB master 101 = AHB master 210 = AHB master 311 = AHB master 4The maximum value of this field that can be read back isDMAH_NUM_MASTER_INT 每 1.Reset Value: DMAH_CHx_DMS[1:0]Dependencies: This field does not exist if the configurationparameter DMAH_CHx_DMS (page 129) is hardcoded; in this case,the read-back value is always the hardcoded value.*/
        uint32_t                        ch0_sms :  2; /*26:25, Source Master Select. Identifies the Master Interface layer fromwhich the source device (peripheral or memory) is accessed.00 = AHB master 101 = AHB master 210 = AHB master 311 = AHB master 4The maximum value of this field that can be read back isDMAH_NUM_MASTER_INT 每 1.Reset Value: DMAH_CHx_SMS[1:0]Dependencies: This field does not exist if the configurationparameter DMAH_CHx_SMS is hardcoded; in this case,the read-back value is always the hardcoded value.*/
        uint32_t                 ch0_llp_dst_en :  1; /*27:27, Block chaining is enabled on the destination side only if theLLP_DST_EN field is high and LLPx.LOC is non-zero.Reset Value: 0x0Dependencies: This field does not exist if the configurationparameter DMAH_CHx_MULTI_BLK_EN is not selected or if DMAH_CHx_HC_LLP is selected; in this case, the read-back value is always 0.*/
        uint32_t                 ch0_llp_src_en :  1; /*28:28, Block chaining is enabled on the source side only if theLLP_SRC_EN field is high and LLPx.LOC is non-zeroReset Value: 0x0Dependencies: This field does not exist if the configurationparameter DMAH_CHx_MULTI_BLK_EN is not selected or if DMAH_CHx_HC_LLP is selected; in this case, the read-back value is always 0.*/
        uint32_t                     reserved_0 :  3; /*31:29,                       Reserved*/
    } bit_field;
} T_DMAC_CH0_CTRL_L;

//ch0_ctrl_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch0_block_ts : 12; /*11: 0, Block Transfer Size.When the DW_ahb_dmac is the flow controller, the user writes thisfield before the channel is enabled in order to indicate the block size.The number programmed into BLOCK_TS indicates the total numberof single transactions to perform for every block transfer; a singletransaction is mapped to a single AMBA beat.Width: The width of the single transaction is determined byCTLx.SRC_TR_WIDTH. For further information on setting this field,refer to Table 6-3 on page 175 and ※Transfer Operation§ on page 61.Once the transfer starts, the read-back value is the total number ofdata items already read from the source peripheral, regardless ofwhat is the flow controller.When the source or destination peripheral is assigned as the flowcontroller, then the maximum block size that can be read backsaturates at DMAH_CHx_MAX_BLK_SIZE, but the actual block sizecan be greater. Refer to Table 8-1 on page 249.b = log2(DMAH_CHx_MAX_BLK_SIZE + 1) + 31Bits 43:b+1 do not exist and return 0 on a read.Reset Value: 0x2*/
        uint32_t                       ch0_done :  1; /*12:12, Done bitIf status write-back is enabled, the upper word of the control register,CTLx[63:32], is written to the control register location of the LinkedList Item (LLI) in system memory at the end of the block transfer withthe done bit set.Software can poll the LLI CTLx.DONE bit to see when a blocktransfer is complete. The LLI CTLx.DONE bit should be clearedwhen the linked lists are set up in memory prior to enabling thechannel.LLI accesses are always 32-bit accesses (Hsize = 2) aligned to 32-bitboundaries and cannot be changed or programmed to anything otherthan 32-bit. For more information, refer to ※Multi-Block Transfers§ onpage 247.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 19; /*31:13,                       Reserved*/
    } bit_field;
} T_DMAC_CH0_CTRL_H;

//ch0_cfg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     reserved_0 :  5; /* 4: 0,                       Reserved*/
        uint32_t                   ch0_ch_prior :  3; /* 7: 5, Channel priority. A priority of 7 is the highest priority, and 0 isthe lowest. This field must be programmed within the followingrange:0: (DMAH_NUM_CHANNELS 每 1)A programmed value outside this range will cause erroneousbehavior.*/
        uint32_t                    ch0_ch_susp :  1; /* 8: 8, Channel Suspend. Suspends all DMA data transfers from thesource until this bit is cleared. There is no guarantee that thecurrent transaction will complete. Can also be used in conjunctionwith CFGx.FIFO_EMPTY to cleanly disable a channel withoutlosing any data.0 = Not suspended.1 = Suspend DMA transfer from the source.For more information, refer to ※Disabling a Channel Prior toTransfer Completion§ on page 282.*/
        uint32_t                 ch0_fifo_empty :  1; /* 9: 9, Indicates if there is data left in the channel FIFO. Can be used inconjunction with CFGx.CH_SUSP to cleanly disable a channel.For more information, refer to ※Disabling a Channel Prior toTransfer Completion§ on page 282.1 = Channel FIFO empty0 = Channel FIFO not empty*/
        uint32_t                 ch0_hs_sel_dst :  1; /*10:10, Destination Software or Hardware Handshaking Select. Thisregister selects which of the handshaking interfaces 每 hardwareor software 每 is active for destination requests on this channel.0 = Hardware handshaking interface. Software-initiatedtransaction requests are ignored.1 = Software handshaking interface. Hardware- initiatedtransaction requests are ignored.If the destination peripheral is memory, then this bit is ignored.*/
        uint32_t                 ch0_hs_sel_src :  1; /*11:11, Source Software or Hardware Handshaking Select. Thisregister selects which of the handshaking interfaces 每 hardwareor software 每 is active for source requests on this channel.0 = Hardware handshaking interface. Software-initiatedtransaction requests are ignored.1 = Software handshaking interface. Hardware-initiatedtransaction requests are ignored.If the source peripheral is memory, then this bit is ignored.*/
        uint32_t                  ch0_lock_ch_l :  2; /*13:12, Channel Lock Level. Indicates the duration over whichCFGx.LOCK_CH bit applies.00 = Over complete DMA transfer01 = Over complete DMA block transfer1x = Over complete DMA transactionThis field does not exist if the configuration parameterDMAH_CHx_LOCK_EN is set to False (page 128); in this case,the read-back value is always 0.*/
        uint32_t                   ch0_lock_b_l :  2; /*15:14, Bus Lock Level. Indicates the duration over whichCFGx.LOCK_B bit applies.00 = Over complete DMA transfer01 = Over complete DMA block transfer1x = Over complete DMA transactionThis field does not exist if the parameter DMAH_CHx_LOCK_ENis set to False (page 128); in this case, the read-back value isalways 0.*/
        uint32_t                    ch0_lock_ch :  1; /*16:16, Bus Lock Bit. When active, the AHB bus master signal hlock isasserted for the duration specified in CFGx.LOCK_B_L. For moreinformation, refer to ※Locked DMA Transfers§ on page 103.This field does not exist if the configuration parameterDMAH_CHx_LOCK_EN is set to False (page 128); in this case,the read-back value is always 0.*/
        uint32_t                     ch0_lock_b :  1; /*17:17, Bus Lock Bit. When active, the AHB bus master signal hlock isasserted for the duration specified in CFGx.LOCK_B_L. For moreinformation, refer to ※Locked DMA Transfers§ on page 103.This field does not exist if the configuration parameterDMAH_CHx_LOCK_EN is set to False (page 128); in this case,the read-back value is always 0.*/
        uint32_t                 ch0_dst_hs_pol :  1; /*18:18, Source Handshaking Interface Polarity.0 = Active high1 = Active lowFor information on this, refer to ※Handshaking Interface§ onpage 42.*/
        uint32_t                 ch0_src_hs_pol :  1; /*19:19, Source Handshaking Interface Polarity.0 = Active high1 = Active lowFor information on this, refer to ※Handshaking Interface§ onpage 42.*/
        uint32_t                  ch0_max_abrst : 10; /*29:20, Maximum AMBA Burst Length. Maximum AMBA burst lengththat is used for DMA transfers on this channel.A value of 0 indicates that software is not limiting the maximumAMBA burst length for DMA transfers on this channel.This field does not exist if the configuration parameterDMAH_MABRST (page 121) is not selected; in this case, theread-back value is always 0, and the maximum AMBA burstlength cannot be limited by software.*/
        uint32_t                 ch0_reload_src :  1; /*30:30, Automatic Source Reload. The SARx register can beautomatically reloaded from its initial value at the end of everyblock for multi-block transfers. A new block transfer is theninitiated. For conditions under which this occurs, refer to Table 8-1on page 249.This field does not exist if the configuration parameterDMAH_CHx_MULTI_BLK_EN (page 130) is not selected; in thiscase, the read-back value is always 0.*/
        uint32_t                 ch0_reload_dst :  1; /*31:31, Automatic Destination Reload. The DARx register can beautomatically reloaded from its initial value at the end of everyblock for multi-block transfers. A new block transfer is theninitiated. For conditions under which this occurs, refer to Table 8-1on page 249.This register does not exist if the configuration parameterDMAH_CHx_MULTI_BLK_EN (page 130) is not selected; in thiscase, the read-back value is always 0.*/
    } bit_field;
} T_DMAC_CH0_CFG_L;

//ch0_cfg_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    ch0_fc_mode :  1; /* 0: 0, Flow Control Mode. Determines when source transactionrequests are serviced when the Destination Peripheral is the flowcontroller.0 = Source transaction requests are serviced when they occur.Data pre-fetching is enabled.1 = Source transaction requests are not serviced until adestination transaction request occurs. In this mode, the amountof data transferred from the source is limited so that it isguaranteed to be transferred to the destination prior to blocktermination by the destination. Data pre-fetching is disabled.*/
        uint32_t                  ch0_fifo_mode :  1; /* 1: 1, FIFO Mode Select. Determines how much space or data needsto be available in the FIFO before a burst transaction request isserviced.0 = Space/data available for single AHB transfer of the specifiedtransfer width.1 = Data available is greater than or equal to half the FIFO depthfor destination transfers and space available is greater than halfthe fifo depth for source transfers. The exceptions are at the endof a burst transaction request or at the end of a block transfer.*/
        uint32_t                    ch0_protctl :  3; /* 4: 2, Protection Control bits used to drive the AHB HPROT[3:1] bus.The AMBA Specification recommends that the default value ofHPROT indicates a non-cached, non-buffered, privileged dataaccess. The reset value is used to indicate such an access.HPROT[0] is tied high because all transfers are data accesses,as there are no opcode fetches.There is a one-to-one mapping of these register bits to theHPROT[3:1] master interface signals. Table 6-5 on page 185shows the mapping of bits in this field to the AHB HPROT[3:1]bus.*/
        uint32_t                  ch0_ds_upd_en :  1; /* 5: 5, Destination Status Update Enable. Destination statusinformation is fetched only from the location pointed to by theDSTATARx register, stored in the DSTATx register and written outto the DSTATx location of the LLI (refer to Figure 8-3 on page250) if DS_UPD_EN is high.This field does not exist if the configuration parameterDMAH_CHx_STAT_DST is set to False; in this case, theread-back value is always 0.*/
        uint32_t                  ch0_ss_upd_en :  1; /* 6: 6, Source Status Update Enable. Source status information isfetched only from the location pointed to by the SSTATARxregister, stored in the SSTATx register and written out to theSSTATx location of the LLI (refer to Figure 8-3 on page 250) ifSS_UPD_EN is high.NOTE: This enable is applicable only if DMAH_CHx_STAT_SRC(page 132) is set to True.This field does not exist if the configuration parameterDMAH_CHx_STAT_SRC is set to False; in this case, theread-back value is always 0.*/
        uint32_t                    ch0_src_per :  4; /*10: 7, Assigns a hardware handshaking interface(0 - DMAH_NUM_HS_INT-1) to the source of channel x if theCFGx.HS_SEL_SRC field is 0; otherwise, this field is ignored.The channel can then communicate with the source peripheralconnected to that interface through the assigned hardwarehandshaking interface.NOTE1: For correct DW_ahb_dmac operation, only oneperipheral (source or destination) should be assigned to thesame handshaking interface.NOTE2: This field does not exist if the configuration parameterDMAH_NUM_HS_INT is set to 0.NOTE3:← b = 39 if DMAH_NUM_HS_INT is 1← b = ceil(log2(DMAH_NUM_HS_INT)) + 38 ifDMAH_NUM_HS_INT is greater than 1Bits 42:(b+1) do not exist and return 0 on a read.*/
        uint32_t                   ch0_dest_per :  4; /*14:11, Assigns a hardware handshaking interface(0 - DMAH_NUM_HS_INT-1) to the destination of channel x if theCFGx.HS_SEL_DST field is 0; otherwise, this field is ignored.The channel can then communicate with the destinationperipheral connected to that interface through the assignedhardware handshaking interface.NOTE1: For correct DMA operation, only one peripheral (sourceor destination) should be assigned to the same handshakinginterface.NOTE2: This field does not exist if the configuration parameterDMAH_NUM_HS_INT is set to 0.NOTE3:← b = 43 if DMAH_NUM_HS_INT is 1← b = ceil(log2(DMAH_NUM_HS_INT)) + 42 ifDMAH_NUM_HS_INT is greater than 1Bits 46:(b+1) do not exist and return 0 on a read.*/
        uint32_t                     reserved_0 : 17; /*31:15,                       Reserved*/
    } bit_field;
} T_DMAC_CH0_CFG_H;

//ch1_sar_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ch1_sar : 32; /*31: 0, Current Source Address of DMA transfer. Updated after each sourcetransfer. The SINC field in the CTLx register determines whether the address increments, decrements, or is left unchanged on every source transfer throughout the block transfer.*/
    } bit_field;
} T_DMAC_CH1_SAR_L;

//ch1_dar_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ch1_dar : 32; /*31: 0, Current Destination address of DMA transfer. Updated after eachdestination transfer. The DINC field in the CTLx register determines whetherthe address increments, decrements, or is left unchanged on everydestination transfer throughout the block transfer.*/
    } bit_field;
} T_DMAC_CH1_DAR_L;

//ch1_ctrl_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     ch1_int_en :  1; /* 0: 0, Interrupt Enable Bit. If set, then all interrupt-generating sources areenabled. Functions as a global mask bit for all interrupts for thechannel; raw* interrupt registers still assert if CTLx.INT_EN = 0.Reset Value: 0x1*/
        uint32_t               ch1_dst_tr_width :  3; /* 3: 1, Destination Transfer Width. Table 6-3 on page 175 lists thedecoding for this field. Mapped to AHB bus ※hsize.§ For anon-memory peripheral, typically rgw peripheral (destination) FIFOwidth.This value must be less than or equal to DMAH_Mk_HDATA_WIDTH,where k is the AHB layer 1 to 4 where the destination resides.Reset Value: Encoded value; refer to Table 6-3 on page 175.Dependencies: This field does not exist if DMAH_CHx_DTW(page 129) is hardcoded. In this case, the read-back value is alwaysthe hardcoded destination transfer width, DMAH_CHx_DTW.*/
        uint32_t               ch1_src_tr_width :  3; /* 6: 4, Source Transfer Width. Table 6-3 on page 175 lists the decoding forthis field.Mapped to AHB bus ※hsize.§ For a non-memory peripheral, typicallythe peripheral (source) FIFO width.This value must be less than or equal to DMAH_Mx_HDATA_WIDTH,where x is the AHB layer 1 to 4 where the source resides.Reset Value: Encoded value; refer to Table 6-3 on page 175.Dependencies: This field does not exist if the parameterDMAH_CHx_STW (page 129) is hardcoded. In this case, theread-back value is always the hardcoded source transfer width,DMAH_CHx_STW.*/
        uint32_t                       ch1_dinc :  2; /* 8: 7, Destination Address Increment. Indicates whether to increment ordecrement the destination address on every destination transfer. Ifyour device is writing data to a destination peripheral FIFO with afixed address, then set this field to ※No change.§00 = Increment01 = Decrement1x = No changeNOTE: Incrementing or decrementing is done for alignment to thenext CTLx.DST_TR_WIDTH boundary.Reset Value: 0x0*/
        uint32_t                       ch1_sinc :  2; /*10: 9, Source Address Increment. Indicates whether to increment ordecrement the source address on every source transfer. If the deviceis fetching data from a source peripheral FIFO with a fixed address,then set this field to ※No change.§00 = Increment01 = Decrement1x = No changeNOTE: Incrementing or decrementing is done for alignment to thenext CTLx.SRC_TR_WIDTH boundary.Reset Value: 0x0*/
        uint32_t                 ch1_dest_msize :  3; /*13:11, Destination Burst Transaction Length. Number of data items, eachof width CTLx.DST_TR_WIDTH, to be written to the destinationevery time a destination burst transaction request is made from eitherthe corresponding hardware or software handshaking interface.NOTE: This value is not related to the AHB bus master HBURSTbus.Reset Value: 0x1Dependencies: DMAH_CHx_MAX_MULT_SIZE determines the bit width of this field. All surplus bits in this field do not exist and read back as 0.*/
        uint32_t                  ch1_src_msize :  3; /*16:14, Source Burst Transaction Length. Number of data items, each ofwidth CTLx.SRC_TR_WIDTH, to be read from the source every timea source burst transaction request is made from either thecorresponding hardware or software handshaking interface.Table 6-2 on page 174 lists the decoding for this field; refer to※Choosing the Receive Watermark level§ on page 101.NOTE: This value is not related to the AHB bus master HBURSTbus.Reset Value: 0x1Dependencies: The configuration parameter DMAH_CHx_MAX_MULT_SIZE determines the bit widthof this field. All remaining bits in this field do not exist and read backas 0.*/
        uint32_t              ch1_src_gather_en :  1; /*17:17, Source gather enable bit:0 = Gather disabled1 = Gather enabledGather on the source side is applicable only when the CTLx.SINC bitindicates an incrementing or decrementing address control.Reset Value: 0x0Dependencies: This field does not exist ifDMAH_CHx_SRC_GAT_EN is not selected; in this case, the read-back value is always 0.*/
        uint32_t             ch1_dst_scatter_en :  1; /*18:18, Destination scatter enable bit:0 = Scatter disabled1 = Scatter enabledScatter on the destination side is applicable only when theCTLx.DINC bit indicates an incrementing or decrementing addresscontrol.Reset Value: 0x0Dependencies: This field does not exist if DMAH_CHx_DST_SCA_EN is not selected; in this case, the read-back value is always 0.*/
        uint32_t                     reserved_1 :  1; /*19:19,                       Reserved*/
        uint32_t                      ch1_tt_fc :  2; /*21:20, Transfer Type and Flow Control. The following transfer types aresupported.? Memory to Memory? Memory to Peripheral? Peripheral to Memory? Peripheral to PeripheralFlow Control can be assigned to the DW_ahb_dmac, the sourceperipheral, or the destination peripheral. Reset Value: Configuration dependent:TT_FC[0] = 1＊b1TT_FC[1] = DMAH_CHx_FC[1] || (!DMAH_CHx_FC[0])TT_FC[2] = DMAH_CHx_FC[1] ^ DMAH_CHx_FC[0]Dependencies: If the configuration parameter DMAH_CHx_FCis set to DMA_FC_ONLY, then TT_FC[2] does not existand TT_FC[2] always reads back 0.If DMAH_CHx_FC is set to SRC_FC_ONLY, then TT_FC[2:1] doesnot exist and TT_FC[2:1] always reads back 2＊b10.If DMAH_CHx_FC is set to DST_FC_ONLY, then TT_FC[2:1] doesnot exist and TT_FC[2:1] always reads back 2＊b11.For multi-block transfers using linked list operation, TT_FC must beconstant for all blocks of this multi-block transfer.*/
        uint32_t                        ch1_dms :  3; /*24:22, Destination Master Select. Identifies the Master Interface layerwhere the destination device (peripheral or memory) resides.00 = AHB master 101 = AHB master 210 = AHB master 311 = AHB master 4The maximum value of this field that can be read back isDMAH_NUM_MASTER_INT 每 1.Reset Value: DMAH_CHx_DMS[1:0]Dependencies: This field does not exist if the configurationparameter DMAH_CHx_DMS (page 129) is hardcoded; in this case,the read-back value is always the hardcoded value.*/
        uint32_t                        ch1_sms :  2; /*26:25, Source Master Select. Identifies the Master Interface layer fromwhich the source device (peripheral or memory) is accessed.00 = AHB master 101 = AHB master 210 = AHB master 311 = AHB master 4The maximum value of this field that can be read back isDMAH_NUM_MASTER_INT 每 1.Reset Value: DMAH_CHx_SMS[1:0]Dependencies: This field does not exist if the configurationparameter DMAH_CHx_SMS is hardcoded; in this case,the read-back value is always the hardcoded value.*/
        uint32_t                 ch1_llp_dst_en :  1; /*27:27, Block chaining is enabled on the destination side only if theLLP_DST_EN field is high and LLPx.LOC is non-zero.Reset Value: 0x0Dependencies: This field does not exist if the configurationparameter DMAH_CHx_MULTI_BLK_EN is not selected or if DMAH_CHx_HC_LLP is selected; in this case, the read-back value is always 0.*/
        uint32_t                 ch1_llp_src_en :  1; /*28:28, Block chaining is enabled on the source side only if theLLP_SRC_EN field is high and LLPx.LOC is non-zeroReset Value: 0x0Dependencies: This field does not exist if the configurationparameter DMAH_CHx_MULTI_BLK_EN is not selected or if DMAH_CHx_HC_LLP is selected; in this case, the read-back value is always 0.*/
        uint32_t                     reserved_0 :  3; /*31:29,                       Reserved*/
    } bit_field;
} T_DMAC_CH1_CTRL_L;

//ch1_ctrl_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   ch1_block_ts : 12; /*11: 0, Block Transfer Size.When the DW_ahb_dmac is the flow controller, the user writes thisfield before the channel is enabled in order to indicate the block size.The number programmed into BLOCK_TS indicates the total numberof single transactions to perform for every block transfer; a singletransaction is mapped to a single AMBA beat.Width: The width of the single transaction is determined byCTLx.SRC_TR_WIDTH. For further information on setting this field,refer to Table 6-3 on page 175 and ※Transfer Operation§ on page 61.Once the transfer starts, the read-back value is the total number ofdata items already read from the source peripheral, regardless ofwhat is the flow controller.When the source or destination peripheral is assigned as the flowcontroller, then the maximum block size that can be read backsaturates at DMAH_CHx_MAX_BLK_SIZE, but the actual block sizecan be greater. Refer to Table 8-1 on page 249.b = log2(DMAH_CHx_MAX_BLK_SIZE + 1) + 31Bits 43:b+1 do not exist and return 0 on a read.Reset Value: 0x2*/
        uint32_t                       ch1_done :  1; /*12:12, Done bitIf status write-back is enabled, the upper word of the control register,CTLx[63:32], is written to the control register location of the LinkedList Item (LLI) in system memory at the end of the block transfer withthe done bit set.Software can poll the LLI CTLx.DONE bit to see when a blocktransfer is complete. The LLI CTLx.DONE bit should be clearedwhen the linked lists are set up in memory prior to enabling thechannel.LLI accesses are always 32-bit accesses (Hsize = 2) aligned to 32-bitboundaries and cannot be changed or programmed to anything otherthan 32-bit. For more information, refer to ※Multi-Block Transfers§ onpage 247.Reset Value: 0x0*/
        uint32_t                     reserved_0 : 19; /*31:13,                       Reserved*/
    } bit_field;
} T_DMAC_CH1_CTRL_H;

//ch1_cfg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     reserved_0 :  5; /* 4: 0,                       Reserved*/
        uint32_t                   ch1_ch_prior :  3; /* 7: 5, Channel priority. A priority of 7 is the highest priority, and 0 isthe lowest. This field must be programmed within the followingrange:0: (DMAH_NUM_CHANNELS 每 1)A programmed value outside this range will cause erroneousbehavior.*/
        uint32_t                    ch1_ch_susp :  1; /* 8: 8, Channel Suspend. Suspends all DMA data transfers from thesource until this bit is cleared. There is no guarantee that thecurrent transaction will complete. Can also be used in conjunctionwith CFGx.FIFO_EMPTY to cleanly disable a channel withoutlosing any data.0 = Not suspended.1 = Suspend DMA transfer from the source.For more information, refer to ※Disabling a Channel Prior toTransfer Completion§ on page 282.*/
        uint32_t                 ch1_fifo_empty :  1; /* 9: 9, Indicates if there is data left in the channel FIFO. Can be used inconjunction with CFGx.CH_SUSP to cleanly disable a channel.For more information, refer to ※Disabling a Channel Prior toTransfer Completion§ on page 282.1 = Channel FIFO empty0 = Channel FIFO not empty*/
        uint32_t                 ch1_hs_sel_dst :  1; /*10:10, Destination Software or Hardware Handshaking Select. Thisregister selects which of the handshaking interfaces 每 hardwareor software 每 is active for destination requests on this channel.0 = Hardware handshaking interface. Software-initiatedtransaction requests are ignored.1 = Software handshaking interface. Hardware- initiatedtransaction requests are ignored.If the destination peripheral is memory, then this bit is ignored.*/
        uint32_t                 ch1_hs_sel_src :  1; /*11:11, Source Software or Hardware Handshaking Select. Thisregister selects which of the handshaking interfaces 每 hardwareor software 每 is active for source requests on this channel.0 = Hardware handshaking interface. Software-initiatedtransaction requests are ignored.1 = Software handshaking interface. Hardware-initiatedtransaction requests are ignored.If the source peripheral is memory, then this bit is ignored.*/
        uint32_t                  ch1_lock_ch_l :  2; /*13:12, Channel Lock Level. Indicates the duration over whichCFGx.LOCK_CH bit applies.00 = Over complete DMA transfer01 = Over complete DMA block transfer1x = Over complete DMA transactionThis field does not exist if the configuration parameterDMAH_CHx_LOCK_EN is set to False (page 128); in this case,the read-back value is always 0.*/
        uint32_t                   ch1_lock_b_l :  2; /*15:14, Bus Lock Level. Indicates the duration over whichCFGx.LOCK_B bit applies.00 = Over complete DMA transfer01 = Over complete DMA block transfer1x = Over complete DMA transactionThis field does not exist if the parameter DMAH_CHx_LOCK_ENis set to False (page 128); in this case, the read-back value isalways 0.*/
        uint32_t                    ch1_lock_ch :  1; /*16:16, Bus Lock Bit. When active, the AHB bus master signal hlock isasserted for the duration specified in CFGx.LOCK_B_L. For moreinformation, refer to ※Locked DMA Transfers§ on page 103.This field does not exist if the configuration parameterDMAH_CHx_LOCK_EN is set to False (page 128); in this case,the read-back value is always 0.*/
        uint32_t                     ch1_lock_b :  1; /*17:17, Bus Lock Bit. When active, the AHB bus master signal hlock isasserted for the duration specified in CFGx.LOCK_B_L. For moreinformation, refer to ※Locked DMA Transfers§ on page 103.This field does not exist if the configuration parameterDMAH_CHx_LOCK_EN is set to False (page 128); in this case,the read-back value is always 0.*/
        uint32_t                 ch1_dst_hs_pol :  1; /*18:18, Source Handshaking Interface Polarity.0 = Active high1 = Active lowFor information on this, refer to ※Handshaking Interface§ onpage 42.*/
        uint32_t                 ch1_src_hs_pol :  1; /*19:19, Source Handshaking Interface Polarity.0 = Active high1 = Active lowFor information on this, refer to ※Handshaking Interface§ onpage 42.*/
        uint32_t                  ch1_max_abrst : 10; /*29:20, Maximum AMBA Burst Length. Maximum AMBA burst lengththat is used for DMA transfers on this channel.A value of 0 indicates that software is not limiting the maximumAMBA burst length for DMA transfers on this channel.This field does not exist if the configuration parameterDMAH_MABRST (page 121) is not selected; in this case, theread-back value is always 0, and the maximum AMBA burstlength cannot be limited by software.*/
        uint32_t                 ch1_reload_src :  1; /*30:30, Automatic Source Reload. The SARx register can beautomatically reloaded from its initial value at the end of everyblock for multi-block transfers. A new block transfer is theninitiated. For conditions under which this occurs, refer to Table 8-1on page 249.This field does not exist if the configuration parameterDMAH_CHx_MULTI_BLK_EN (page 130) is not selected; in thiscase, the read-back value is always 0.*/
        uint32_t                 ch1_reload_dst :  1; /*31:31, Automatic Destination Reload. The DARx register can beautomatically reloaded from its initial value at the end of everyblock for multi-block transfers. A new block transfer is theninitiated. For conditions under which this occurs, refer to Table 8-1on page 249.This register does not exist if the configuration parameterDMAH_CHx_MULTI_BLK_EN (page 130) is not selected; in thiscase, the read-back value is always 0.*/
    } bit_field;
} T_DMAC_CH1_CFG_L;

//ch1_cfg_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    ch1_fc_mode :  1; /* 0: 0, Flow Control Mode. Determines when source transactionrequests are serviced when the Destination Peripheral is the flowcontroller.0 = Source transaction requests are serviced when they occur.Data pre-fetching is enabled.1 = Source transaction requests are not serviced until adestination transaction request occurs. In this mode, the amountof data transferred from the source is limited so that it isguaranteed to be transferred to the destination prior to blocktermination by the destination. Data pre-fetching is disabled.*/
        uint32_t                  ch1_fifo_mode :  1; /* 1: 1, FIFO Mode Select. Determines how much space or data needsto be available in the FIFO before a burst transaction request isserviced.0 = Space/data available for single AHB transfer of the specifiedtransfer width.1 = Data available is greater than or equal to half the FIFO depthfor destination transfers and space available is greater than halfthe fifo depth for source transfers. The exceptions are at the endof a burst transaction request or at the end of a block transfer.*/
        uint32_t                    ch1_protctl :  3; /* 4: 2, Protection Control bits used to drive the AHB HPROT[3:1] bus.The AMBA Specification recommends that the default value ofHPROT indicates a non-cached, non-buffered, privileged dataaccess. The reset value is used to indicate such an access.HPROT[0] is tied high because all transfers are data accesses,as there are no opcode fetches.There is a one-to-one mapping of these register bits to theHPROT[3:1] master interface signals. Table 6-5 on page 185shows the mapping of bits in this field to the AHB HPROT[3:1]bus.*/
        uint32_t                  ch1_ds_upd_en :  1; /* 5: 5, Destination Status Update Enable. Destination statusinformation is fetched only from the location pointed to by theDSTATARx register, stored in the DSTATx register and written outto the DSTATx location of the LLI (refer to Figure 8-3 on page250) if DS_UPD_EN is high.This field does not exist if the configuration parameterDMAH_CHx_STAT_DST is set to False; in this case, theread-back value is always 0.*/
        uint32_t                  ch1_ss_upd_en :  1; /* 6: 6, Source Status Update Enable. Source status information isfetched only from the location pointed to by the SSTATARxregister, stored in the SSTATx register and written out to theSSTATx location of the LLI (refer to Figure 8-3 on page 250) ifSS_UPD_EN is high.NOTE: This enable is applicable only if DMAH_CHx_STAT_SRC(page 132) is set to True.This field does not exist if the configuration parameterDMAH_CHx_STAT_SRC is set to False; in this case, theread-back value is always 0.*/
        uint32_t                    ch1_src_per :  4; /*10: 7, Assigns a hardware handshaking interface(0 - DMAH_NUM_HS_INT-1) to the source of channel x if theCFGx.HS_SEL_SRC field is 0; otherwise, this field is ignored.The channel can then communicate with the source peripheralconnected to that interface through the assigned hardwarehandshaking interface.NOTE1: For correct DW_ahb_dmac operation, only oneperipheral (source or destination) should be assigned to thesame handshaking interface.NOTE2: This field does not exist if the configuration parameterDMAH_NUM_HS_INT is set to 0.NOTE3:← b = 39 if DMAH_NUM_HS_INT is 1← b = ceil(log2(DMAH_NUM_HS_INT)) + 38 ifDMAH_NUM_HS_INT is greater than 1Bits 42:(b+1) do not exist and return 0 on a read.*/
        uint32_t                   ch1_dest_per :  4; /*14:11, Assigns a hardware handshaking interface(0 - DMAH_NUM_HS_INT-1) to the destination of channel x if theCFGx.HS_SEL_DST field is 0; otherwise, this field is ignored.The channel can then communicate with the destinationperipheral connected to that interface through the assignedhardware handshaking interface.NOTE1: For correct DMA operation, only one peripheral (sourceor destination) should be assigned to the same handshakinginterface.NOTE2: This field does not exist if the configuration parameterDMAH_NUM_HS_INT is set to 0.NOTE3:← b = 43 if DMAH_NUM_HS_INT is 1← b = ceil(log2(DMAH_NUM_HS_INT)) + 42 ifDMAH_NUM_HS_INT is greater than 1Bits 46:(b+1) do not exist and return 0 on a read.*/
        uint32_t                     reserved_0 : 17; /*31:15,                       Reserved*/
    } bit_field;
} T_DMAC_CH1_CFG_H;

//rawtfr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         rawtfr :  2; /* 1: 0,          Raw interrupt status.*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_RAWTFR_L;

//rawblock_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                       rawblock :  2; /* 1: 0,          Raw interrupt status.*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_RAWBLOCK_L;

//rawsrctran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     rawsrctran :  2; /* 1: 0,          Raw interrupt status.*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_RAWSRCTRAN_L;

//rawdsttran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     rawdsttran :  2; /* 1: 0,          Raw interrupt status.*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_RAWDSTTRAN_L;

//rawerr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         rawerr :  2; /* 1: 0,          Raw interrupt status.*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_RAWERR_L;

//statustfr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      statustfr :  2; /* 1: 0,               Interrupt Status*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_STATUSTFR_L;

//statusblock_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    statusblock :  2; /* 1: 0,               Interrupt Status*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_STATUSBLOCK_L;

//statussrctran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  statussrctran :  2; /* 1: 0,               Interrupt Status*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_STATUSSRCTRAN_L;

//statusdsttran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  statusdsttran :  2; /* 1: 0,               Interrupt Status*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_STATUSDSTTRAN_L;

//statuserr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      statuserr :  2; /* 1: 0,               Interrupt Status*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_STATUSERR_L;

//masktfr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   int_mask_tfr :  2; /* 1: 0, Interrupt Mask0 = masked1 = unmaskeddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_1 :  6; /* 7: 2, Reserveddnc = DMAH_NUM_CHANNELSIf dnc = 8, then this field is not present.Reset Value: 0x0*/
        uint32_t                int_mask_ftr_we :  2; /* 9: 8, Interrupt Mask Write Enable0 = write disabled1 = write enableddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_0 : 22; /*31:10, Reserveddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
    } bit_field;
} T_DMAC_MASKTFR_L;

//maskblock_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                 int_mask_block :  2; /* 1: 0, Interrupt Mask0 = masked1 = unmaskeddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_1 :  6; /* 7: 2, Reserveddnc = DMAH_NUM_CHANNELSIf dnc = 8, then this field is not present.Reset Value: 0x0*/
        uint32_t              int_mask_block_we :  2; /* 9: 8, Interrupt Mask Write Enable0 = write disabled1 = write enableddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_0 : 22; /*31:10, Reserveddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
    } bit_field;
} T_DMAC_MASKBLOCK_L;

//masksrctran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               int_mask_srctran :  2; /* 1: 0, Interrupt Mask0 = masked1 = unmaskeddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_1 :  6; /* 7: 2, Reserveddnc = DMAH_NUM_CHANNELSIf dnc = 8, then this field is not present.Reset Value: 0x0*/
        uint32_t            int_mask_srctran_we :  2; /* 9: 8, Interrupt Mask Write Enable0 = write disabled1 = write enableddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_0 : 22; /*31:10, Reserveddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
    } bit_field;
} T_DMAC_MASKSRCTRAN_L;

//maskdsttran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               int_mask_dsttran :  2; /* 1: 0, Interrupt Mask0 = masked1 = unmaskeddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_1 :  6; /* 7: 2, Reserveddnc = DMAH_NUM_CHANNELSIf dnc = 8, then this field is not present.Reset Value: 0x0*/
        uint32_t            int_mask_dsttran_we :  2; /* 9: 8, Interrupt Mask Write Enable0 = write disabled1 = write enableddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_0 : 22; /*31:10, Reserveddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
    } bit_field;
} T_DMAC_MASKDSTTRAN_L;

//maskerr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                   int_mask_err :  2; /* 1: 0, Interrupt Mask0 = masked1 = unmaskeddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_1 :  6; /* 7: 2, Reserveddnc = DMAH_NUM_CHANNELSIf dnc = 8, then this field is not present.Reset Value: 0x0*/
        uint32_t                int_mask_err_we :  2; /* 9: 8, Interrupt Mask Write Enable0 = write disabled1 = write enableddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
        uint32_t                     reserved_0 : 22; /*31:10, Reserveddnc = DMAH_NUM_CHANNELSReset Value: 0x0*/
    } bit_field;
} T_DMAC_MASKERR_L;

//cleartfr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      clear_tfr :  2; /* 1: 0,                Interrupt clear*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_CLEARTFR_L;

//clearblock_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    clear_block :  2; /* 1: 0,                Interrupt clear*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_CLEARBLOCK_L;

//clearsrctran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  clear_srctran :  2; /* 1: 0,                Interrupt clear*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_CLEARSRCTRAN_L;

//cleardsttran_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  clear_dsttran :  2; /* 1: 0,                Interrupt clear*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_CLEARDSTTRAN_L;

//clearerr_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                      clear_err :  2; /* 1: 0,                Interrupt clear*/
        uint32_t                     reserved_0 : 30; /*31: 2,                       Reserved*/
    } bit_field;
} T_DMAC_CLEARERR_L;

//statusint_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                            tfr :  1; /* 0: 0, OR of the contents of StatusTfr register.*/
        uint32_t                          block :  1; /* 1: 1, OR of the contents of StatusBlock register.*/
        uint32_t                           srct :  1; /* 2: 2, OR of the contents of StatusSrcTran register.*/
        uint32_t                           dstt :  1; /* 3: 3, OR of the contents of StatusDst register.*/
        uint32_t                            err :  1; /* 4: 4, OR of the contents of StatusErr register.*/
        uint32_t                     reserved_0 : 27; /*31: 5,                       Reserved*/
    } bit_field;
} T_DMAC_STATUSINT_L;

//reqsrcreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        src_req :  2; /* 1: 0,                 Source request*/
        uint32_t                     reserved_1 :  6; /* 7: 2,                       Reserved*/
        uint32_t                     src_req_we :  2; /* 9: 8, Source request write enable0 = write disabled1 = write enabled*/
        uint32_t                     reserved_0 : 22; /*31:10,                       Reserved*/
    } bit_field;
} T_DMAC_REQSRCREG_L;

//reqdstreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        dst_req :  2; /* 1: 0,            Destination request*/
        uint32_t                     reserved_1 :  6; /* 7: 2,                       Reserved*/
        uint32_t                     dst_req_we :  2; /* 9: 8, Destination request write enable0 = write disabled1 = write enabled*/
        uint32_t                     reserved_0 : 22; /*31:10,                       Reserved*/
    } bit_field;
} T_DMAC_REQDSTREG_L;

//sglreqsrcreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     src_sglreq :  2; /* 1: 0,          Source single request*/
        uint32_t                     reserved_1 :  6; /* 7: 2,                       Reserved*/
        uint32_t                  src_sglreq_we :  2; /* 9: 8, Single write enable0 = write disabled1 = write enabled*/
        uint32_t                     reserved_0 : 22; /*31:10,                       Reserved*/
    } bit_field;
} T_DMAC_SGLREQSRCREG_L;

//sglreqdstreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     dst_sglreq :  2; /* 1: 0, Destination single or burst request*/
        uint32_t                     reserved_1 :  6; /* 7: 2,                       Reserved*/
        uint32_t                  dst_sglreq_we :  2; /* 9: 8, Destination write enable0 = write disabled1 = write enabled*/
        uint32_t                     reserved_0 : 22; /*31:10,                       Reserved*/
    } bit_field;
} T_DMAC_SGLREQDSTREG_L;

//lstsrcreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         lstsrc :  2; /* 1: 0, Source last transaction request0 = Not last transaction in current block1 = Last transaction in current block*/
        uint32_t                     reserved_1 :  6; /* 7: 2,                       Reserved*/
        uint32_t                      lstsrc_we :  2; /* 9: 8, Source last transaction request write enable0 = write disabled1 = write enabled*/
        uint32_t                     reserved_0 : 22; /*31:10,                       Reserved*/
    } bit_field;
} T_DMAC_LSTSRCREG_L;

//lstdstreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         lstdst :  2; /* 1: 0, Destination last transaction request0 = Not last transaction in current block1 = Last transaction in current block*/
        uint32_t                     reserved_1 :  6; /* 7: 2,                       Reserved*/
        uint32_t                      lstdst_we :  2; /* 9: 8, Destination last transaction request write enable0 = write disabled1 = write enabled*/
        uint32_t                     reserved_0 : 22; /*31:10,                       Reserved*/
    } bit_field;
} T_DMAC_LSTDSTREG_L;

//dmacfgreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                         dma_en :  1; /* 0: 0, DW_ahb_dmac Enable bit.0 = DW_ahb_dmac Disabled1 = DW_ahb_dmac Enabled.*/
        uint32_t                     reserved_0 : 31; /*31: 1,                       Reserved*/
    } bit_field;
} T_DMAC_DMACFGREG_L;

//chenreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                          ch_en :  2; /* 1: 0, Enables/Disables the channel. Setting this bit enables a channel;clearing this bit disables the channel.0 = Disable the Channel1 = Enable the ChannelThe ChEnReg.CH_EN bit is automatically cleared by hardware todisable the channel after the last AMBA transfer of the DMA transferto the destination has completed. Software can therefore poll this bitto determine when this channel is free for a new DMA transfer.*/
        uint32_t                     reserved_1 :  6; /* 7: 2,                       Reserved*/
        uint32_t                       ch_en_we :  2; /* 9: 8,   Channel enable write enable.*/
        uint32_t                     reserved_0 : 22; /*31:10,                       Reserved*/
    } bit_field;
} T_DMAC_CHENREG_L;

//dmaidreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    dmah_id_num : 32; /*31: 0, Hardcoded DW_ahb_dmac Peripheral ID*/
    } bit_field;
} T_DMAC_DMAIDREG_L;

//dmatestreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                    test_slv_if :  1; /* 0: 0, Puts the AHB slave interface into test mode. In this mode, thereadback value of the writable registers always matches the valuewritten. This bit does not allow writing to read-only registers.0 = Normal mode1 = Test mode*/
        uint32_t                     reserved_0 : 31; /*31: 1,                       Reserved*/
    } bit_field;
} T_DMAC_DMATESTREG_L;

//dma_comp_params_3_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ch2_dtw :  3; /* 2: 0, The value of this register is derived from the DMAH_CH2_DTWcoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = NO_HARDCODE(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                        ch2_stw :  3; /* 5: 3, The value of this register is derived from the DMAH_CH2_STWcoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = NO_HARDCODE(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                   ch2_stat_dst :  1; /* 6: 6, The value of this register is derived from theDMAH_CH2_STAT_DST coreConsultant parameter. For adescription of this parameter, refer to page 132.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                   ch2_stat_src :  1; /* 7: 7, The value of this register is derived from theDMAH_CH2_STAT_SRC coreConsultant parameter. For adescription of this parameter, refer to page 132.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                 ch2_dst_sca_en :  1; /* 8: 8, The value of this register is derived from theDMAH_CH2_DST_SCA_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                 ch2_src_gat_en :  1; /* 9: 9, The value of this register is derived from theDMAH_CH2_SRC_GAT_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                    ch2_lock_en :  1; /*10:10, The value of this register is derived from theDMAH_CH2_LOCK_EN coreConsultant parameter. For adescription of this parameter, refer to page 128.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t               ch2_multi_blk_en :  1; /*11:11, The value of this register is derived from theDMAH_CH2_MULTI_BLK_EN coreConsultant parameter. For adescription of this parameter, refer to page 130.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                  ch2_ctl_wb_en :  1; /*12:12, The value of this register is derived from theDMAH_CH2_CTL_WB_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                     ch2_hc_llp :  1; /*13:13, The value of this register is derived from theDMAH_CH2_HC_LLP coreConsultant parameter. For adescription of this parameter, refer to page 131.0x0 = FALSE0x1 = TRUE(﹟)*/
        uint32_t                         ch2_fc :  2; /*15:14, The value of this register is derived from the DMAH_CH2_FCcoreConsultant parameter. For a description of this parameter,refer to page 128.0x0 = DMA(﹟)0x1 = SRC0x2 = DST0x3 = ANY*/
        uint32_t              ch2_max_mult_size :  3; /*18:16, The value of this register is derived from theDMAH_CH2_MULT_SIZE coreConsultant parameter. For adescription of this parameter, refer to page 127.0x0 = 4(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                        ch2_dms :  3; /*21:19, The value of this register is derived from the DMAH_CH2_DMScoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                        ch2_lms :  3; /*24:22, The value of this register is derived from the DMAH_CH2_LMScoreConsultant parameter. For a description of this parameter,refer to page 132.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                        ch2_sms :  3; /*27:25, The value of this register is derived from the DMAH_CH2_SMScoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                 ch2_fifo_depth :  3; /*30:28, The value of this register is derived from theDMAH_CH2_FIFO_DEPTH coreConsultant parameter. For adescription of this parameter, refer to page 127.0x0 = 80x1 = 16(﹟)0x2 = 320x3 = 640x4 = 128*/
        uint32_t                     reserved_0 :  1; /*31:31,                       Reserved*/
    } bit_field;
} T_DMAC_DMA_COMP_PARAMS_3_L;

//dma_comp_params_3_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ch1_dtw :  3; /* 2: 0, The value of this register is derived from the DMAH_CH1_DTWcoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = NO_HARDCODE(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                        ch1_stw :  3; /* 5: 3, The value of this register is derived from the DMAH_CH1_STWcoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = NO_HARDCODE(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                   ch1_stat_dst :  1; /* 6: 6, The value of this register is derived from theDMAH_CH1_STAT_DST coreConsultant parameter. For adescription of this parameter, refer to page 132.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                   ch1_stat_src :  1; /* 7: 7, The value of this register is derived from theDMAH_CH1_STAT_SRC coreConsultant parameter. For adescription of this parameter, refer to page 132.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                 ch1_dst_sca_en :  1; /* 8: 8, The value of this register is derived from theDMAH_CH1_DST_SCA_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                 ch1_src_gat_en :  1; /* 9: 9, The value of this register is derived from theDMAH_CH1_SRC_GAT_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                    ch1_lock_en :  1; /*10:10, The value of this register is derived from theDMAH_CH1_LOCK_EN coreConsultant parameter. For adescription of this parameter, refer to page 128.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t               ch1_multi_blk_en :  1; /*11:11, The value of this register is derived from theDMAH_CH1_MULTI_BLK_EN coreConsultant parameter. For adescription of this parameter, refer to page 130.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                  ch1_ctl_wb_en :  1; /*12:12, The value of this register is derived from theDMAH_CH1_CTL_WB_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                     ch1_hc_llp :  1; /*13:13, The value of this register is derived from theDMAH_CH1_HC_LLP coreConsultant parameter. For adescription of this parameter, refer to page 131.0x0 = FALSE0x1 = TRUE(﹟)*/
        uint32_t                         ch1_fc :  2; /*15:14, The value of this register is derived from the DMAH_CH1_FCcoreConsultant parameter. For a description of this parameter,refer to page 128.0x0 = DMA(﹟)0x1 = SRC0x2 = DST0x3 = ANY*/
        uint32_t              ch1_max_mult_size :  3; /*18:16, The value of this register is derived from theDMAH_CH1_MULT_SIZE coreConsultant parameter. For adescription of this parameter, refer to page 127.0x0 = 4(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                     ch1_dms_ro :  3; /*21:19, The value of this register is derived from the DMAH_CH1_DMScoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                        ch1_lms :  3; /*24:22, The value of this register is derived from the DMAH_CH1_LMScoreConsultant parameter. For a description of this parameter,refer to page 132.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                     ch1_sms_ro :  3; /*27:25, The value of this register is derived from the DMAH_CH1_SMScoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                 ch1_fifo_depth :  3; /*30:28, The value of this register is derived from theDMAH_CH1_FIFO_DEPTH coreConsultant parameter. For adescription of this parameter, refer to page 127.0x0 = 80x1 = 16(﹟)0x2 = 320x3 = 640x4 = 128*/
        uint32_t                     reserved_0 :  1; /*31:31,                       Reserved*/
    } bit_field;
} T_DMAC_DMA_COMP_PARAMS_3_H;

//dma_comp_params_2_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                        ch0_dtw :  3; /* 2: 0, The value of this register is derived from the DMAH_CH0_DTWcoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = NO_HARDCODE(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                        ch0_stw :  3; /* 5: 3, The value of this register is derived from the DMAH_CH0_STWcoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = NO_HARDCODE(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                   ch0_stat_dst :  1; /* 6: 6, The value of this register is derived from theDMAH_CH0_STAT_DST coreConsultant parameter. For adescription of this parameter, refer to page 132.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                   ch0_stat_src :  1; /* 7: 7, The value of this register is derived from theDMAH_CH0_STAT_SRC coreConsultant parameter. For adescription of this parameter, refer to page 132.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                 ch0_dst_sca_en :  1; /* 8: 8, The value of this register is derived from theDMAH_CH0_DST_SCA_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                 ch0_src_gat_en :  1; /* 9: 9, The value of this register is derived from theDMAH_CH0_SRC_GAT_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                    ch0_lock_en :  1; /*10:10, The value of this register is derived from theDMAH_CH0_LOCK_EN coreConsultant parameter. For adescription of this parameter, refer to page 128.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t               ch0_multi_blk_en :  1; /*11:11, The value of this register is derived from theDMAH_CH0_MULTI_BLK_EN coreConsultant parameter. For adescription of this parameter, refer to page 130.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                  ch0_ctl_wb_en :  1; /*12:12, The value of this register is derived from theDMAH_CH0_CTL_WB_EN coreConsultant parameter. For adescription of this parameter, refer to page 133.0x0 = FALSE(﹟)0x1 = TRUE*/
        uint32_t                     ch0_hc_llp :  1; /*13:13, The value of this register is derived from theDMAH_CH0_HC_LLP coreConsultant parameter. For adescription of this parameter, refer to page 131.0x0 = FALSE0x1 = TRUE(﹟)*/
        uint32_t                         ch0_fc :  2; /*15:14, The value of this register is derived from the DMAH_CH0_FCcoreConsultant parameter. For a description of this parameter,refer to page 128.0x0 = DMA(﹟)0x1 = SRC0x2 = DST0x3 = ANY*/
        uint32_t              ch0_max_mult_size :  3; /*18:16, The value of this register is derived from theDMAH_CH0_MULT_SIZE coreConsultant parameter. For adescription of this parameter, refer to page 127.0x0 = 4(﹟)0x1 = 80x2 = 160x3 = 320x4 = 640x5 = 1280x6 = 2560x7 = reserved*/
        uint32_t                     ch0_dms_ro :  3; /*21:19, The value of this register is derived from the DMAH_CH0_DMScoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                        ch0_lms :  3; /*24:22, The value of this register is derived from the DMAH_CH0_LMScoreConsultant parameter. For a description of this parameter,refer to page 132.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                     ch0_sms_ro :  3; /*27:25, The value of this register is derived from the DMAH_CH0_SMScoreConsultant parameter. For a description of this parameter,refer to page 129.0x0 = MASTER_1(﹟)0x1 = MASTER_20x2 = MASTER_30x3 = MASTER_40x4 = NO_HARDCODE*/
        uint32_t                 ch0_fifo_depth :  3; /*30:28, The value of this register is derived from theDMAH_CH0_FIFO_DEPTH coreConsultant parameter. For adescription of this parameter, refer to page 127.0x0 = 80x1 = 16(﹟)0x2 = 320x3 = 640x4 = 128*/
        uint32_t                     reserved_0 :  1; /*31:31,                       Reserved*/
    } bit_field;
} T_DMAC_DMA_COMP_PARAMS_2_L;

//dma_comp_params_2_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t             ch0_multi_blk_type :  4; /* 3: 0,                  Same as above*/
        uint32_t             ch1_multi_blk_type :  4; /* 7: 4,                  Same as above*/
        uint32_t             ch2_multi_blk_type :  4; /*11: 8,                  Same as above*/
        uint32_t             ch3_multi_blk_type :  4; /*15:12,                  Same as above*/
        uint32_t             ch4_multi_blk_type :  4; /*19:16,                  Same as above*/
        uint32_t             ch5_multi_blk_type :  4; /*23:20,                  Same as above*/
        uint32_t             ch6_multi_blk_type :  4; /*27:24,                  Same as above*/
        uint32_t             ch7_multi_blk_type :  4; /*31:28, The values of these bit fields are derived from theDMAH_CHx_MULTI_BLK_TYPE coreConsultant parameter. For adescription of these parameters, refer to page 131.0x0 = NO_HARDCODE(﹟)0x1 = CONT_RELOAD0x2 = RELOAD_CONT0x3 = RELOAD_RELOAD0x4 = CONT_LLP0x5 = RELOAD_LLP0x6 = LLP_CONT0x7 = LLP_RELOAD0x8 = LLP_LLP*/
    } bit_field;
} T_DMAC_DMA_COMP_PARAMS_2_H;

//dma_comp_params_1_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               ch0_max_blk_size :  4; /* 3: 0,                  Same as above*/
        uint32_t               ch1_max_blk_size :  4; /* 7: 4,                  Same as above*/
        uint32_t               ch2_max_blk_size :  4; /*11: 8,                  Same as above*/
        uint32_t               ch3_max_blk_size :  4; /*15:12,                  Same as above*/
        uint32_t               ch4_max_blk_size :  4; /*19:16,                  Same as above*/
        uint32_t               ch5_max_blk_size :  4; /*23:20, The values of these bit fields are derived from theDMAH_CHx_MAX_BLK_SIZE coreConsultant parameter. Fora description of these parameters, refer to page 128.0x0 = 30x1 = 70x2 =150x3 = 310x4 = 630x5 = 1270x6 = 255(﹟)0x7 = 5110x8 = 10230x9 = 20470xa = 4095*/
        uint32_t               ch6_max_blk_size :  4; /*27:24,                  Same as above*/
        uint32_t               ch7_max_blk_size :  4; /*31:28, The values of these bit fields are derived from theDMAH_CHx_MAX_BLK_SIZE coreConsultant parameter. Fora description of these parameters, refer to page 128.0x0 = 30x1 = 70x2 =150x3 = 31(﹟)0x4 = 630x5 = 1270x6 = 2550x7 = 5110x8 = 10230x9 = 20470xa = 4095*/
    } bit_field;
} T_DMAC_DMA_COMP_PARAMS_1_L;

//dma_comp_params_1_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                     big_endian :  1; /* 0: 0, The value of this register is derived from theDMAH_BIG_ENDIAN coreConsultant parameter. For adescription of this parameter, refer to page 124.0 = FALSE(﹟)1 = TRUE*/
        uint32_t                        intr_io :  2; /* 2: 1, The value of this register is derived from the DMAH_INTR_IOcoreConsultant parameter. For a description of this parameter,refer to page 121.0x0 = ALL0x1 = TYPE0x2 = COMBINED(﹟)0x3 = reserved*/
        uint32_t                         mabrst :  1; /* 3: 3, The value of this register is derived from the DMAH_MABRSTcoreConsultant parameter. For a description of this parameter,refer to page 121.0 = FALSE1 = TRUE(﹟)*/
        uint32_t                     reserved_1 :  4; /* 7: 4,                       Reserved*/
        uint32_t                   num_channels :  3; /*10: 8, The value of this register is derived from theDMAH_NUM_CHANNELS coreConsultant parameter. For adescription of this parameter, refer to page 120.0x0 = 1to0x7 = 8*/
        uint32_t              number_master_int :  2; /*12:11, The value of this register is derived from theDMAH_NUM_MASTER_INT coreConsultant parameter. For adescription of this parameter, refer to page 120.0x0 = 1(﹟)to0x3 = 4*/
        uint32_t                  s_hdata_width :  2; /*14:13, The value of this register is derived from theDMAH_S_HDATA_WIDTH coreConsultant parameter. For adescription of this parameter, refer to page 126.0x0 = 32 bits(﹟)0x1 = 64 bits0x2 = 128 bits0x3 = 256 bits*/
        uint32_t                 m4_hdata_width :  2; /*16:15, The value of this register is derived from theDMAH_M4_HDATA_WIDTH coreConsultant parameter. For adescription of this parameter, refer to page 126.0x0 = 32 bits(﹟)0x1 = 64 bits0x2 = 128 bits0x3 = 256 bits*/
        uint32_t                 m3_hdata_width :  2; /*18:17, The value of this register is derived from theDMAH_M3_HDATA_WIDTH coreConsultant parameter. For adescription of this parameter, refer to page 126.0x0 = 32 bits(﹟)0x1 = 64 bits0x2 = 128 bits0x3 = 256 bits*/
        uint32_t                 m2_hdata_width :  2; /*20:19, The value of this register is derived from theDMAH_M2_HDATA_WIDTH coreConsultant parameter. For adescription of this parameter, refer to page 126.0x0 = 32 bits(﹟)0x1 = 64 bits0x2 = 128 bits0x3 = 256 bits*/
        uint32_t                 m1_hdata_width :  2; /*22:21, The value of this register is derived from theDMAH_M1_HDATA_WIDTH coreConsultant parameter. For adescription of this parameter, refer to page 126.0x0 = 32 bits(﹟)0x1 = 64 bits0x2 = 128 bits0x3 = 256 bits*/
        uint32_t                     num_hs_int :  5; /*27:23, The value of this register is derived from theDMAH_NUM_HS_INT coreConsultant parameter. For adescription of this parameter, refer to page 120.0x00 = 0to0x10 = 16(﹟)*/
        uint32_t             add_encoded_params :  1; /*28:28, The value of this register is derived from theDMAH_ADD_ENCODED_PARAMS coreConsultant parameter.For a description of this parameter, refer to page 122.0 = FALSE1 = TRUE(﹟)*/
        uint32_t           static_endian_select :  1; /*29:29, The value of this register is derived from theDMAH_STATIC_ENDIAN_SELECT coreConsultant parameter.For a description of this parameter, refer to page 123.0 = FALSE1 = TRUE(﹟)*/
        uint32_t                     reserved_0 :  2; /*31:30,                       Reserved*/
    } bit_field;
} T_DMAC_DMA_COMP_PARAMS_1_H;

//dmacompidreg_l
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t                  dma_comp_type : 32; /*31: 0, Designware Component Type number= 0x44_57_11_10. This assignedunique hex value is constant and isderived from the two ASCII letters※DW§ followed by a 32-bit unsignednumber.*/
    } bit_field;
} T_DMAC_DMACOMPIDREG_L;

//dmacompidreg_h
typedef union
{
    uint32_t val;
    struct
    {
        uint32_t               dma_comp_version : 32; /*31: 0,      Version of the component.*/
    } bit_field;
} T_DMAC_DMACOMPIDREG_H;

//Registers Mapping to the same address

typedef struct
{
    volatile                T_DMAC_CH0_SAR_L                      ch0_sar_l; /*  0x0,    RW, 0x00000000, channel 0 register source address Register*/
    volatile                        uint32_t                     reserved_0;
    volatile                T_DMAC_CH0_DAR_L                      ch0_dar_l; /*  0x8,    RW, 0x00000000, channel 0 register destination address Register*/
    volatile                        uint32_t                  reserved_1[3];
    volatile               T_DMAC_CH0_CTRL_L                     ch0_ctrl_l; /* 0x18,    RW, 0x00304801,     Channel 0 Control Register*/
    volatile               T_DMAC_CH0_CTRL_H                     ch0_ctrl_h; /* 0x1c,    RW, 0x00000002,     Channel 0 Control Register*/
    volatile                        uint32_t                  reserved_2[8];
    volatile                T_DMAC_CH0_CFG_L                      ch0_cfg_l; /* 0x40,    RW, 0x00000E00, channel 0 configuration register*/
    volatile                T_DMAC_CH0_CFG_H                      ch0_cfg_h; /* 0x44,    RW, 0x00000004, channel 0 configuration register*/
    volatile                        uint32_t                  reserved_3[4];
    volatile                T_DMAC_CH1_SAR_L                      ch1_sar_l; /* 0x58,    RW, 0x00000000, channel 0 register source address Register*/
    volatile                        uint32_t                     reserved_4;
    volatile                T_DMAC_CH1_DAR_L                      ch1_dar_l; /* 0x60,    RW, 0x00000000, channel 0 register destination address Register*/
    volatile                        uint32_t                  reserved_5[3];
    volatile               T_DMAC_CH1_CTRL_L                     ch1_ctrl_l; /* 0x70,    RW, 0x00304801,     Channel 0 Control Register*/
    volatile               T_DMAC_CH1_CTRL_H                     ch1_ctrl_h; /* 0x74,    RW, 0x00000002,     Channel 0 Control Register*/
    volatile                        uint32_t                  reserved_6[8];
    volatile                T_DMAC_CH1_CFG_L                      ch1_cfg_l; /* 0x98,    RW, 0x00000E00, channel 0 configuration register*/
    volatile                T_DMAC_CH1_CFG_H                      ch1_cfg_h; /* 0x9c,    RW, 0x00000004, channel 0 configuration register*/
    volatile                        uint32_t                reserved_7[136];
    volatile                 T_DMAC_RAWTFR_L                       rawtfr_l; /*0x2c0,    RW, 0x00000000, Interrupt Raw Status Registers*/
    volatile                        uint32_t                     reserved_8;
    volatile               T_DMAC_RAWBLOCK_L                     rawblock_l; /*0x2c8,    RW, 0x00000000, Interrupt Raw Status Registers*/
    volatile                        uint32_t                     reserved_9;
    volatile             T_DMAC_RAWSRCTRAN_L                   rawsrctran_l; /*0x2d0,    RW, 0x00000000, Interrupt Raw Status Registers*/
    volatile                        uint32_t                    reserved_10;
    volatile             T_DMAC_RAWDSTTRAN_L                   rawdsttran_l; /*0x2d8,    RW, 0x00000000, Interrupt Raw Status Registers*/
    volatile                        uint32_t                    reserved_11;
    volatile                 T_DMAC_RAWERR_L                       rawerr_l; /*0x2e0,    RW, 0x00000000, Interrupt Raw Status Registers*/
    volatile                        uint32_t                    reserved_12;
    volatile              T_DMAC_STATUSTFR_L                    statustfr_l; /*0x2e8,    RO, 0x00000000,     Interrupt Status Registers*/
    volatile                        uint32_t                    reserved_13;
    volatile            T_DMAC_STATUSBLOCK_L                  statusblock_l; /*0x2f0,    RO, 0x00000000,     Interrupt Status Registers*/
    volatile                        uint32_t                    reserved_14;
    volatile          T_DMAC_STATUSSRCTRAN_L                statussrctran_l; /*0x2f8,    RO, 0x00000000,     Interrupt Status Registers*/
    volatile                        uint32_t                    reserved_15;
    volatile          T_DMAC_STATUSDSTTRAN_L                statusdsttran_l; /*0x300,    RO, 0x00000000,     Interrupt Status Registers*/
    volatile                        uint32_t                    reserved_16;
    volatile              T_DMAC_STATUSERR_L                    statuserr_l; /*0x308,    RO, 0x00000000,     Interrupt Status Registers*/
    volatile                        uint32_t                    reserved_17;
    volatile                T_DMAC_MASKTFR_L                      masktfr_l; /*0x310,    RW, 0x00000000,       Interrupt Mask Registers*/
    volatile                        uint32_t                    reserved_18;
    volatile              T_DMAC_MASKBLOCK_L                    maskblock_l; /*0x318,    RW, 0x00000000,       Interrupt Mask Registers*/
    volatile                        uint32_t                    reserved_19;
    volatile            T_DMAC_MASKSRCTRAN_L                  masksrctran_l; /*0x320,    RW, 0x00000000,       Interrupt Mask Registers*/
    volatile                        uint32_t                    reserved_20;
    volatile            T_DMAC_MASKDSTTRAN_L                  maskdsttran_l; /*0x328,    RW, 0x00000000,       Interrupt Mask Registers*/
    volatile                        uint32_t                    reserved_21;
    volatile                T_DMAC_MASKERR_L                      maskerr_l; /*0x330,    RW, 0x00000000,       Interrupt Mask Registers*/
    volatile                        uint32_t                    reserved_22;
    volatile               T_DMAC_CLEARTFR_L                     cleartfr_l; /*0x338,    RW, 0x00000000,      Interrupt clear Registers*/
    volatile                        uint32_t                    reserved_23;
    volatile             T_DMAC_CLEARBLOCK_L                   clearblock_l; /*0x340,    RW, 0x00000000,      Interrupt clear Registers*/
    volatile                        uint32_t                    reserved_24;
    volatile           T_DMAC_CLEARSRCTRAN_L                 clearsrctran_l; /*0x348,    RW, 0x00000000,      Interrupt clear Registers*/
    volatile                        uint32_t                    reserved_25;
    volatile           T_DMAC_CLEARDSTTRAN_L                 cleardsttran_l; /*0x350,    RW, 0x00000000,      Interrupt clear Registers*/
    volatile                        uint32_t                    reserved_26;
    volatile               T_DMAC_CLEARERR_L                     clearerr_l; /*0x358,    RW, 0x00000000,      Interrupt clear Registers*/
    volatile                        uint32_t                    reserved_27;
    volatile              T_DMAC_STATUSINT_L                    statusint_l; /*0x360,    RO, 0x00000000, Combined Interrupt Status Register*/
    volatile                        uint32_t                    reserved_28;
    volatile              T_DMAC_REQSRCREG_L                    reqsrcreg_l; /*0x368,    RW, 0x00000000, Source Software Transaction Request Register*/
    volatile                        uint32_t                    reserved_29;
    volatile              T_DMAC_REQDSTREG_L                    reqdstreg_l; /*0x370,    RW, 0x00000000, Destination Software Transaction Request Register*/
    volatile                        uint32_t                    reserved_30;
    volatile           T_DMAC_SGLREQSRCREG_L                 sglreqsrcreg_l; /*0x378,    RW, 0x00000000, Single Source Transaction Request Register*/
    volatile                        uint32_t                    reserved_31;
    volatile           T_DMAC_SGLREQDSTREG_L                 sglreqdstreg_l; /*0x380,    RW, 0x00000000, Single Destination Transaction Request Register*/
    volatile                        uint32_t                    reserved_32;
    volatile              T_DMAC_LSTSRCREG_L                    lstsrcreg_l; /*0x388,    RW, 0x00000000, Last Source Transaction Request Register*/
    volatile                        uint32_t                    reserved_33;
    volatile              T_DMAC_LSTDSTREG_L                    lstdstreg_l; /*0x390,    RW, 0x00000000, Last Destination Transaction Request Register*/
    volatile                        uint32_t                    reserved_34;
    volatile              T_DMAC_DMACFGREG_L                    dmacfgreg_l; /*0x398,    RW, 0x00000000, DW_ahb_dmac Configuration Register*/
    volatile                        uint32_t                    reserved_35;
    volatile                T_DMAC_CHENREG_L                      chenreg_l; /*0x3a0,    RW, 0x00000000, DW_ahb_dmac Channel Enable Register*/
    volatile                        uint32_t                    reserved_36;
    volatile               T_DMAC_DMAIDREG_L                     dmaidreg_l; /*0x3a8,    RO, 0x0000F100,        DW_ahb_dmac ID Register*/
    volatile                        uint32_t                    reserved_37;
    volatile             T_DMAC_DMATESTREG_L                   dmatestreg_l; /*0x3b0,    RW, 0x00000000,      DW_ahb_dmac Test Register*/
    volatile                        uint32_t                reserved_38[11];
    volatile      T_DMAC_DMA_COMP_PARAMS_3_L            dma_comp_params_3_l; /*0x3e0,    RO, 0x00000000, DW_ahb_dmac Component Parameters Register 3*/
    volatile      T_DMAC_DMA_COMP_PARAMS_3_H            dma_comp_params_3_h; /*0x3e4,    RO, 0x130B2000, DW_ahb_dmac Component Parameters Register 3*/
    volatile      T_DMAC_DMA_COMP_PARAMS_2_L            dma_comp_params_2_l; /*0x3e8,    RO, 0x11032000, DW_ahb_dmac Component Parameters Register 2*/
    volatile      T_DMAC_DMA_COMP_PARAMS_2_H            dma_comp_params_2_h; /*0x3ec,    RO, 0x00000000, DW_ahb_dmac Component Parameters Register 2*/
    volatile      T_DMAC_DMA_COMP_PARAMS_1_L            dma_comp_params_1_l; /*0x3f0,    RO, 0x333333AA, DW_ahb_dmac Component Parameters Register 1*/
    volatile      T_DMAC_DMA_COMP_PARAMS_1_H            dma_comp_params_1_h; /*0x3f4,    RO, 0x3680090C, DW_ahb_dmac Component Parameters Register 1*/
    volatile           T_DMAC_DMACOMPIDREG_L                 dmacompidreg_l; /*0x3f8,    RO, 0x44571110,        DW_ahb_dmac ID Register*/
    volatile           T_DMAC_DMACOMPIDREG_H                 dmacompidreg_h; /*0x3fc,    RO, 0x3232302A,        DW_ahb_dmac ID Register*/
} T_HWP_DMAC_T;

#define hwp_dmac ((T_HWP_DMAC_T*)REG_DMAC_BASE)


__STATIC_INLINE uint32_t dmac_ch0_sar_l_get(void)
{
    return hwp_dmac->ch0_sar_l.val;
}

__STATIC_INLINE void dmac_ch0_sar_l_set(uint32_t value)
{
    hwp_dmac->ch0_sar_l.val = value;
}

__STATIC_INLINE void dmac_ch0_sar_l_pack(uint32_t ch0_sar)
{
    hwp_dmac->ch0_sar_l.val = (((uint32_t)ch0_sar << 0));
}

__STATIC_INLINE void dmac_ch0_sar_l_unpack(uint32_t* ch0_sar)
{
    T_DMAC_CH0_SAR_L localVal = hwp_dmac->ch0_sar_l;

    *ch0_sar = localVal.bit_field.ch0_sar;
}

__STATIC_INLINE uint32_t dmac_ch0_sar_getf(void)
{
    return hwp_dmac->ch0_sar_l.bit_field.ch0_sar;
}

__STATIC_INLINE void dmac_ch0_sar_setf(uint32_t ch0_sar)
{
    hwp_dmac->ch0_sar_l.bit_field.ch0_sar = ch0_sar;
}

__STATIC_INLINE uint32_t dmac_ch0_dar_l_get(void)
{
    return hwp_dmac->ch0_dar_l.val;
}

__STATIC_INLINE void dmac_ch0_dar_l_set(uint32_t value)
{
    hwp_dmac->ch0_dar_l.val = value;
}

__STATIC_INLINE void dmac_ch0_dar_l_pack(uint32_t ch0_dar)
{
    hwp_dmac->ch0_dar_l.val = (((uint32_t)ch0_dar << 0));
}

__STATIC_INLINE void dmac_ch0_dar_l_unpack(uint32_t* ch0_dar)
{
    T_DMAC_CH0_DAR_L localVal = hwp_dmac->ch0_dar_l;

    *ch0_dar = localVal.bit_field.ch0_dar;
}

__STATIC_INLINE uint32_t dmac_ch0_dar_getf(void)
{
    return hwp_dmac->ch0_dar_l.bit_field.ch0_dar;
}

__STATIC_INLINE void dmac_ch0_dar_setf(uint32_t ch0_dar)
{
    hwp_dmac->ch0_dar_l.bit_field.ch0_dar = ch0_dar;
}

__STATIC_INLINE uint32_t dmac_ch0_ctrl_l_get(void)
{
    return hwp_dmac->ch0_ctrl_l.val;
}

__STATIC_INLINE void dmac_ch0_ctrl_l_set(uint32_t value)
{
    hwp_dmac->ch0_ctrl_l.val = value;
}

__STATIC_INLINE void dmac_ch0_ctrl_l_pack(uint8_t ch0_tt_fc, uint8_t ch0_src_msize, uint8_t ch0_dest_msize, uint8_t ch0_sinc, uint8_t ch0_dinc, uint8_t ch0_src_tr_width, uint8_t ch0_dst_tr_width, uint8_t ch0_int_en)
{
    hwp_dmac->ch0_ctrl_l.val = (((uint32_t)ch0_tt_fc << 20) | ((uint32_t)ch0_src_msize << 14) | ((uint32_t)ch0_dest_msize << 11) | ((uint32_t)ch0_sinc << 9) | ((uint32_t)ch0_dinc << 7) | ((uint32_t)ch0_src_tr_width << 4) | ((uint32_t)ch0_dst_tr_width << 1) | ((uint32_t)ch0_int_en << 0));
}

__STATIC_INLINE void dmac_ch0_ctrl_l_unpack(uint8_t* ch0_llp_src_en, uint8_t* ch0_llp_dst_en, uint8_t* ch0_sms, uint8_t* ch0_dms, uint8_t* ch0_tt_fc, uint8_t* ch0_dst_scatter_en, uint8_t* ch0_src_gather_en, uint8_t* ch0_src_msize, uint8_t* ch0_dest_msize, uint8_t* ch0_sinc, uint8_t* ch0_dinc, uint8_t* ch0_src_tr_width, uint8_t* ch0_dst_tr_width, uint8_t* ch0_int_en)
{
    T_DMAC_CH0_CTRL_L localVal = hwp_dmac->ch0_ctrl_l;

    *ch0_llp_src_en = localVal.bit_field.ch0_llp_src_en;
    *ch0_llp_dst_en = localVal.bit_field.ch0_llp_dst_en;
    *ch0_sms = localVal.bit_field.ch0_sms;
    *ch0_dms = localVal.bit_field.ch0_dms;
    *ch0_tt_fc = localVal.bit_field.ch0_tt_fc;
    *ch0_dst_scatter_en = localVal.bit_field.ch0_dst_scatter_en;
    *ch0_src_gather_en = localVal.bit_field.ch0_src_gather_en;
    *ch0_src_msize = localVal.bit_field.ch0_src_msize;
    *ch0_dest_msize = localVal.bit_field.ch0_dest_msize;
    *ch0_sinc = localVal.bit_field.ch0_sinc;
    *ch0_dinc = localVal.bit_field.ch0_dinc;
    *ch0_src_tr_width = localVal.bit_field.ch0_src_tr_width;
    *ch0_dst_tr_width = localVal.bit_field.ch0_dst_tr_width;
    *ch0_int_en = localVal.bit_field.ch0_int_en;
}

__STATIC_INLINE uint8_t dmac_ch0_llp_src_en_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_llp_src_en;
}

__STATIC_INLINE uint8_t dmac_ch0_llp_dst_en_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_llp_dst_en;
}

__STATIC_INLINE uint8_t dmac_ch0_sms_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_sms;
}

__STATIC_INLINE uint8_t dmac_ch0_dms_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_dms;
}

__STATIC_INLINE uint8_t dmac_ch0_tt_fc_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_tt_fc;
}

__STATIC_INLINE void dmac_ch0_tt_fc_setf(uint8_t ch0_tt_fc)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_tt_fc = ch0_tt_fc;
}

__STATIC_INLINE uint8_t dmac_ch0_dst_scatter_en_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_dst_scatter_en;
}

__STATIC_INLINE uint8_t dmac_ch0_src_gather_en_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_src_gather_en;
}

__STATIC_INLINE uint8_t dmac_ch0_src_msize_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_src_msize;
}

__STATIC_INLINE void dmac_ch0_src_msize_setf(uint8_t ch0_src_msize)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_src_msize = ch0_src_msize;
}

__STATIC_INLINE uint8_t dmac_ch0_dest_msize_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_dest_msize;
}

__STATIC_INLINE void dmac_ch0_dest_msize_setf(uint8_t ch0_dest_msize)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_dest_msize = ch0_dest_msize;
}

__STATIC_INLINE uint8_t dmac_ch0_sinc_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_sinc;
}

__STATIC_INLINE void dmac_ch0_sinc_setf(uint8_t ch0_sinc)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_sinc = ch0_sinc;
}

__STATIC_INLINE uint8_t dmac_ch0_dinc_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_dinc;
}

__STATIC_INLINE void dmac_ch0_dinc_setf(uint8_t ch0_dinc)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_dinc = ch0_dinc;
}

__STATIC_INLINE uint8_t dmac_ch0_src_tr_width_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_src_tr_width;
}

__STATIC_INLINE void dmac_ch0_src_tr_width_setf(uint8_t ch0_src_tr_width)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_src_tr_width = ch0_src_tr_width;
}

__STATIC_INLINE uint8_t dmac_ch0_dst_tr_width_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_dst_tr_width;
}

__STATIC_INLINE void dmac_ch0_dst_tr_width_setf(uint8_t ch0_dst_tr_width)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_dst_tr_width = ch0_dst_tr_width;
}

__STATIC_INLINE uint8_t dmac_ch0_int_en_getf(void)
{
    return hwp_dmac->ch0_ctrl_l.bit_field.ch0_int_en;
}

__STATIC_INLINE void dmac_ch0_int_en_setf(uint8_t ch0_int_en)
{
    hwp_dmac->ch0_ctrl_l.bit_field.ch0_int_en = ch0_int_en;
}

__STATIC_INLINE uint32_t dmac_ch0_ctrl_h_get(void)
{
    return hwp_dmac->ch0_ctrl_h.val;
}

__STATIC_INLINE void dmac_ch0_ctrl_h_set(uint32_t value)
{
    hwp_dmac->ch0_ctrl_h.val = value;
}

__STATIC_INLINE void dmac_ch0_ctrl_h_pack(uint8_t ch0_done, uint16_t ch0_block_ts)
{
    hwp_dmac->ch0_ctrl_h.val = (((uint32_t)ch0_done << 12) | ((uint32_t)ch0_block_ts << 0));
}

__STATIC_INLINE void dmac_ch0_ctrl_h_unpack(uint8_t* ch0_done, uint16_t* ch0_block_ts)
{
    T_DMAC_CH0_CTRL_H localVal = hwp_dmac->ch0_ctrl_h;

    *ch0_done = localVal.bit_field.ch0_done;
    *ch0_block_ts = localVal.bit_field.ch0_block_ts;
}

__STATIC_INLINE uint8_t dmac_ch0_done_getf(void)
{
    return hwp_dmac->ch0_ctrl_h.bit_field.ch0_done;
}

__STATIC_INLINE void dmac_ch0_done_setf(uint8_t ch0_done)
{
    hwp_dmac->ch0_ctrl_h.bit_field.ch0_done = ch0_done;
}

__STATIC_INLINE uint16_t dmac_ch0_block_ts_getf(void)
{
    return hwp_dmac->ch0_ctrl_h.bit_field.ch0_block_ts;
}

__STATIC_INLINE void dmac_ch0_block_ts_setf(uint16_t ch0_block_ts)
{
    hwp_dmac->ch0_ctrl_h.bit_field.ch0_block_ts = ch0_block_ts;
}

__STATIC_INLINE uint32_t dmac_ch0_cfg_l_get(void)
{
    return hwp_dmac->ch0_cfg_l.val;
}

__STATIC_INLINE void dmac_ch0_cfg_l_set(uint32_t value)
{
    hwp_dmac->ch0_cfg_l.val = value;
}

__STATIC_INLINE void dmac_ch0_cfg_l_pack(uint16_t ch0_max_abrst, uint8_t ch0_src_hs_pol, uint8_t ch0_dst_hs_pol, uint8_t ch0_hs_sel_src, uint8_t ch0_hs_sel_dst, uint8_t ch0_ch_susp, uint8_t ch0_ch_prior)
{
    hwp_dmac->ch0_cfg_l.val = (((uint32_t)ch0_max_abrst << 20) | ((uint32_t)ch0_src_hs_pol << 19) | ((uint32_t)ch0_dst_hs_pol << 18) | ((uint32_t)ch0_hs_sel_src << 11) | ((uint32_t)ch0_hs_sel_dst << 10) | ((uint32_t)ch0_ch_susp << 8) | ((uint32_t)ch0_ch_prior << 5));
}

__STATIC_INLINE void dmac_ch0_cfg_l_unpack(uint8_t* ch0_reload_dst, uint8_t* ch0_reload_src, uint16_t* ch0_max_abrst, uint8_t* ch0_src_hs_pol, uint8_t* ch0_dst_hs_pol, uint8_t* ch0_lock_b, uint8_t* ch0_lock_ch, uint8_t* ch0_lock_b_l, uint8_t* ch0_lock_ch_l, uint8_t* ch0_hs_sel_src, uint8_t* ch0_hs_sel_dst, uint8_t* ch0_fifo_empty, uint8_t* ch0_ch_susp, uint8_t* ch0_ch_prior)
{
    T_DMAC_CH0_CFG_L localVal = hwp_dmac->ch0_cfg_l;

    *ch0_reload_dst = localVal.bit_field.ch0_reload_dst;
    *ch0_reload_src = localVal.bit_field.ch0_reload_src;
    *ch0_max_abrst = localVal.bit_field.ch0_max_abrst;
    *ch0_src_hs_pol = localVal.bit_field.ch0_src_hs_pol;
    *ch0_dst_hs_pol = localVal.bit_field.ch0_dst_hs_pol;
    *ch0_lock_b = localVal.bit_field.ch0_lock_b;
    *ch0_lock_ch = localVal.bit_field.ch0_lock_ch;
    *ch0_lock_b_l = localVal.bit_field.ch0_lock_b_l;
    *ch0_lock_ch_l = localVal.bit_field.ch0_lock_ch_l;
    *ch0_hs_sel_src = localVal.bit_field.ch0_hs_sel_src;
    *ch0_hs_sel_dst = localVal.bit_field.ch0_hs_sel_dst;
    *ch0_fifo_empty = localVal.bit_field.ch0_fifo_empty;
    *ch0_ch_susp = localVal.bit_field.ch0_ch_susp;
    *ch0_ch_prior = localVal.bit_field.ch0_ch_prior;
}

__STATIC_INLINE uint8_t dmac_ch0_reload_dst_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_reload_dst;
}

__STATIC_INLINE uint8_t dmac_ch0_reload_src_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_reload_src;
}

__STATIC_INLINE uint16_t dmac_ch0_max_abrst_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_max_abrst;
}

__STATIC_INLINE void dmac_ch0_max_abrst_setf(uint16_t ch0_max_abrst)
{
    hwp_dmac->ch0_cfg_l.bit_field.ch0_max_abrst = ch0_max_abrst;
}

__STATIC_INLINE uint8_t dmac_ch0_src_hs_pol_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_src_hs_pol;
}

__STATIC_INLINE void dmac_ch0_src_hs_pol_setf(uint8_t ch0_src_hs_pol)
{
    hwp_dmac->ch0_cfg_l.bit_field.ch0_src_hs_pol = ch0_src_hs_pol;
}

__STATIC_INLINE uint8_t dmac_ch0_dst_hs_pol_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_dst_hs_pol;
}

__STATIC_INLINE void dmac_ch0_dst_hs_pol_setf(uint8_t ch0_dst_hs_pol)
{
    hwp_dmac->ch0_cfg_l.bit_field.ch0_dst_hs_pol = ch0_dst_hs_pol;
}

__STATIC_INLINE uint8_t dmac_ch0_lock_b_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_lock_b;
}

__STATIC_INLINE uint8_t dmac_ch0_lock_ch_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_lock_ch;
}

__STATIC_INLINE uint8_t dmac_ch0_lock_b_l_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_lock_b_l;
}

__STATIC_INLINE uint8_t dmac_ch0_lock_ch_l_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_lock_ch_l;
}

__STATIC_INLINE uint8_t dmac_ch0_hs_sel_src_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_hs_sel_src;
}

__STATIC_INLINE void dmac_ch0_hs_sel_src_setf(uint8_t ch0_hs_sel_src)
{
    hwp_dmac->ch0_cfg_l.bit_field.ch0_hs_sel_src = ch0_hs_sel_src;
}

__STATIC_INLINE uint8_t dmac_ch0_hs_sel_dst_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_hs_sel_dst;
}

__STATIC_INLINE void dmac_ch0_hs_sel_dst_setf(uint8_t ch0_hs_sel_dst)
{
    hwp_dmac->ch0_cfg_l.bit_field.ch0_hs_sel_dst = ch0_hs_sel_dst;
}

__STATIC_INLINE uint8_t dmac_ch0_fifo_empty_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_fifo_empty;
}

__STATIC_INLINE uint8_t dmac_ch0_ch_susp_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_ch_susp;
}

__STATIC_INLINE void dmac_ch0_ch_susp_setf(uint8_t ch0_ch_susp)
{
    hwp_dmac->ch0_cfg_l.bit_field.ch0_ch_susp = ch0_ch_susp;
}

__STATIC_INLINE uint8_t dmac_ch0_ch_prior_getf(void)
{
    return hwp_dmac->ch0_cfg_l.bit_field.ch0_ch_prior;
}

__STATIC_INLINE void dmac_ch0_ch_prior_setf(uint8_t ch0_ch_prior)
{
    hwp_dmac->ch0_cfg_l.bit_field.ch0_ch_prior = ch0_ch_prior;
}

__STATIC_INLINE uint32_t dmac_ch0_cfg_h_get(void)
{
    return hwp_dmac->ch0_cfg_h.val;
}

__STATIC_INLINE void dmac_ch0_cfg_h_set(uint32_t value)
{
    hwp_dmac->ch0_cfg_h.val = value;
}

__STATIC_INLINE void dmac_ch0_cfg_h_pack(uint8_t ch0_dest_per, uint8_t ch0_src_per, uint8_t ch0_protctl, uint8_t ch0_fifo_mode, uint8_t ch0_fc_mode)
{
    hwp_dmac->ch0_cfg_h.val = (((uint32_t)ch0_dest_per << 11) | ((uint32_t)ch0_src_per << 7) | ((uint32_t)ch0_protctl << 2) | ((uint32_t)ch0_fifo_mode << 1) | ((uint32_t)ch0_fc_mode << 0));
}

__STATIC_INLINE void dmac_ch0_cfg_h_unpack(uint8_t* ch0_dest_per, uint8_t* ch0_src_per, uint8_t* ch0_ss_upd_en, uint8_t* ch0_ds_upd_en, uint8_t* ch0_protctl, uint8_t* ch0_fifo_mode, uint8_t* ch0_fc_mode)
{
    T_DMAC_CH0_CFG_H localVal = hwp_dmac->ch0_cfg_h;

    *ch0_dest_per = localVal.bit_field.ch0_dest_per;
    *ch0_src_per = localVal.bit_field.ch0_src_per;
    *ch0_ss_upd_en = localVal.bit_field.ch0_ss_upd_en;
    *ch0_ds_upd_en = localVal.bit_field.ch0_ds_upd_en;
    *ch0_protctl = localVal.bit_field.ch0_protctl;
    *ch0_fifo_mode = localVal.bit_field.ch0_fifo_mode;
    *ch0_fc_mode = localVal.bit_field.ch0_fc_mode;
}

__STATIC_INLINE uint8_t dmac_ch0_dest_per_getf(void)
{
    return hwp_dmac->ch0_cfg_h.bit_field.ch0_dest_per;
}

__STATIC_INLINE void dmac_ch0_dest_per_setf(uint8_t ch0_dest_per)
{
    hwp_dmac->ch0_cfg_h.bit_field.ch0_dest_per = ch0_dest_per;
}

__STATIC_INLINE uint8_t dmac_ch0_src_per_getf(void)
{
    return hwp_dmac->ch0_cfg_h.bit_field.ch0_src_per;
}

__STATIC_INLINE void dmac_ch0_src_per_setf(uint8_t ch0_src_per)
{
    hwp_dmac->ch0_cfg_h.bit_field.ch0_src_per = ch0_src_per;
}

__STATIC_INLINE uint8_t dmac_ch0_ss_upd_en_getf(void)
{
    return hwp_dmac->ch0_cfg_h.bit_field.ch0_ss_upd_en;
}

__STATIC_INLINE uint8_t dmac_ch0_ds_upd_en_getf(void)
{
    return hwp_dmac->ch0_cfg_h.bit_field.ch0_ds_upd_en;
}

__STATIC_INLINE uint8_t dmac_ch0_protctl_getf(void)
{
    return hwp_dmac->ch0_cfg_h.bit_field.ch0_protctl;
}

__STATIC_INLINE void dmac_ch0_protctl_setf(uint8_t ch0_protctl)
{
    hwp_dmac->ch0_cfg_h.bit_field.ch0_protctl = ch0_protctl;
}

__STATIC_INLINE uint8_t dmac_ch0_fifo_mode_getf(void)
{
    return hwp_dmac->ch0_cfg_h.bit_field.ch0_fifo_mode;
}

__STATIC_INLINE void dmac_ch0_fifo_mode_setf(uint8_t ch0_fifo_mode)
{
    hwp_dmac->ch0_cfg_h.bit_field.ch0_fifo_mode = ch0_fifo_mode;
}

__STATIC_INLINE uint8_t dmac_ch0_fc_mode_getf(void)
{
    return hwp_dmac->ch0_cfg_h.bit_field.ch0_fc_mode;
}

__STATIC_INLINE void dmac_ch0_fc_mode_setf(uint8_t ch0_fc_mode)
{
    hwp_dmac->ch0_cfg_h.bit_field.ch0_fc_mode = ch0_fc_mode;
}

__STATIC_INLINE uint32_t dmac_ch1_sar_l_get(void)
{
    return hwp_dmac->ch1_sar_l.val;
}

__STATIC_INLINE void dmac_ch1_sar_l_set(uint32_t value)
{
    hwp_dmac->ch1_sar_l.val = value;
}

__STATIC_INLINE void dmac_ch1_sar_l_pack(uint32_t ch1_sar)
{
    hwp_dmac->ch1_sar_l.val = (((uint32_t)ch1_sar << 0));
}

__STATIC_INLINE void dmac_ch1_sar_l_unpack(uint32_t* ch1_sar)
{
    T_DMAC_CH1_SAR_L localVal = hwp_dmac->ch1_sar_l;

    *ch1_sar = localVal.bit_field.ch1_sar;
}

__STATIC_INLINE uint32_t dmac_ch1_sar_getf(void)
{
    return hwp_dmac->ch1_sar_l.bit_field.ch1_sar;
}

__STATIC_INLINE void dmac_ch1_sar_setf(uint32_t ch1_sar)
{
    hwp_dmac->ch1_sar_l.bit_field.ch1_sar = ch1_sar;
}

__STATIC_INLINE uint32_t dmac_ch1_dar_l_get(void)
{
    return hwp_dmac->ch1_dar_l.val;
}

__STATIC_INLINE void dmac_ch1_dar_l_set(uint32_t value)
{
    hwp_dmac->ch1_dar_l.val = value;
}

__STATIC_INLINE void dmac_ch1_dar_l_pack(uint32_t ch1_dar)
{
    hwp_dmac->ch1_dar_l.val = (((uint32_t)ch1_dar << 0));
}

__STATIC_INLINE void dmac_ch1_dar_l_unpack(uint32_t* ch1_dar)
{
    T_DMAC_CH1_DAR_L localVal = hwp_dmac->ch1_dar_l;

    *ch1_dar = localVal.bit_field.ch1_dar;
}

__STATIC_INLINE uint32_t dmac_ch1_dar_getf(void)
{
    return hwp_dmac->ch1_dar_l.bit_field.ch1_dar;
}

__STATIC_INLINE void dmac_ch1_dar_setf(uint32_t ch1_dar)
{
    hwp_dmac->ch1_dar_l.bit_field.ch1_dar = ch1_dar;
}

__STATIC_INLINE uint32_t dmac_ch1_ctrl_l_get(void)
{
    return hwp_dmac->ch1_ctrl_l.val;
}

__STATIC_INLINE void dmac_ch1_ctrl_l_set(uint32_t value)
{
    hwp_dmac->ch1_ctrl_l.val = value;
}

__STATIC_INLINE void dmac_ch1_ctrl_l_pack(uint8_t ch1_tt_fc, uint8_t ch1_src_msize, uint8_t ch1_dest_msize, uint8_t ch1_sinc, uint8_t ch1_dinc, uint8_t ch1_src_tr_width, uint8_t ch1_dst_tr_width, uint8_t ch1_int_en)
{
    hwp_dmac->ch1_ctrl_l.val = (((uint32_t)ch1_tt_fc << 20) | ((uint32_t)ch1_src_msize << 14) | ((uint32_t)ch1_dest_msize << 11) | ((uint32_t)ch1_sinc << 9) | ((uint32_t)ch1_dinc << 7) | ((uint32_t)ch1_src_tr_width << 4) | ((uint32_t)ch1_dst_tr_width << 1) | ((uint32_t)ch1_int_en << 0));
}

__STATIC_INLINE void dmac_ch1_ctrl_l_unpack(uint8_t* ch1_llp_src_en, uint8_t* ch1_llp_dst_en, uint8_t* ch1_sms, uint8_t* ch1_dms, uint8_t* ch1_tt_fc, uint8_t* ch1_dst_scatter_en, uint8_t* ch1_src_gather_en, uint8_t* ch1_src_msize, uint8_t* ch1_dest_msize, uint8_t* ch1_sinc, uint8_t* ch1_dinc, uint8_t* ch1_src_tr_width, uint8_t* ch1_dst_tr_width, uint8_t* ch1_int_en)
{
    T_DMAC_CH1_CTRL_L localVal = hwp_dmac->ch1_ctrl_l;

    *ch1_llp_src_en = localVal.bit_field.ch1_llp_src_en;
    *ch1_llp_dst_en = localVal.bit_field.ch1_llp_dst_en;
    *ch1_sms = localVal.bit_field.ch1_sms;
    *ch1_dms = localVal.bit_field.ch1_dms;
    *ch1_tt_fc = localVal.bit_field.ch1_tt_fc;
    *ch1_dst_scatter_en = localVal.bit_field.ch1_dst_scatter_en;
    *ch1_src_gather_en = localVal.bit_field.ch1_src_gather_en;
    *ch1_src_msize = localVal.bit_field.ch1_src_msize;
    *ch1_dest_msize = localVal.bit_field.ch1_dest_msize;
    *ch1_sinc = localVal.bit_field.ch1_sinc;
    *ch1_dinc = localVal.bit_field.ch1_dinc;
    *ch1_src_tr_width = localVal.bit_field.ch1_src_tr_width;
    *ch1_dst_tr_width = localVal.bit_field.ch1_dst_tr_width;
    *ch1_int_en = localVal.bit_field.ch1_int_en;
}

__STATIC_INLINE uint8_t dmac_ch1_llp_src_en_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_llp_src_en;
}

__STATIC_INLINE uint8_t dmac_ch1_llp_dst_en_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_llp_dst_en;
}

__STATIC_INLINE uint8_t dmac_ch1_sms_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_sms;
}

__STATIC_INLINE uint8_t dmac_ch1_dms_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_dms;
}

__STATIC_INLINE uint8_t dmac_ch1_tt_fc_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_tt_fc;
}

__STATIC_INLINE void dmac_ch1_tt_fc_setf(uint8_t ch1_tt_fc)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_tt_fc = ch1_tt_fc;
}

__STATIC_INLINE uint8_t dmac_ch1_dst_scatter_en_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_dst_scatter_en;
}

__STATIC_INLINE uint8_t dmac_ch1_src_gather_en_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_src_gather_en;
}

__STATIC_INLINE uint8_t dmac_ch1_src_msize_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_src_msize;
}

__STATIC_INLINE void dmac_ch1_src_msize_setf(uint8_t ch1_src_msize)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_src_msize = ch1_src_msize;
}

__STATIC_INLINE uint8_t dmac_ch1_dest_msize_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_dest_msize;
}

__STATIC_INLINE void dmac_ch1_dest_msize_setf(uint8_t ch1_dest_msize)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_dest_msize = ch1_dest_msize;
}

__STATIC_INLINE uint8_t dmac_ch1_sinc_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_sinc;
}

__STATIC_INLINE void dmac_ch1_sinc_setf(uint8_t ch1_sinc)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_sinc = ch1_sinc;
}

__STATIC_INLINE uint8_t dmac_ch1_dinc_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_dinc;
}

__STATIC_INLINE void dmac_ch1_dinc_setf(uint8_t ch1_dinc)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_dinc = ch1_dinc;
}

__STATIC_INLINE uint8_t dmac_ch1_src_tr_width_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_src_tr_width;
}

__STATIC_INLINE void dmac_ch1_src_tr_width_setf(uint8_t ch1_src_tr_width)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_src_tr_width = ch1_src_tr_width;
}

__STATIC_INLINE uint8_t dmac_ch1_dst_tr_width_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_dst_tr_width;
}

__STATIC_INLINE void dmac_ch1_dst_tr_width_setf(uint8_t ch1_dst_tr_width)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_dst_tr_width = ch1_dst_tr_width;
}

__STATIC_INLINE uint8_t dmac_ch1_int_en_getf(void)
{
    return hwp_dmac->ch1_ctrl_l.bit_field.ch1_int_en;
}

__STATIC_INLINE void dmac_ch1_int_en_setf(uint8_t ch1_int_en)
{
    hwp_dmac->ch1_ctrl_l.bit_field.ch1_int_en = ch1_int_en;
}

__STATIC_INLINE uint32_t dmac_ch1_ctrl_h_get(void)
{
    return hwp_dmac->ch1_ctrl_h.val;
}

__STATIC_INLINE void dmac_ch1_ctrl_h_set(uint32_t value)
{
    hwp_dmac->ch1_ctrl_h.val = value;
}

__STATIC_INLINE void dmac_ch1_ctrl_h_pack(uint8_t ch1_done, uint16_t ch1_block_ts)
{
    hwp_dmac->ch1_ctrl_h.val = (((uint32_t)ch1_done << 12) | ((uint32_t)ch1_block_ts << 0));
}

__STATIC_INLINE void dmac_ch1_ctrl_h_unpack(uint8_t* ch1_done, uint16_t* ch1_block_ts)
{
    T_DMAC_CH1_CTRL_H localVal = hwp_dmac->ch1_ctrl_h;

    *ch1_done = localVal.bit_field.ch1_done;
    *ch1_block_ts = localVal.bit_field.ch1_block_ts;
}

__STATIC_INLINE uint8_t dmac_ch1_done_getf(void)
{
    return hwp_dmac->ch1_ctrl_h.bit_field.ch1_done;
}

__STATIC_INLINE void dmac_ch1_done_setf(uint8_t ch1_done)
{
    hwp_dmac->ch1_ctrl_h.bit_field.ch1_done = ch1_done;
}

__STATIC_INLINE uint16_t dmac_ch1_block_ts_getf(void)
{
    return hwp_dmac->ch1_ctrl_h.bit_field.ch1_block_ts;
}

__STATIC_INLINE void dmac_ch1_block_ts_setf(uint16_t ch1_block_ts)
{
    hwp_dmac->ch1_ctrl_h.bit_field.ch1_block_ts = ch1_block_ts;
}

__STATIC_INLINE uint32_t dmac_ch1_cfg_l_get(void)
{
    return hwp_dmac->ch1_cfg_l.val;
}

__STATIC_INLINE void dmac_ch1_cfg_l_set(uint32_t value)
{
    hwp_dmac->ch1_cfg_l.val = value;
}

__STATIC_INLINE void dmac_ch1_cfg_l_pack(uint16_t ch1_max_abrst, uint8_t ch1_src_hs_pol, uint8_t ch1_dst_hs_pol, uint8_t ch1_hs_sel_src, uint8_t ch1_hs_sel_dst, uint8_t ch1_ch_susp, uint8_t ch1_ch_prior)
{
    hwp_dmac->ch1_cfg_l.val = (((uint32_t)ch1_max_abrst << 20) | ((uint32_t)ch1_src_hs_pol << 19) | ((uint32_t)ch1_dst_hs_pol << 18) | ((uint32_t)ch1_hs_sel_src << 11) | ((uint32_t)ch1_hs_sel_dst << 10) | ((uint32_t)ch1_ch_susp << 8) | ((uint32_t)ch1_ch_prior << 5));
}

__STATIC_INLINE void dmac_ch1_cfg_l_unpack(uint8_t* ch1_reload_dst, uint8_t* ch1_reload_src, uint16_t* ch1_max_abrst, uint8_t* ch1_src_hs_pol, uint8_t* ch1_dst_hs_pol, uint8_t* ch1_lock_b, uint8_t* ch1_lock_ch, uint8_t* ch1_lock_b_l, uint8_t* ch1_lock_ch_l, uint8_t* ch1_hs_sel_src, uint8_t* ch1_hs_sel_dst, uint8_t* ch1_fifo_empty, uint8_t* ch1_ch_susp, uint8_t* ch1_ch_prior)
{
    T_DMAC_CH1_CFG_L localVal = hwp_dmac->ch1_cfg_l;

    *ch1_reload_dst = localVal.bit_field.ch1_reload_dst;
    *ch1_reload_src = localVal.bit_field.ch1_reload_src;
    *ch1_max_abrst = localVal.bit_field.ch1_max_abrst;
    *ch1_src_hs_pol = localVal.bit_field.ch1_src_hs_pol;
    *ch1_dst_hs_pol = localVal.bit_field.ch1_dst_hs_pol;
    *ch1_lock_b = localVal.bit_field.ch1_lock_b;
    *ch1_lock_ch = localVal.bit_field.ch1_lock_ch;
    *ch1_lock_b_l = localVal.bit_field.ch1_lock_b_l;
    *ch1_lock_ch_l = localVal.bit_field.ch1_lock_ch_l;
    *ch1_hs_sel_src = localVal.bit_field.ch1_hs_sel_src;
    *ch1_hs_sel_dst = localVal.bit_field.ch1_hs_sel_dst;
    *ch1_fifo_empty = localVal.bit_field.ch1_fifo_empty;
    *ch1_ch_susp = localVal.bit_field.ch1_ch_susp;
    *ch1_ch_prior = localVal.bit_field.ch1_ch_prior;
}

__STATIC_INLINE uint8_t dmac_ch1_reload_dst_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_reload_dst;
}

__STATIC_INLINE uint8_t dmac_ch1_reload_src_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_reload_src;
}

__STATIC_INLINE uint16_t dmac_ch1_max_abrst_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_max_abrst;
}

__STATIC_INLINE void dmac_ch1_max_abrst_setf(uint16_t ch1_max_abrst)
{
    hwp_dmac->ch1_cfg_l.bit_field.ch1_max_abrst = ch1_max_abrst;
}

__STATIC_INLINE uint8_t dmac_ch1_src_hs_pol_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_src_hs_pol;
}

__STATIC_INLINE void dmac_ch1_src_hs_pol_setf(uint8_t ch1_src_hs_pol)
{
    hwp_dmac->ch1_cfg_l.bit_field.ch1_src_hs_pol = ch1_src_hs_pol;
}

__STATIC_INLINE uint8_t dmac_ch1_dst_hs_pol_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_dst_hs_pol;
}

__STATIC_INLINE void dmac_ch1_dst_hs_pol_setf(uint8_t ch1_dst_hs_pol)
{
    hwp_dmac->ch1_cfg_l.bit_field.ch1_dst_hs_pol = ch1_dst_hs_pol;
}

__STATIC_INLINE uint8_t dmac_ch1_lock_b_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_lock_b;
}

__STATIC_INLINE uint8_t dmac_ch1_lock_ch_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_lock_ch;
}

__STATIC_INLINE uint8_t dmac_ch1_lock_b_l_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_lock_b_l;
}

__STATIC_INLINE uint8_t dmac_ch1_lock_ch_l_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_lock_ch_l;
}

__STATIC_INLINE uint8_t dmac_ch1_hs_sel_src_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_hs_sel_src;
}

__STATIC_INLINE void dmac_ch1_hs_sel_src_setf(uint8_t ch1_hs_sel_src)
{
    hwp_dmac->ch1_cfg_l.bit_field.ch1_hs_sel_src = ch1_hs_sel_src;
}

__STATIC_INLINE uint8_t dmac_ch1_hs_sel_dst_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_hs_sel_dst;
}

__STATIC_INLINE void dmac_ch1_hs_sel_dst_setf(uint8_t ch1_hs_sel_dst)
{
    hwp_dmac->ch1_cfg_l.bit_field.ch1_hs_sel_dst = ch1_hs_sel_dst;
}

__STATIC_INLINE uint8_t dmac_ch1_fifo_empty_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_fifo_empty;
}

__STATIC_INLINE uint8_t dmac_ch1_ch_susp_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_ch_susp;
}

__STATIC_INLINE void dmac_ch1_ch_susp_setf(uint8_t ch1_ch_susp)
{
    hwp_dmac->ch1_cfg_l.bit_field.ch1_ch_susp = ch1_ch_susp;
}

__STATIC_INLINE uint8_t dmac_ch1_ch_prior_getf(void)
{
    return hwp_dmac->ch1_cfg_l.bit_field.ch1_ch_prior;
}

__STATIC_INLINE void dmac_ch1_ch_prior_setf(uint8_t ch1_ch_prior)
{
    hwp_dmac->ch1_cfg_l.bit_field.ch1_ch_prior = ch1_ch_prior;
}

__STATIC_INLINE uint32_t dmac_ch1_cfg_h_get(void)
{
    return hwp_dmac->ch1_cfg_h.val;
}

__STATIC_INLINE void dmac_ch1_cfg_h_set(uint32_t value)
{
    hwp_dmac->ch1_cfg_h.val = value;
}

__STATIC_INLINE void dmac_ch1_cfg_h_pack(uint8_t ch1_dest_per, uint8_t ch1_src_per, uint8_t ch1_protctl, uint8_t ch1_fifo_mode, uint8_t ch1_fc_mode)
{
    hwp_dmac->ch1_cfg_h.val = (((uint32_t)ch1_dest_per << 11) | ((uint32_t)ch1_src_per << 7) | ((uint32_t)ch1_protctl << 2) | ((uint32_t)ch1_fifo_mode << 1) | ((uint32_t)ch1_fc_mode << 0));
}

__STATIC_INLINE void dmac_ch1_cfg_h_unpack(uint8_t* ch1_dest_per, uint8_t* ch1_src_per, uint8_t* ch1_ss_upd_en, uint8_t* ch1_ds_upd_en, uint8_t* ch1_protctl, uint8_t* ch1_fifo_mode, uint8_t* ch1_fc_mode)
{
    T_DMAC_CH1_CFG_H localVal = hwp_dmac->ch1_cfg_h;

    *ch1_dest_per = localVal.bit_field.ch1_dest_per;
    *ch1_src_per = localVal.bit_field.ch1_src_per;
    *ch1_ss_upd_en = localVal.bit_field.ch1_ss_upd_en;
    *ch1_ds_upd_en = localVal.bit_field.ch1_ds_upd_en;
    *ch1_protctl = localVal.bit_field.ch1_protctl;
    *ch1_fifo_mode = localVal.bit_field.ch1_fifo_mode;
    *ch1_fc_mode = localVal.bit_field.ch1_fc_mode;
}

__STATIC_INLINE uint8_t dmac_ch1_dest_per_getf(void)
{
    return hwp_dmac->ch1_cfg_h.bit_field.ch1_dest_per;
}

__STATIC_INLINE void dmac_ch1_dest_per_setf(uint8_t ch1_dest_per)
{
    hwp_dmac->ch1_cfg_h.bit_field.ch1_dest_per = ch1_dest_per;
}

__STATIC_INLINE uint8_t dmac_ch1_src_per_getf(void)
{
    return hwp_dmac->ch1_cfg_h.bit_field.ch1_src_per;
}

__STATIC_INLINE void dmac_ch1_src_per_setf(uint8_t ch1_src_per)
{
    hwp_dmac->ch1_cfg_h.bit_field.ch1_src_per = ch1_src_per;
}

__STATIC_INLINE uint8_t dmac_ch1_ss_upd_en_getf(void)
{
    return hwp_dmac->ch1_cfg_h.bit_field.ch1_ss_upd_en;
}

__STATIC_INLINE uint8_t dmac_ch1_ds_upd_en_getf(void)
{
    return hwp_dmac->ch1_cfg_h.bit_field.ch1_ds_upd_en;
}

__STATIC_INLINE uint8_t dmac_ch1_protctl_getf(void)
{
    return hwp_dmac->ch1_cfg_h.bit_field.ch1_protctl;
}

__STATIC_INLINE void dmac_ch1_protctl_setf(uint8_t ch1_protctl)
{
    hwp_dmac->ch1_cfg_h.bit_field.ch1_protctl = ch1_protctl;
}

__STATIC_INLINE uint8_t dmac_ch1_fifo_mode_getf(void)
{
    return hwp_dmac->ch1_cfg_h.bit_field.ch1_fifo_mode;
}

__STATIC_INLINE void dmac_ch1_fifo_mode_setf(uint8_t ch1_fifo_mode)
{
    hwp_dmac->ch1_cfg_h.bit_field.ch1_fifo_mode = ch1_fifo_mode;
}

__STATIC_INLINE uint8_t dmac_ch1_fc_mode_getf(void)
{
    return hwp_dmac->ch1_cfg_h.bit_field.ch1_fc_mode;
}

__STATIC_INLINE void dmac_ch1_fc_mode_setf(uint8_t ch1_fc_mode)
{
    hwp_dmac->ch1_cfg_h.bit_field.ch1_fc_mode = ch1_fc_mode;
}

__STATIC_INLINE uint32_t dmac_rawtfr_l_get(void)
{
    return hwp_dmac->rawtfr_l.val;
}

__STATIC_INLINE void dmac_rawtfr_l_set(uint32_t value)
{
    hwp_dmac->rawtfr_l.val = value;
}

__STATIC_INLINE void dmac_rawtfr_l_pack(uint8_t rawtfr)
{
    hwp_dmac->rawtfr_l.val = (((uint32_t)rawtfr << 0));
}

__STATIC_INLINE void dmac_rawtfr_l_unpack(uint8_t* rawtfr)
{
    T_DMAC_RAWTFR_L localVal = hwp_dmac->rawtfr_l;

    *rawtfr = localVal.bit_field.rawtfr;
}

__STATIC_INLINE uint8_t dmac_rawtfr_getf(void)
{
    return hwp_dmac->rawtfr_l.bit_field.rawtfr;
}

__STATIC_INLINE void dmac_rawtfr_setf(uint8_t rawtfr)
{
    hwp_dmac->rawtfr_l.bit_field.rawtfr = rawtfr;
}

__STATIC_INLINE uint32_t dmac_rawblock_l_get(void)
{
    return hwp_dmac->rawblock_l.val;
}

__STATIC_INLINE void dmac_rawblock_l_set(uint32_t value)
{
    hwp_dmac->rawblock_l.val = value;
}

__STATIC_INLINE void dmac_rawblock_l_pack(uint8_t rawblock)
{
    hwp_dmac->rawblock_l.val = (((uint32_t)rawblock << 0));
}

__STATIC_INLINE void dmac_rawblock_l_unpack(uint8_t* rawblock)
{
    T_DMAC_RAWBLOCK_L localVal = hwp_dmac->rawblock_l;

    *rawblock = localVal.bit_field.rawblock;
}

__STATIC_INLINE uint8_t dmac_rawblock_getf(void)
{
    return hwp_dmac->rawblock_l.bit_field.rawblock;
}

__STATIC_INLINE void dmac_rawblock_setf(uint8_t rawblock)
{
    hwp_dmac->rawblock_l.bit_field.rawblock = rawblock;
}

__STATIC_INLINE uint32_t dmac_rawsrctran_l_get(void)
{
    return hwp_dmac->rawsrctran_l.val;
}

__STATIC_INLINE void dmac_rawsrctran_l_set(uint32_t value)
{
    hwp_dmac->rawsrctran_l.val = value;
}

__STATIC_INLINE void dmac_rawsrctran_l_pack(uint8_t rawsrctran)
{
    hwp_dmac->rawsrctran_l.val = (((uint32_t)rawsrctran << 0));
}

__STATIC_INLINE void dmac_rawsrctran_l_unpack(uint8_t* rawsrctran)
{
    T_DMAC_RAWSRCTRAN_L localVal = hwp_dmac->rawsrctran_l;

    *rawsrctran = localVal.bit_field.rawsrctran;
}

__STATIC_INLINE uint8_t dmac_rawsrctran_getf(void)
{
    return hwp_dmac->rawsrctran_l.bit_field.rawsrctran;
}

__STATIC_INLINE void dmac_rawsrctran_setf(uint8_t rawsrctran)
{
    hwp_dmac->rawsrctran_l.bit_field.rawsrctran = rawsrctran;
}

__STATIC_INLINE uint32_t dmac_rawdsttran_l_get(void)
{
    return hwp_dmac->rawdsttran_l.val;
}

__STATIC_INLINE void dmac_rawdsttran_l_set(uint32_t value)
{
    hwp_dmac->rawdsttran_l.val = value;
}

__STATIC_INLINE void dmac_rawdsttran_l_pack(uint8_t rawdsttran)
{
    hwp_dmac->rawdsttran_l.val = (((uint32_t)rawdsttran << 0));
}

__STATIC_INLINE void dmac_rawdsttran_l_unpack(uint8_t* rawdsttran)
{
    T_DMAC_RAWDSTTRAN_L localVal = hwp_dmac->rawdsttran_l;

    *rawdsttran = localVal.bit_field.rawdsttran;
}

__STATIC_INLINE uint8_t dmac_rawdsttran_getf(void)
{
    return hwp_dmac->rawdsttran_l.bit_field.rawdsttran;
}

__STATIC_INLINE void dmac_rawdsttran_setf(uint8_t rawdsttran)
{
    hwp_dmac->rawdsttran_l.bit_field.rawdsttran = rawdsttran;
}

__STATIC_INLINE uint32_t dmac_rawerr_l_get(void)
{
    return hwp_dmac->rawerr_l.val;
}

__STATIC_INLINE void dmac_rawerr_l_set(uint32_t value)
{
    hwp_dmac->rawerr_l.val = value;
}

__STATIC_INLINE void dmac_rawerr_l_pack(uint8_t rawerr)
{
    hwp_dmac->rawerr_l.val = (((uint32_t)rawerr << 0));
}

__STATIC_INLINE void dmac_rawerr_l_unpack(uint8_t* rawerr)
{
    T_DMAC_RAWERR_L localVal = hwp_dmac->rawerr_l;

    *rawerr = localVal.bit_field.rawerr;
}

__STATIC_INLINE uint8_t dmac_rawerr_getf(void)
{
    return hwp_dmac->rawerr_l.bit_field.rawerr;
}

__STATIC_INLINE void dmac_rawerr_setf(uint8_t rawerr)
{
    hwp_dmac->rawerr_l.bit_field.rawerr = rawerr;
}

__STATIC_INLINE uint32_t dmac_statustfr_l_get(void)
{
    return hwp_dmac->statustfr_l.val;
}

__STATIC_INLINE void dmac_statustfr_l_unpack(uint8_t* statustfr)
{
    T_DMAC_STATUSTFR_L localVal = hwp_dmac->statustfr_l;

    *statustfr = localVal.bit_field.statustfr;
}

__STATIC_INLINE uint8_t dmac_statustfr_getf(void)
{
    return hwp_dmac->statustfr_l.bit_field.statustfr;
}

__STATIC_INLINE uint32_t dmac_statusblock_l_get(void)
{
    return hwp_dmac->statusblock_l.val;
}

__STATIC_INLINE void dmac_statusblock_l_unpack(uint8_t* statusblock)
{
    T_DMAC_STATUSBLOCK_L localVal = hwp_dmac->statusblock_l;

    *statusblock = localVal.bit_field.statusblock;
}

__STATIC_INLINE uint8_t dmac_statusblock_getf(void)
{
    return hwp_dmac->statusblock_l.bit_field.statusblock;
}

__STATIC_INLINE uint32_t dmac_statussrctran_l_get(void)
{
    return hwp_dmac->statussrctran_l.val;
}

__STATIC_INLINE void dmac_statussrctran_l_unpack(uint8_t* statussrctran)
{
    T_DMAC_STATUSSRCTRAN_L localVal = hwp_dmac->statussrctran_l;

    *statussrctran = localVal.bit_field.statussrctran;
}

__STATIC_INLINE uint8_t dmac_statussrctran_getf(void)
{
    return hwp_dmac->statussrctran_l.bit_field.statussrctran;
}

__STATIC_INLINE uint32_t dmac_statusdsttran_l_get(void)
{
    return hwp_dmac->statusdsttran_l.val;
}

__STATIC_INLINE void dmac_statusdsttran_l_unpack(uint8_t* statusdsttran)
{
    T_DMAC_STATUSDSTTRAN_L localVal = hwp_dmac->statusdsttran_l;

    *statusdsttran = localVal.bit_field.statusdsttran;
}

__STATIC_INLINE uint8_t dmac_statusdsttran_getf(void)
{
    return hwp_dmac->statusdsttran_l.bit_field.statusdsttran;
}

__STATIC_INLINE uint32_t dmac_statuserr_l_get(void)
{
    return hwp_dmac->statuserr_l.val;
}

__STATIC_INLINE void dmac_statuserr_l_unpack(uint8_t* statuserr)
{
    T_DMAC_STATUSERR_L localVal = hwp_dmac->statuserr_l;

    *statuserr = localVal.bit_field.statuserr;
}

__STATIC_INLINE uint8_t dmac_statuserr_getf(void)
{
    return hwp_dmac->statuserr_l.bit_field.statuserr;
}

__STATIC_INLINE uint32_t dmac_masktfr_l_get(void)
{
    return hwp_dmac->masktfr_l.val;
}

__STATIC_INLINE void dmac_masktfr_l_set(uint32_t value)
{
    hwp_dmac->masktfr_l.val = value;
}

__STATIC_INLINE void dmac_masktfr_l_pack(uint8_t int_mask_ftr_we, uint8_t int_mask_tfr)
{
    hwp_dmac->masktfr_l.val = (((uint32_t)int_mask_ftr_we << 8) | ((uint32_t)int_mask_tfr << 0));
}

__STATIC_INLINE void dmac_masktfr_l_unpack(uint8_t* int_mask_tfr)
{
    T_DMAC_MASKTFR_L localVal = hwp_dmac->masktfr_l;

    *int_mask_tfr = localVal.bit_field.int_mask_tfr;
}

__STATIC_INLINE uint8_t dmac_int_mask_tfr_getf(void)
{
    return hwp_dmac->masktfr_l.bit_field.int_mask_tfr;
}

__STATIC_INLINE uint32_t dmac_maskblock_l_get(void)
{
    return hwp_dmac->maskblock_l.val;
}

__STATIC_INLINE void dmac_maskblock_l_set(uint32_t value)
{
    hwp_dmac->maskblock_l.val = value;
}

__STATIC_INLINE void dmac_maskblock_l_pack(uint8_t int_mask_block_we, uint8_t int_mask_block)
{
    hwp_dmac->maskblock_l.val = (((uint32_t)int_mask_block_we << 8) | ((uint32_t)int_mask_block << 0));
}

__STATIC_INLINE void dmac_maskblock_l_unpack(uint8_t* int_mask_block)
{
    T_DMAC_MASKBLOCK_L localVal = hwp_dmac->maskblock_l;

    *int_mask_block = localVal.bit_field.int_mask_block;
}

__STATIC_INLINE uint8_t dmac_int_mask_block_getf(void)
{
    return hwp_dmac->maskblock_l.bit_field.int_mask_block;
}

__STATIC_INLINE uint32_t dmac_masksrctran_l_get(void)
{
    return hwp_dmac->masksrctran_l.val;
}

__STATIC_INLINE void dmac_masksrctran_l_set(uint32_t value)
{
    hwp_dmac->masksrctran_l.val = value;
}

__STATIC_INLINE void dmac_masksrctran_l_pack(uint8_t int_mask_srctran_we, uint8_t int_mask_srctran)
{
    hwp_dmac->masksrctran_l.val = (((uint32_t)int_mask_srctran_we << 8) | ((uint32_t)int_mask_srctran << 0));
}

__STATIC_INLINE void dmac_masksrctran_l_unpack(uint8_t* int_mask_srctran)
{
    T_DMAC_MASKSRCTRAN_L localVal = hwp_dmac->masksrctran_l;

    *int_mask_srctran = localVal.bit_field.int_mask_srctran;
}

__STATIC_INLINE uint8_t dmac_int_mask_srctran_getf(void)
{
    return hwp_dmac->masksrctran_l.bit_field.int_mask_srctran;
}

__STATIC_INLINE uint32_t dmac_maskdsttran_l_get(void)
{
    return hwp_dmac->maskdsttran_l.val;
}

__STATIC_INLINE void dmac_maskdsttran_l_set(uint32_t value)
{
    hwp_dmac->maskdsttran_l.val = value;
}

__STATIC_INLINE void dmac_maskdsttran_l_pack(uint8_t int_mask_dsttran_we, uint8_t int_mask_dsttran)
{
    hwp_dmac->maskdsttran_l.val = (((uint32_t)int_mask_dsttran_we << 8) | ((uint32_t)int_mask_dsttran << 0));
}

__STATIC_INLINE void dmac_maskdsttran_l_unpack(uint8_t* int_mask_dsttran)
{
    T_DMAC_MASKDSTTRAN_L localVal = hwp_dmac->maskdsttran_l;

    *int_mask_dsttran = localVal.bit_field.int_mask_dsttran;
}

__STATIC_INLINE uint8_t dmac_int_mask_dsttran_getf(void)
{
    return hwp_dmac->maskdsttran_l.bit_field.int_mask_dsttran;
}

__STATIC_INLINE uint32_t dmac_maskerr_l_get(void)
{
    return hwp_dmac->maskerr_l.val;
}

__STATIC_INLINE void dmac_maskerr_l_set(uint32_t value)
{
    hwp_dmac->maskerr_l.val = value;
}

__STATIC_INLINE void dmac_maskerr_l_pack(uint8_t int_mask_err_we, uint8_t int_mask_err)
{
    hwp_dmac->maskerr_l.val = (((uint32_t)int_mask_err_we << 8) | ((uint32_t)int_mask_err << 0));
}

__STATIC_INLINE void dmac_maskerr_l_unpack(uint8_t* int_mask_err)
{
    T_DMAC_MASKERR_L localVal = hwp_dmac->maskerr_l;

    *int_mask_err = localVal.bit_field.int_mask_err;
}

__STATIC_INLINE uint8_t dmac_int_mask_err_getf(void)
{
    return hwp_dmac->maskerr_l.bit_field.int_mask_err;
}

__STATIC_INLINE uint32_t dmac_cleartfr_l_get(void)
{
    return hwp_dmac->cleartfr_l.val;
}

__STATIC_INLINE void dmac_cleartfr_l_set(uint32_t value)
{
    hwp_dmac->cleartfr_l.val = value;
}

__STATIC_INLINE void dmac_cleartfr_l_pack(uint8_t clear_tfr)
{
    hwp_dmac->cleartfr_l.val = (((uint32_t)clear_tfr << 0));
}

__STATIC_INLINE uint32_t dmac_clearblock_l_get(void)
{
    return hwp_dmac->clearblock_l.val;
}

__STATIC_INLINE void dmac_clearblock_l_set(uint32_t value)
{
    hwp_dmac->clearblock_l.val = value;
}

__STATIC_INLINE void dmac_clearblock_l_pack(uint8_t clear_block)
{
    hwp_dmac->clearblock_l.val = (((uint32_t)clear_block << 0));
}

__STATIC_INLINE uint32_t dmac_clearsrctran_l_get(void)
{
    return hwp_dmac->clearsrctran_l.val;
}

__STATIC_INLINE void dmac_clearsrctran_l_set(uint32_t value)
{
    hwp_dmac->clearsrctran_l.val = value;
}

__STATIC_INLINE void dmac_clearsrctran_l_pack(uint8_t clear_srctran)
{
    hwp_dmac->clearsrctran_l.val = (((uint32_t)clear_srctran << 0));
}

__STATIC_INLINE uint32_t dmac_cleardsttran_l_get(void)
{
    return hwp_dmac->cleardsttran_l.val;
}

__STATIC_INLINE void dmac_cleardsttran_l_set(uint32_t value)
{
    hwp_dmac->cleardsttran_l.val = value;
}

__STATIC_INLINE void dmac_cleardsttran_l_pack(uint8_t clear_dsttran)
{
    hwp_dmac->cleardsttran_l.val = (((uint32_t)clear_dsttran << 0));
}

__STATIC_INLINE uint32_t dmac_clearerr_l_get(void)
{
    return hwp_dmac->clearerr_l.val;
}

__STATIC_INLINE void dmac_clearerr_l_set(uint32_t value)
{
    hwp_dmac->clearerr_l.val = value;
}

__STATIC_INLINE void dmac_clearerr_l_pack(uint8_t clear_err)
{
    hwp_dmac->clearerr_l.val = (((uint32_t)clear_err << 0));
}

__STATIC_INLINE uint32_t dmac_statusint_l_get(void)
{
    return hwp_dmac->statusint_l.val;
}

__STATIC_INLINE void dmac_statusint_l_unpack(uint8_t* err, uint8_t* dstt, uint8_t* srct, uint8_t* block, uint8_t* tfr)
{
    T_DMAC_STATUSINT_L localVal = hwp_dmac->statusint_l;

    *err = localVal.bit_field.err;
    *dstt = localVal.bit_field.dstt;
    *srct = localVal.bit_field.srct;
    *block = localVal.bit_field.block;
    *tfr = localVal.bit_field.tfr;
}

__STATIC_INLINE uint8_t dmac_err_getf(void)
{
    return hwp_dmac->statusint_l.bit_field.err;
}

__STATIC_INLINE uint8_t dmac_dstt_getf(void)
{
    return hwp_dmac->statusint_l.bit_field.dstt;
}

__STATIC_INLINE uint8_t dmac_srct_getf(void)
{
    return hwp_dmac->statusint_l.bit_field.srct;
}

__STATIC_INLINE uint8_t dmac_block_getf(void)
{
    return hwp_dmac->statusint_l.bit_field.block;
}

__STATIC_INLINE uint8_t dmac_tfr_getf(void)
{
    return hwp_dmac->statusint_l.bit_field.tfr;
}

__STATIC_INLINE uint32_t dmac_reqsrcreg_l_get(void)
{
    return hwp_dmac->reqsrcreg_l.val;
}

__STATIC_INLINE void dmac_reqsrcreg_l_set(uint32_t value)
{
    hwp_dmac->reqsrcreg_l.val = value;
}

__STATIC_INLINE void dmac_reqsrcreg_l_pack(uint8_t src_req_we, uint8_t src_req)
{
    hwp_dmac->reqsrcreg_l.val = (((uint32_t)src_req_we << 8) | ((uint32_t)src_req << 0));
}

__STATIC_INLINE void dmac_reqsrcreg_l_unpack(uint8_t* src_req)
{
    T_DMAC_REQSRCREG_L localVal = hwp_dmac->reqsrcreg_l;

    *src_req = localVal.bit_field.src_req;
}

__STATIC_INLINE uint8_t dmac_src_req_getf(void)
{
    return hwp_dmac->reqsrcreg_l.bit_field.src_req;
}

__STATIC_INLINE uint32_t dmac_reqdstreg_l_get(void)
{
    return hwp_dmac->reqdstreg_l.val;
}

__STATIC_INLINE void dmac_reqdstreg_l_set(uint32_t value)
{
    hwp_dmac->reqdstreg_l.val = value;
}

__STATIC_INLINE void dmac_reqdstreg_l_pack(uint8_t dst_req_we, uint8_t dst_req)
{
    hwp_dmac->reqdstreg_l.val = (((uint32_t)dst_req_we << 8) | ((uint32_t)dst_req << 0));
}

__STATIC_INLINE void dmac_reqdstreg_l_unpack(uint8_t* dst_req)
{
    T_DMAC_REQDSTREG_L localVal = hwp_dmac->reqdstreg_l;

    *dst_req = localVal.bit_field.dst_req;
}

__STATIC_INLINE uint8_t dmac_dst_req_getf(void)
{
    return hwp_dmac->reqdstreg_l.bit_field.dst_req;
}

__STATIC_INLINE uint32_t dmac_sglreqsrcreg_l_get(void)
{
    return hwp_dmac->sglreqsrcreg_l.val;
}

__STATIC_INLINE void dmac_sglreqsrcreg_l_set(uint32_t value)
{
    hwp_dmac->sglreqsrcreg_l.val = value;
}

__STATIC_INLINE void dmac_sglreqsrcreg_l_pack(uint8_t src_sglreq_we, uint8_t src_sglreq)
{
    hwp_dmac->sglreqsrcreg_l.val = (((uint32_t)src_sglreq_we << 8) | ((uint32_t)src_sglreq << 0));
}

__STATIC_INLINE void dmac_sglreqsrcreg_l_unpack(uint8_t* src_sglreq)
{
    T_DMAC_SGLREQSRCREG_L localVal = hwp_dmac->sglreqsrcreg_l;

    *src_sglreq = localVal.bit_field.src_sglreq;
}

__STATIC_INLINE uint8_t dmac_src_sglreq_getf(void)
{
    return hwp_dmac->sglreqsrcreg_l.bit_field.src_sglreq;
}

__STATIC_INLINE uint32_t dmac_sglreqdstreg_l_get(void)
{
    return hwp_dmac->sglreqdstreg_l.val;
}

__STATIC_INLINE void dmac_sglreqdstreg_l_set(uint32_t value)
{
    hwp_dmac->sglreqdstreg_l.val = value;
}

__STATIC_INLINE void dmac_sglreqdstreg_l_pack(uint8_t dst_sglreq_we, uint8_t dst_sglreq)
{
    hwp_dmac->sglreqdstreg_l.val = (((uint32_t)dst_sglreq_we << 8) | ((uint32_t)dst_sglreq << 0));
}

__STATIC_INLINE void dmac_sglreqdstreg_l_unpack(uint8_t* dst_sglreq)
{
    T_DMAC_SGLREQDSTREG_L localVal = hwp_dmac->sglreqdstreg_l;

    *dst_sglreq = localVal.bit_field.dst_sglreq;
}

__STATIC_INLINE uint8_t dmac_dst_sglreq_getf(void)
{
    return hwp_dmac->sglreqdstreg_l.bit_field.dst_sglreq;
}

__STATIC_INLINE uint32_t dmac_lstsrcreg_l_get(void)
{
    return hwp_dmac->lstsrcreg_l.val;
}

__STATIC_INLINE void dmac_lstsrcreg_l_set(uint32_t value)
{
    hwp_dmac->lstsrcreg_l.val = value;
}

__STATIC_INLINE void dmac_lstsrcreg_l_pack(uint8_t lstsrc_we, uint8_t lstsrc)
{
    hwp_dmac->lstsrcreg_l.val = (((uint32_t)lstsrc_we << 8) | ((uint32_t)lstsrc << 0));
}

__STATIC_INLINE void dmac_lstsrcreg_l_unpack(uint8_t* lstsrc)
{
    T_DMAC_LSTSRCREG_L localVal = hwp_dmac->lstsrcreg_l;

    *lstsrc = localVal.bit_field.lstsrc;
}

__STATIC_INLINE uint8_t dmac_lstsrc_getf(void)
{
    return hwp_dmac->lstsrcreg_l.bit_field.lstsrc;
}

__STATIC_INLINE uint32_t dmac_lstdstreg_l_get(void)
{
    return hwp_dmac->lstdstreg_l.val;
}

__STATIC_INLINE void dmac_lstdstreg_l_set(uint32_t value)
{
    hwp_dmac->lstdstreg_l.val = value;
}

__STATIC_INLINE void dmac_lstdstreg_l_pack(uint8_t lstdst_we, uint8_t lstdst)
{
    hwp_dmac->lstdstreg_l.val = (((uint32_t)lstdst_we << 8) | ((uint32_t)lstdst << 0));
}

__STATIC_INLINE void dmac_lstdstreg_l_unpack(uint8_t* lstdst)
{
    T_DMAC_LSTDSTREG_L localVal = hwp_dmac->lstdstreg_l;

    *lstdst = localVal.bit_field.lstdst;
}

__STATIC_INLINE uint8_t dmac_lstdst_getf(void)
{
    return hwp_dmac->lstdstreg_l.bit_field.lstdst;
}

__STATIC_INLINE uint32_t dmac_dmacfgreg_l_get(void)
{
    return hwp_dmac->dmacfgreg_l.val;
}

__STATIC_INLINE void dmac_dmacfgreg_l_set(uint32_t value)
{
    hwp_dmac->dmacfgreg_l.val = value;
}

__STATIC_INLINE void dmac_dmacfgreg_l_pack(uint8_t dma_en)
{
    hwp_dmac->dmacfgreg_l.val = (((uint32_t)dma_en << 0));
}

__STATIC_INLINE void dmac_dmacfgreg_l_unpack(uint8_t* dma_en)
{
    T_DMAC_DMACFGREG_L localVal = hwp_dmac->dmacfgreg_l;

    *dma_en = localVal.bit_field.dma_en;
}

__STATIC_INLINE uint8_t dmac_dma_en_getf(void)
{
    return hwp_dmac->dmacfgreg_l.bit_field.dma_en;
}

__STATIC_INLINE void dmac_dma_en_setf(uint8_t dma_en)
{
    hwp_dmac->dmacfgreg_l.bit_field.dma_en = dma_en;
}

__STATIC_INLINE uint32_t dmac_chenreg_l_get(void)
{
    return hwp_dmac->chenreg_l.val;
}

__STATIC_INLINE void dmac_chenreg_l_set(uint32_t value)
{
    hwp_dmac->chenreg_l.val = value;
}

__STATIC_INLINE void dmac_chenreg_l_pack(uint8_t ch_en_we, uint8_t ch_en)
{
    hwp_dmac->chenreg_l.val = (((uint32_t)ch_en_we << 8) | ((uint32_t)ch_en << 0));
}

__STATIC_INLINE void dmac_chenreg_l_unpack(uint8_t* ch_en)
{
    T_DMAC_CHENREG_L localVal = hwp_dmac->chenreg_l;

    *ch_en = localVal.bit_field.ch_en;
}

__STATIC_INLINE uint8_t dmac_ch_en_getf(void)
{
    return hwp_dmac->chenreg_l.bit_field.ch_en;
}

__STATIC_INLINE uint32_t dmac_dmaidreg_l_get(void)
{
    return hwp_dmac->dmaidreg_l.val;
}

__STATIC_INLINE void dmac_dmaidreg_l_unpack(uint32_t* dmah_id_num)
{
    T_DMAC_DMAIDREG_L localVal = hwp_dmac->dmaidreg_l;

    *dmah_id_num = localVal.bit_field.dmah_id_num;
}

__STATIC_INLINE uint32_t dmac_dmah_id_num_getf(void)
{
    return hwp_dmac->dmaidreg_l.bit_field.dmah_id_num;
}

__STATIC_INLINE uint32_t dmac_dmatestreg_l_get(void)
{
    return hwp_dmac->dmatestreg_l.val;
}

__STATIC_INLINE void dmac_dmatestreg_l_set(uint32_t value)
{
    hwp_dmac->dmatestreg_l.val = value;
}

__STATIC_INLINE void dmac_dmatestreg_l_pack(uint8_t test_slv_if)
{
    hwp_dmac->dmatestreg_l.val = (((uint32_t)test_slv_if << 0));
}

__STATIC_INLINE void dmac_dmatestreg_l_unpack(uint8_t* test_slv_if)
{
    T_DMAC_DMATESTREG_L localVal = hwp_dmac->dmatestreg_l;

    *test_slv_if = localVal.bit_field.test_slv_if;
}

__STATIC_INLINE uint8_t dmac_test_slv_if_getf(void)
{
    return hwp_dmac->dmatestreg_l.bit_field.test_slv_if;
}

__STATIC_INLINE void dmac_test_slv_if_setf(uint8_t test_slv_if)
{
    hwp_dmac->dmatestreg_l.bit_field.test_slv_if = test_slv_if;
}

__STATIC_INLINE uint32_t dmac_dma_comp_params_3_l_get(void)
{
    return hwp_dmac->dma_comp_params_3_l.val;
}

__STATIC_INLINE void dmac_dma_comp_params_3_l_unpack(uint8_t* ch2_fifo_depth, uint8_t* ch2_sms, uint8_t* ch2_lms, uint8_t* ch2_dms, uint8_t* ch2_max_mult_size, uint8_t* ch2_fc, uint8_t* ch2_hc_llp, uint8_t* ch2_ctl_wb_en, uint8_t* ch2_multi_blk_en, uint8_t* ch2_lock_en, uint8_t* ch2_src_gat_en, uint8_t* ch2_dst_sca_en, uint8_t* ch2_stat_src, uint8_t* ch2_stat_dst, uint8_t* ch2_stw, uint8_t* ch2_dtw)
{
    T_DMAC_DMA_COMP_PARAMS_3_L localVal = hwp_dmac->dma_comp_params_3_l;

    *ch2_fifo_depth = localVal.bit_field.ch2_fifo_depth;
    *ch2_sms = localVal.bit_field.ch2_sms;
    *ch2_lms = localVal.bit_field.ch2_lms;
    *ch2_dms = localVal.bit_field.ch2_dms;
    *ch2_max_mult_size = localVal.bit_field.ch2_max_mult_size;
    *ch2_fc = localVal.bit_field.ch2_fc;
    *ch2_hc_llp = localVal.bit_field.ch2_hc_llp;
    *ch2_ctl_wb_en = localVal.bit_field.ch2_ctl_wb_en;
    *ch2_multi_blk_en = localVal.bit_field.ch2_multi_blk_en;
    *ch2_lock_en = localVal.bit_field.ch2_lock_en;
    *ch2_src_gat_en = localVal.bit_field.ch2_src_gat_en;
    *ch2_dst_sca_en = localVal.bit_field.ch2_dst_sca_en;
    *ch2_stat_src = localVal.bit_field.ch2_stat_src;
    *ch2_stat_dst = localVal.bit_field.ch2_stat_dst;
    *ch2_stw = localVal.bit_field.ch2_stw;
    *ch2_dtw = localVal.bit_field.ch2_dtw;
}

__STATIC_INLINE uint8_t dmac_ch2_fifo_depth_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_fifo_depth;
}

__STATIC_INLINE uint8_t dmac_ch2_sms_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_sms;
}

__STATIC_INLINE uint8_t dmac_ch2_lms_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_lms;
}

__STATIC_INLINE uint8_t dmac_ch2_dms_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_dms;
}

__STATIC_INLINE uint8_t dmac_ch2_max_mult_size_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_max_mult_size;
}

__STATIC_INLINE uint8_t dmac_ch2_fc_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_fc;
}

__STATIC_INLINE uint8_t dmac_ch2_hc_llp_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_hc_llp;
}

__STATIC_INLINE uint8_t dmac_ch2_ctl_wb_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_ctl_wb_en;
}

__STATIC_INLINE uint8_t dmac_ch2_multi_blk_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_multi_blk_en;
}

__STATIC_INLINE uint8_t dmac_ch2_lock_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_lock_en;
}

__STATIC_INLINE uint8_t dmac_ch2_src_gat_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_src_gat_en;
}

__STATIC_INLINE uint8_t dmac_ch2_dst_sca_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_dst_sca_en;
}

__STATIC_INLINE uint8_t dmac_ch2_stat_src_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_stat_src;
}

__STATIC_INLINE uint8_t dmac_ch2_stat_dst_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_stat_dst;
}

__STATIC_INLINE uint8_t dmac_ch2_stw_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_stw;
}

__STATIC_INLINE uint8_t dmac_ch2_dtw_getf(void)
{
    return hwp_dmac->dma_comp_params_3_l.bit_field.ch2_dtw;
}

__STATIC_INLINE uint32_t dmac_dma_comp_params_3_h_get(void)
{
    return hwp_dmac->dma_comp_params_3_h.val;
}

__STATIC_INLINE void dmac_dma_comp_params_3_h_unpack(uint8_t* ch1_fifo_depth, uint8_t* ch1_sms_ro, uint8_t* ch1_lms, uint8_t* ch1_dms_ro, uint8_t* ch1_max_mult_size, uint8_t* ch1_fc, uint8_t* ch1_hc_llp, uint8_t* ch1_ctl_wb_en, uint8_t* ch1_multi_blk_en, uint8_t* ch1_lock_en, uint8_t* ch1_src_gat_en, uint8_t* ch1_dst_sca_en, uint8_t* ch1_stat_src, uint8_t* ch1_stat_dst, uint8_t* ch1_stw, uint8_t* ch1_dtw)
{
    T_DMAC_DMA_COMP_PARAMS_3_H localVal = hwp_dmac->dma_comp_params_3_h;

    *ch1_fifo_depth = localVal.bit_field.ch1_fifo_depth;
    *ch1_sms_ro = localVal.bit_field.ch1_sms_ro;
    *ch1_lms = localVal.bit_field.ch1_lms;
    *ch1_dms_ro = localVal.bit_field.ch1_dms_ro;
    *ch1_max_mult_size = localVal.bit_field.ch1_max_mult_size;
    *ch1_fc = localVal.bit_field.ch1_fc;
    *ch1_hc_llp = localVal.bit_field.ch1_hc_llp;
    *ch1_ctl_wb_en = localVal.bit_field.ch1_ctl_wb_en;
    *ch1_multi_blk_en = localVal.bit_field.ch1_multi_blk_en;
    *ch1_lock_en = localVal.bit_field.ch1_lock_en;
    *ch1_src_gat_en = localVal.bit_field.ch1_src_gat_en;
    *ch1_dst_sca_en = localVal.bit_field.ch1_dst_sca_en;
    *ch1_stat_src = localVal.bit_field.ch1_stat_src;
    *ch1_stat_dst = localVal.bit_field.ch1_stat_dst;
    *ch1_stw = localVal.bit_field.ch1_stw;
    *ch1_dtw = localVal.bit_field.ch1_dtw;
}

__STATIC_INLINE uint8_t dmac_ch1_fifo_depth_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_fifo_depth;
}

__STATIC_INLINE uint8_t dmac_ch1_sms_ro_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_sms_ro;
}

__STATIC_INLINE uint8_t dmac_ch1_lms_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_lms;
}

__STATIC_INLINE uint8_t dmac_ch1_dms_ro_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_dms_ro;
}

__STATIC_INLINE uint8_t dmac_ch1_max_mult_size_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_max_mult_size;
}

__STATIC_INLINE uint8_t dmac_ch1_fc_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_fc;
}

__STATIC_INLINE uint8_t dmac_ch1_hc_llp_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_hc_llp;
}

__STATIC_INLINE uint8_t dmac_ch1_ctl_wb_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_ctl_wb_en;
}

__STATIC_INLINE uint8_t dmac_ch1_multi_blk_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_multi_blk_en;
}

__STATIC_INLINE uint8_t dmac_ch1_lock_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_lock_en;
}

__STATIC_INLINE uint8_t dmac_ch1_src_gat_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_src_gat_en;
}

__STATIC_INLINE uint8_t dmac_ch1_dst_sca_en_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_dst_sca_en;
}

__STATIC_INLINE uint8_t dmac_ch1_stat_src_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_stat_src;
}

__STATIC_INLINE uint8_t dmac_ch1_stat_dst_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_stat_dst;
}

__STATIC_INLINE uint8_t dmac_ch1_stw_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_stw;
}

__STATIC_INLINE uint8_t dmac_ch1_dtw_getf(void)
{
    return hwp_dmac->dma_comp_params_3_h.bit_field.ch1_dtw;
}

__STATIC_INLINE uint32_t dmac_dma_comp_params_2_l_get(void)
{
    return hwp_dmac->dma_comp_params_2_l.val;
}

__STATIC_INLINE void dmac_dma_comp_params_2_l_unpack(uint8_t* ch0_fifo_depth, uint8_t* ch0_sms_ro, uint8_t* ch0_lms, uint8_t* ch0_dms_ro, uint8_t* ch0_max_mult_size, uint8_t* ch0_fc, uint8_t* ch0_hc_llp, uint8_t* ch0_ctl_wb_en, uint8_t* ch0_multi_blk_en, uint8_t* ch0_lock_en, uint8_t* ch0_src_gat_en, uint8_t* ch0_dst_sca_en, uint8_t* ch0_stat_src, uint8_t* ch0_stat_dst, uint8_t* ch0_stw, uint8_t* ch0_dtw)
{
    T_DMAC_DMA_COMP_PARAMS_2_L localVal = hwp_dmac->dma_comp_params_2_l;

    *ch0_fifo_depth = localVal.bit_field.ch0_fifo_depth;
    *ch0_sms_ro = localVal.bit_field.ch0_sms_ro;
    *ch0_lms = localVal.bit_field.ch0_lms;
    *ch0_dms_ro = localVal.bit_field.ch0_dms_ro;
    *ch0_max_mult_size = localVal.bit_field.ch0_max_mult_size;
    *ch0_fc = localVal.bit_field.ch0_fc;
    *ch0_hc_llp = localVal.bit_field.ch0_hc_llp;
    *ch0_ctl_wb_en = localVal.bit_field.ch0_ctl_wb_en;
    *ch0_multi_blk_en = localVal.bit_field.ch0_multi_blk_en;
    *ch0_lock_en = localVal.bit_field.ch0_lock_en;
    *ch0_src_gat_en = localVal.bit_field.ch0_src_gat_en;
    *ch0_dst_sca_en = localVal.bit_field.ch0_dst_sca_en;
    *ch0_stat_src = localVal.bit_field.ch0_stat_src;
    *ch0_stat_dst = localVal.bit_field.ch0_stat_dst;
    *ch0_stw = localVal.bit_field.ch0_stw;
    *ch0_dtw = localVal.bit_field.ch0_dtw;
}

__STATIC_INLINE uint8_t dmac_ch0_fifo_depth_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_fifo_depth;
}

__STATIC_INLINE uint8_t dmac_ch0_sms_ro_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_sms_ro;
}

__STATIC_INLINE uint8_t dmac_ch0_lms_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_lms;
}

__STATIC_INLINE uint8_t dmac_ch0_dms_ro_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_dms_ro;
}

__STATIC_INLINE uint8_t dmac_ch0_max_mult_size_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_max_mult_size;
}

__STATIC_INLINE uint8_t dmac_ch0_fc_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_fc;
}

__STATIC_INLINE uint8_t dmac_ch0_hc_llp_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_hc_llp;
}

__STATIC_INLINE uint8_t dmac_ch0_ctl_wb_en_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_ctl_wb_en;
}

__STATIC_INLINE uint8_t dmac_ch0_multi_blk_en_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_multi_blk_en;
}

__STATIC_INLINE uint8_t dmac_ch0_lock_en_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_lock_en;
}

__STATIC_INLINE uint8_t dmac_ch0_src_gat_en_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_src_gat_en;
}

__STATIC_INLINE uint8_t dmac_ch0_dst_sca_en_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_dst_sca_en;
}

__STATIC_INLINE uint8_t dmac_ch0_stat_src_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_stat_src;
}

__STATIC_INLINE uint8_t dmac_ch0_stat_dst_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_stat_dst;
}

__STATIC_INLINE uint8_t dmac_ch0_stw_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_stw;
}

__STATIC_INLINE uint8_t dmac_ch0_dtw_getf(void)
{
    return hwp_dmac->dma_comp_params_2_l.bit_field.ch0_dtw;
}

__STATIC_INLINE uint32_t dmac_dma_comp_params_2_h_get(void)
{
    return hwp_dmac->dma_comp_params_2_h.val;
}

__STATIC_INLINE void dmac_dma_comp_params_2_h_unpack(uint8_t* ch7_multi_blk_type, uint8_t* ch6_multi_blk_type, uint8_t* ch5_multi_blk_type, uint8_t* ch4_multi_blk_type, uint8_t* ch3_multi_blk_type, uint8_t* ch2_multi_blk_type, uint8_t* ch1_multi_blk_type, uint8_t* ch0_multi_blk_type)
{
    T_DMAC_DMA_COMP_PARAMS_2_H localVal = hwp_dmac->dma_comp_params_2_h;

    *ch7_multi_blk_type = localVal.bit_field.ch7_multi_blk_type;
    *ch6_multi_blk_type = localVal.bit_field.ch6_multi_blk_type;
    *ch5_multi_blk_type = localVal.bit_field.ch5_multi_blk_type;
    *ch4_multi_blk_type = localVal.bit_field.ch4_multi_blk_type;
    *ch3_multi_blk_type = localVal.bit_field.ch3_multi_blk_type;
    *ch2_multi_blk_type = localVal.bit_field.ch2_multi_blk_type;
    *ch1_multi_blk_type = localVal.bit_field.ch1_multi_blk_type;
    *ch0_multi_blk_type = localVal.bit_field.ch0_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch7_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch7_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch6_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch6_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch5_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch5_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch4_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch4_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch3_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch3_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch2_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch2_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch1_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch1_multi_blk_type;
}

__STATIC_INLINE uint8_t dmac_ch0_multi_blk_type_getf(void)
{
    return hwp_dmac->dma_comp_params_2_h.bit_field.ch0_multi_blk_type;
}

__STATIC_INLINE uint32_t dmac_dma_comp_params_1_l_get(void)
{
    return hwp_dmac->dma_comp_params_1_l.val;
}

__STATIC_INLINE void dmac_dma_comp_params_1_l_unpack(uint8_t* ch7_max_blk_size, uint8_t* ch6_max_blk_size, uint8_t* ch5_max_blk_size, uint8_t* ch4_max_blk_size, uint8_t* ch3_max_blk_size, uint8_t* ch2_max_blk_size, uint8_t* ch1_max_blk_size, uint8_t* ch0_max_blk_size)
{
    T_DMAC_DMA_COMP_PARAMS_1_L localVal = hwp_dmac->dma_comp_params_1_l;

    *ch7_max_blk_size = localVal.bit_field.ch7_max_blk_size;
    *ch6_max_blk_size = localVal.bit_field.ch6_max_blk_size;
    *ch5_max_blk_size = localVal.bit_field.ch5_max_blk_size;
    *ch4_max_blk_size = localVal.bit_field.ch4_max_blk_size;
    *ch3_max_blk_size = localVal.bit_field.ch3_max_blk_size;
    *ch2_max_blk_size = localVal.bit_field.ch2_max_blk_size;
    *ch1_max_blk_size = localVal.bit_field.ch1_max_blk_size;
    *ch0_max_blk_size = localVal.bit_field.ch0_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch7_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch7_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch6_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch6_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch5_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch5_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch4_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch4_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch3_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch3_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch2_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch2_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch1_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch1_max_blk_size;
}

__STATIC_INLINE uint8_t dmac_ch0_max_blk_size_getf(void)
{
    return hwp_dmac->dma_comp_params_1_l.bit_field.ch0_max_blk_size;
}

__STATIC_INLINE uint32_t dmac_dma_comp_params_1_h_get(void)
{
    return hwp_dmac->dma_comp_params_1_h.val;
}

__STATIC_INLINE void dmac_dma_comp_params_1_h_unpack(uint8_t* static_endian_select, uint8_t* add_encoded_params, uint8_t* num_hs_int, uint8_t* m1_hdata_width, uint8_t* m2_hdata_width, uint8_t* m3_hdata_width, uint8_t* m4_hdata_width, uint8_t* s_hdata_width, uint8_t* number_master_int, uint8_t* num_channels, uint8_t* mabrst, uint8_t* intr_io, uint8_t* big_endian)
{
    T_DMAC_DMA_COMP_PARAMS_1_H localVal = hwp_dmac->dma_comp_params_1_h;

    *static_endian_select = localVal.bit_field.static_endian_select;
    *add_encoded_params = localVal.bit_field.add_encoded_params;
    *num_hs_int = localVal.bit_field.num_hs_int;
    *m1_hdata_width = localVal.bit_field.m1_hdata_width;
    *m2_hdata_width = localVal.bit_field.m2_hdata_width;
    *m3_hdata_width = localVal.bit_field.m3_hdata_width;
    *m4_hdata_width = localVal.bit_field.m4_hdata_width;
    *s_hdata_width = localVal.bit_field.s_hdata_width;
    *number_master_int = localVal.bit_field.number_master_int;
    *num_channels = localVal.bit_field.num_channels;
    *mabrst = localVal.bit_field.mabrst;
    *intr_io = localVal.bit_field.intr_io;
    *big_endian = localVal.bit_field.big_endian;
}

__STATIC_INLINE uint8_t dmac_static_endian_select_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.static_endian_select;
}

__STATIC_INLINE uint8_t dmac_add_encoded_params_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.add_encoded_params;
}

__STATIC_INLINE uint8_t dmac_num_hs_int_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.num_hs_int;
}

__STATIC_INLINE uint8_t dmac_m1_hdata_width_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.m1_hdata_width;
}

__STATIC_INLINE uint8_t dmac_m2_hdata_width_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.m2_hdata_width;
}

__STATIC_INLINE uint8_t dmac_m3_hdata_width_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.m3_hdata_width;
}

__STATIC_INLINE uint8_t dmac_m4_hdata_width_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.m4_hdata_width;
}

__STATIC_INLINE uint8_t dmac_s_hdata_width_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.s_hdata_width;
}

__STATIC_INLINE uint8_t dmac_number_master_int_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.number_master_int;
}

__STATIC_INLINE uint8_t dmac_num_channels_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.num_channels;
}

__STATIC_INLINE uint8_t dmac_mabrst_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.mabrst;
}

__STATIC_INLINE uint8_t dmac_intr_io_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.intr_io;
}

__STATIC_INLINE uint8_t dmac_big_endian_getf(void)
{
    return hwp_dmac->dma_comp_params_1_h.bit_field.big_endian;
}

__STATIC_INLINE uint32_t dmac_dmacompidreg_l_get(void)
{
    return hwp_dmac->dmacompidreg_l.val;
}

__STATIC_INLINE void dmac_dmacompidreg_l_unpack(uint32_t* dma_comp_type)
{
    T_DMAC_DMACOMPIDREG_L localVal = hwp_dmac->dmacompidreg_l;

    *dma_comp_type = localVal.bit_field.dma_comp_type;
}

__STATIC_INLINE uint32_t dmac_dma_comp_type_getf(void)
{
    return hwp_dmac->dmacompidreg_l.bit_field.dma_comp_type;
}

__STATIC_INLINE uint32_t dmac_dmacompidreg_h_get(void)
{
    return hwp_dmac->dmacompidreg_h.val;
}

__STATIC_INLINE void dmac_dmacompidreg_h_unpack(uint32_t* dma_comp_version)
{
    T_DMAC_DMACOMPIDREG_H localVal = hwp_dmac->dmacompidreg_h;

    *dma_comp_version = localVal.bit_field.dma_comp_version;
}

__STATIC_INLINE uint32_t dmac_dma_comp_version_getf(void)
{
    return hwp_dmac->dmacompidreg_h.bit_field.dma_comp_version;
}
#endif


