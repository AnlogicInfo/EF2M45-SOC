/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	F:/SVN_ELF2_SOC/trunk/Basic_Demo/BRAM_Demo/exchange_FPGA144/al_ip/bram256kbit.v
 ** Date	:	2018 08 23
 ** TD version	:	4.2.285
\************************************************************/

`timescale 1ns / 1ps

module bram256kbit ( dob,dib,ceb,oceb,clkb,web,rstb,addrb,webbyte );
	output 		[31:0] dob;
	input  		[31:0] dib;
	input  		ceb;
	input  		oceb;
	input  		clkb;
	input  		web;
	input  		rstb;
	input  		[12:0] addrb;
	input  		[3:0] webbyte;


		EF2_PHY_BRAM256K #(
		.MODE("SP"),
		.REGMODE_B("OUTREG"),
		.WRITEMODE_B("NORMAL"),
		.INIT_FILE("NONE"))

		inst (
		.dia(32'b0),
		.dib(dib),
		.cea(1'b0),
		.ceb(ceb),
		.ocea(1'b0),
		.oceb(oceb),
		.clka(1'b0),
		.clkb(clkb),
		.wea(1'b0),
		.web(web),
		.rsta(1'b0),
		.rstb(rstb),
		.addra(13'b0),
		.addrb(addrb),
		.weabyte(4'b0),
		.webbyte(webbyte),
		.doa(),
		.dob(dob));

endmodule