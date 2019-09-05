/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v
 ** Date	:	2018 09 05
 ** TD version	:	4.2.285
\************************************************************/

`timescale 1ns / 1ps

module mcu ( ppm_rstn,
	qspi_rxd,
	qspi_txd,
	qspi_sclk,
	qspi_ss,
	qspi_oen,
	gpio_h0_out,
	gpio_h0_oe_n,
	gpio_h0_in,
	gpio_h1_out,
	gpio_h1_oe_n,
	gpio_h1_in,
	gpio_h2_out,
	gpio_h2_oe_n,
	gpio_h2_in,
	gpio_h3_out,
	gpio_h3_oe_n,
	gpio_h3_in );

	input	[3:0]	qspi_rxd;
	output	[3:0]	qspi_txd;
	output	qspi_sclk;
	output	qspi_ss;
	output	[3:0]	qspi_oen;
	input	ppm_rstn;
	output	gpio_h0_out;
	output	gpio_h0_oe_n;
	input	gpio_h0_in;
	output	gpio_h1_out;
	output	gpio_h1_oe_n;
	input	gpio_h1_in;
	output	gpio_h2_out;
	output	gpio_h2_oe_n;
	input	gpio_h2_in;
	output	gpio_h3_out;
	output	gpio_h3_oe_n;
	input	gpio_h3_in;
	EF2_PHY_MCU #(
		.GPIO_L0("ENABLE"),
		.GPIO_L1("ENABLE"))
	mcu_inst(
		.ppm_rstn(ppm_rstn),
		.qspi_rxd(qspi_rxd),
		.qspi_txd(qspi_txd),
		.qspi_sclk(qspi_sclk),
		.qspi_ss(qspi_ss),
		.qspi_oen(qspi_oen),
		.gpio_h_out({open,open,open,open,open,open,open,open,open,open,open,open,gpio_h3_out,gpio_h2_out,gpio_h1_out,gpio_h0_out}),
		.gpio_h_oe_n({open,open,open,open,open,open,open,open,open,open,open,open,gpio_h3_oe_n,gpio_h2_oe_n,gpio_h1_oe_n,gpio_h0_oe_n}),
		.gpio_h_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,gpio_h3_in,gpio_h2_in,gpio_h1_in,gpio_h0_in}));
endmodule