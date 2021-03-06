/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mem.v
 ** Date	:	2018 08 07
 ** TD version	:	4.2.217
\************************************************************/

`timescale 1ns / 1ps

module mem ( doa, dia, addra, cea, clka, wea, rsta );

	output [31:0] doa;

	input  [31:0] dia;
	input  [10:0] addra;
	input  [3:0] wea;
	input  cea;
	input  clka;
	input  rsta;




	EF2_LOGIC_BRAM #( .DATA_WIDTH_A(32),
				.ADDR_WIDTH_A(11),
				.DATA_DEPTH_A(2048),
				.DATA_WIDTH_B(32),
				.ADDR_WIDTH_B(11),
				.DATA_DEPTH_B(2048),
				.BYTE_ENABLE(8),
				.BYTE_A(4),
				.BYTE_B(4),
				.MODE("SP"),
				.REGMODE_A("NOREG"),
				.WRITEMODE_A("NORMAL"),
				.RESETMODE("SYNC"),
				.IMPLEMENT("9K"),
				.DEBUGGABLE("YES"),
				.PACKABLE("NO"),
				.FORCE_KEEP("ON"),
				.INIT_FILE("NONE"),
				.FILL_ALL("00000000000000000000000000000000"))
			inst(
				.dia(dia),
				.dib({32{1'b0}}),
				.addra(addra),
				.addrb({11{1'b0}}),
				.cea(cea),
				.ceb(1'b0),
				.ocea(1'b0),
				.oceb(1'b0),
				.clka(clka),
				.clkb(1'b0),
				.wea(1'b0),
				.bea(wea),
				.web(1'b0),
				.rsta(rsta),
				.rstb(1'b0),
				.doa(doa),
				.dob());


endmodule