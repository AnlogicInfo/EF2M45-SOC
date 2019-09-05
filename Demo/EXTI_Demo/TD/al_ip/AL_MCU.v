/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	F:/SVN_ELF2_SOC/trunk/Basic_Demo/GPIO_Demo/INTC_TD/al_ip/AL_MCU.v
 ** Date	:	2018 08 08
 ** TD version	:	4.2.217
\************************************************************/

`timescale 1ns / 1ps

module AL_MCU ( ppm_clk,
	gpio_h0_out,
	gpio_h0_oe_n,
	gpio_h0_in,
	gpio_h1_out,
	gpio_h1_oe_n,
	gpio_h1_in );

	input	ppm_clk;
	output	gpio_h0_out;
	output	gpio_h0_oe_n;
	input	gpio_h0_in;
	output	gpio_h1_out;
	output	gpio_h1_oe_n;
	input	gpio_h1_in;
	EF2_PHY_MCU #(
		.GPIO_L0("ENABLE"),
		.GPIO_L1("ENABLE"),
		.GPIO_L7("ENABLE"))
	mcu_inst(
		.ppm_clk(ppm_clk),
		.gpio_h_out({open,open,open,open,open,open,open,open,open,open,open,open,open,open,gpio_h1_out,gpio_h0_out}),
		.gpio_h_oe_n({open,open,open,open,open,open,open,open,open,open,open,open,open,open,gpio_h1_oe_n,gpio_h0_oe_n}),
		.gpio_h_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,gpio_h1_in,gpio_h0_in}));
endmodule