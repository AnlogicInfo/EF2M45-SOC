/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	C:/Users/Administrator/Desktop/UCRTEST/AHBTEST/ucrtest/al_ip/mem.v
 ** Date	:	2018 07 09
 ** TD version	:	4.2.088
\************************************************************/

`timescale 1ns / 1ps

module mem ( doa, dia, addra, cea, clka, wea, rsta );

	output [31:0] doa;

	input  [31:0] dia;
	input  [10:0] addra;
	input  wea;
	input  cea;
	input  clka;
	input  rsta;


wire [31:0]dob;/* synthesis keep */
wire [7:0]dob_debug=dob[7:0];/* synthesis keep */
reg [10:0]addrb;/* synthesis keep */
always @(posedge clka )
begin

        addrb<=addrb+1;
end

	EF2_LOGIC_BRAM #( .DATA_WIDTH_A(32),
				.ADDR_WIDTH_A(11),
				.DATA_DEPTH_A(2048),
				.DATA_WIDTH_B(32),
				.ADDR_WIDTH_B(11),
				.DATA_DEPTH_B(2048),
				.MODE("DP"),
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
				.addrb(addrb),
				.cea(cea),
				.ceb(1'b1),
				.ocea(1'b0),
				.oceb(1'b0),
				.clka(clka),
				.clkb(clka),
				.wea(wea),
				.web(1'b0),
				.bea(1'b0),
				.beb(1'b0),
				.rsta(rsta),
				.rstb(1'b0),
				.doa(doa),
				.dob(dob));


endmodule