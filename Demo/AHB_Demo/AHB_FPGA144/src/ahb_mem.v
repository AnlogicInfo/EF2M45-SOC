//*****************************************************************************
//
// SYNOPSYS PROFESSIONAL SERVICES - Turnkey Design 
// 
// Filename    : ahb_mem.v
// Author(s)   : Hannes Nurminen, hannesn@synopsys.com
//
// Description :
//   RAM/ROM interface block for AHB-bus. This block provides zero wait state
//   write and read access to RAM (and zero wait state read access to ROM).
//   Address and data bus widths are configurable, also selection between
//   asynchronous or synchronous memory interface is configurable.
//
//   Configuration settings for the ahb_mem (configure using defines)
//     ADDR_W       Needed bus width for byte-addressing the memory
//     DATA_W_32    When defined, data bus width of AHB and memory is 32 bits
//     READ_ONLY    When defined, memory type is ROM otherwise RAM
//     SYNCHRONOUS  When defined, memory interface type is synchronous 
//                  otherwise asynchronous
//     BIG_ENDIAN   When defined, big-endian AHB bus interfacing
//
//   How to use:
//     1. Edit directly this file to set the correct parameter (define)
//        values
//     2. In case of multiple instances with different parameters in the
//        design create unique file and module name for each instance
//        (separate ahb_mem verilog- files required since parameters fixed
//        in the file)
//
//   Note:
//     - AHB-data bus width must match with the memory address bus width
//     - With asynchronous RAM configuration additional sub block
//       "quart_cycle_delay" is needed. This component must create quarter
//       clock cycle delay (needed in write enable pulse creation).
//
//       Example quart_cycle_delay for simulations purposes:
//          module quart_cycle_delay(din, dout);
//            input  din;
//            output dout;
//            reg    dout;
//            always @(din)
//              #5 dout <= din;
//          endmodule
//
//   Size information
//
//     Exact flip-flop count
//
//       register name       | signal width on SRAM  | signal width on ROM
//       --------------------+-----------------------+----------------------
//       int_mem_byte_enable | DATA_W/8              | 0
//       haddr_r             | ADDR_W-log2(DATA_W/8) | ADDR_W-log2(DATA_W/8)
//       int_mem_we_i        | 1                     | 0
//
//     Gate count examples (Virtex 1000, ADDR_W=32)
//
//       DATA_W | RAM-config (FlipFlops) | ROM-config  (FFs)
//       -------+------------------------+-------------------
//           32 |        514        (36) |        426   (30)
//   
//*****************************************************************************



//-----------------------------------------------------------------------------
// USER CONFIGURABLE PARAMETERS

// Width of the AHB address bus
`define ADDR_W 35                                 // SET THIS VALUE

// Width of the data buses (32/64/128/256 bits)   // UNCOMMENT ONE WIDTH LINE
`define DATA_W_32;

// Select if RAM or ROM is used (define this only when ROM used)
//`define READ_ONLY                               // UNCOMMENT FOR RAM

// Select if memory interface is synchronous or asynchronous
`define SYNCHRONOUS                               // UNCOMMENT FOR SYNCH RAM

// Select if little or big endian data is used on AHB bus
//`define BIG_ENDIAN

//
//-----------------------------------------------------------------------------


// INTERNAL PARAMETERS
//
// Construct useful new defines which simplify verilog code. Thus no need to
// check address and data bus widths in each verilog line when data or address
// bus is accessed. Instead these predefined constants can be used (constants
// will be set according to the user above parameters).
//
`ifdef DATA_W_32        // 32-bit data bus:
 `define DATA_W 32      //  Data bus width constant
 `define LSB_DSCRD 22    //  Number of LSB address bits not connected to the mem
 `define BE_W 4         //  Width of the byte enable
`endif
   
// Define ranges with discarded least significant bits
`define ADDR_RANGE_NO_LSB `ADDR_W - 1 - `LSB_DSCRD :2
   
// Define ranges after LSB discarding
`define ADDR_RANGE_W `ADDR_W - 1 - `LSB_DSCRD : 0

module ahb_mem (
		 // AHB-slave interface
		 hclk,               // in, clock
		 hresetn,            // in, asynchronous reset
		 haddr,              // in, ahb address bus
		 hsel,               // in, slave select
		 hready,             // in, ready status 
		 hsize,              // in, size of the transfer
		 hwrite,             // in, write enable
		 htrans,             // in, transfer mode
		 hwdata,             // in, write data
		 hready_resp,        // out, transfer ready (always high)
		 hresp,              // out, transfer status (always okay)
		 hrdata,             // out, read data
		 
		 // Memory interface
		 int_mem_rdata,      // in, read data
		 int_mem_addr,       // out, mem addr
		 int_mem_clk,        // out clock for the memory (same as hclk)
		 int_mem_we,         // out, write enable
		 int_mem_re,         // out, read enable
		 int_mem_wdata,      // out, write data
		 int_mem_byte_enable // out, byte enable
		 );

   // Internal constants, defined in AMBA Specification Rev 2.0
`define SEQ    2'b11
`define NONSEQ 2'b10

   //--------------------------------------------------------------------------
   //
   // I/O declarations
   //
   //--------------------------------------------------------------------------
   
   // AHB-slave interface
   input                hclk;
   input                hresetn;
   input [`ADDR_W-1:0]  haddr;
   input 	        	hsel;
   input                hready;
   input [2:0] 			hsize;
   input 				hwrite;
   input [1:0] 			htrans;
   input [`DATA_W-1:0] 	hwdata;
   output 	        	hready_resp;
   output [1:0]         hresp;
   output [`DATA_W-1:0] hrdata;

   // SRAM interface
   input [`DATA_W-1:0]  int_mem_rdata;
   output 		  		int_mem_we;
   output 		  		int_mem_re;
   output [`DATA_W-1:0] int_mem_wdata;
   output [`BE_W-1:0] 	int_mem_byte_enable;
   output	          	int_mem_clk;
   output [`ADDR_RANGE_W] int_mem_addr;
		 
   //--------------------------------------------------------------------------
   //
   // Internal signals
   //
   //--------------------------------------------------------------------------
   reg [`ADDR_RANGE_W] 	  haddr_r;
   reg  		  int_mem_re_r;
   wire  		  int_mem_re_i;
   wire 		  we_level;

`ifdef READ_ONLY
   // No byte enable or write enable registers on ROM version
`else
   // Registers for write enable and byte enable on RAM
   reg 			  int_mem_we_i;
   reg [`BE_W-1:0]int_mem_byte_enable;
   reg            hready_resp;
   reg 			  re_later;
 			  
`endif

`ifdef SYNCHRONOUS
   // No special signals needed with synchronous RAM
`else
   // Additional signals needed for asynchronous RAM WE
   wire 		  delayed_hclk;
`endif
   
   //--------------------------------------------------------------------------
   //
   // Processes & actual logic
   //
   //--------------------------------------------------------------------------

   //--------------------------------------------------------------------------
   //
   // Write byte enable signals to the memory. Number of enable bits 
   // controlled by the DATA_W parameter.
   //
   // enable_wr_bytes
   //
   //--------------------------------------------------------------------------

`ifdef READ_ONLY

   //--------------------------------------------------------------------------
   // On ROM write byte enables always low
   //--------------------------------------------------------------------------
   assign int_mem_byte_enable = `BE_W'h0;

`else
 `ifdef DATA_W_32
   //--------------------------------------------------------------------------
   // Write byte enables for 32-bit RAM
   //--------------------------------------------------------------------------
   always @(posedge hclk or negedge hresetn)
     if (~hresetn)
       int_mem_byte_enable <= 4'b0000;
     else
       case (hsize)
	 3'b000 :                            // Access size 8-bits
	   begin
	      case (haddr[1:0])
  `ifdef SRAM_BIG_ENDIAN
		2'd0    : int_mem_byte_enable <= 1'b1 << 3;
		2'd1    : int_mem_byte_enable <= 1'b1 << 2;
		2'd2    : int_mem_byte_enable <= 1'b1 << 1;
		default : int_mem_byte_enable <= 1'b1 << 0;
  `else
		2'd0    : int_mem_byte_enable <= 1'b1 << 0;
		2'd1    : int_mem_byte_enable <= 1'b1 << 1;
		2'd2    : int_mem_byte_enable <= 1'b1 << 2;
		default : int_mem_byte_enable <= 1'b1 << 3;
  `endif
	      endcase
	   end
	 3'b001 :                            // Access size 16-bits
	   begin
	      if (haddr[1] == 1'b0)
  `ifdef SRAM_BIG_ENDIAN
		int_mem_byte_enable <= 2'b11 << 2;
  `else
		int_mem_byte_enable <= 2'b11 << 0;
  `endif
	      else
  `ifdef SRAM_BIG_ENDIAN
		int_mem_byte_enable <= 2'b11 << 0;
  `else
		int_mem_byte_enable <= 2'b11 << 2;
  `endif
	   end
	 default :                           // Access size 32-bits
	   int_mem_byte_enable <= 4'b1111;
       endcase 
 `endif
   
`endif

   //--------------------------------------------------------------------------
   //
   // Register for address and mux for selecting registered (write) or
   // unregister (read) address to the ram.
   //
   // fast_read_addr_mux
   //--------------------------------------------------------------------------
   always @(posedge hclk or negedge hresetn)
     if (~hresetn)
       haddr_r <= `DATA_W'h0;
     else
       if (hsel & hready)
	 begin
	    haddr_r <= haddr[`ADDR_RANGE_NO_LSB];
	 end
   // multiplex either registerd or unregisterd address to the ram
`ifdef SYNCHRONOUS
 `ifdef READ_ONLY
   // For synchronous ROM
   assign int_mem_addr = hready ?  haddr[`ADDR_RANGE_NO_LSB] : haddr_r;
   assign int_mem_re   = int_mem_re_i;
 `else
   // For synchronous RAM
   assign int_mem_addr = (~int_mem_we_i & hready & hsel) ? haddr[`ADDR_RANGE_NO_LSB] 
	  : haddr_r;
   assign int_mem_re   = int_mem_re_i;
 `endif
`else
   // For asynchronous ROM and RAM
   assign int_mem_addr = haddr_r;
   assign int_mem_re   = int_mem_re_r;
   always @(posedge hclk or negedge hresetn)
     if (~hresetn)
       int_mem_re_r <= 1'b0;
     else
       int_mem_re_r <= int_mem_re_i;
`endif
   
   //--------------------------------------------------------------------------
   //
   // Response to the AHB-bus (always ready except between write and read)
   //
   // response
   //
   //--------------------------------------------------------------------------
   assign hresp = 2'b00;
`ifdef READ_ONLY
   assign hready_resp = 1'b1;
`else
   always @(posedge hclk or negedge hresetn)
     if (~hresetn)
       hready_resp <= 1'b1;
     else
       if (hsel == 1'b1 &
	   hwrite == 1'b0 &
	   !(htrans == 2'b00 | htrans == 2'b01) &
	   we_level == 1'b1)
	 hready_resp <= 1'b0;
       else
	 hready_resp <= 1'b1;
   
`endif

   //--------------------------------------------------------------------------
   //
   // Write enable to the RAM
   //
   // we_auth_reg
   //--------------------------------------------------------------------------
`ifdef READ_ONLY
   // No active WE for ROM
   assign int_mem_we = 1'b0;
`else
   // Create internal WE
   always @(posedge hclk or negedge hresetn)
     if (~hresetn)
       int_mem_we_i <= 1'b0;
     else
	 int_mem_we_i <= hready & hsel & hwrite &
			 (htrans == `SEQ | htrans == `NONSEQ);
   assign we_level = int_mem_we_i;
 `ifdef SYNCHRONOUS
   // Synchronous RAM: Use hready to enable WE pulse outputting
   assign int_mem_we = we_level;
 `else
   // Asynchronous RAM: Create pulse from internal WE and Clock (and hready)
   assign int_mem_we = we_level & delayed_hclk;

   // Delay component for the clock
   quart_cycle_delay i_quart_cycle_delay
     (.din(hclk),
      .dout(delayed_hclk));
      
 `endif
`endif   
   


   
   //--------------------------------------------------------------------------
   //
   // Read enable to the RAM
   //
   //--------------------------------------------------------------------------
`ifdef READ_ONLY
   // Always active read enable (ROM)
   assign int_mem_re_i = 1'b1;
`else
   // Store AHB-read state (needed if write ongoing during AHB-read)
   always @(posedge hclk or negedge hresetn)
     begin
	if (~hresetn)
	  begin
	     re_later <= 1'b0;
	  end
	else
	  begin
	     if (hsel & ~hwrite & (htrans == `SEQ | htrans == `NONSEQ) &
		 int_mem_we_i)
	       re_later <= 1'b1;
	     else
	       re_later <= 1'b0;
	  end
     end
   // Create read enable to RAM
   assign int_mem_re_i = (hsel & ~hwrite    & ~int_mem_we_i &
			(htrans == `SEQ | htrans == `NONSEQ))   |
		       re_later;
`endif
   

   //--------------------------------------------------------------------------
   // pass_through
   //--------------------------------------------------------------------------
`ifdef READ_ONLY
   // Write data from ROM always zero
   assign int_mem_wdata = `DATA_W'h0;
`else
   // Write data for RAM
   assign int_mem_wdata = hwdata;  
`endif
   assign hrdata = int_mem_rdata;
   assign int_mem_clk = hclk;

   //--------------------------------------------------------------------------
   // Report configuration paramters if requested
   //--------------------------------------------------------------------------
   // synopsys translate_off
`define SHOW_PARAMS
`ifdef SHOW_PARAMS
   initial
     begin
	$display("Ahb_mem configuration:");
	$display(" ADDR_W:     %d", `ADDR_W);
	$display(" DATA_W:     %d", `DATA_W);
 `ifdef READ_ONLY
	$display(" READ_ONLY:           true");
 `else
	$display(" READ_ONLY:           false");
 `endif

 `ifdef SYNCHRONOUS
	$display(" SYNCHRONOUS:         true");
 `else
	$display(" SYNCHRONOUS:         false");
 `endif

 `ifdef SRAM_BIG_ENDIAN
	$display(" SRAM_BIG_ENDIAN:          true");
 `else
	$display(" SRAM_BIG_ENDIAN:          false");
 `endif

	$display(" (LSB_DSCRD:%d)", `LSB_DSCRD);
	$display(" (BE_W:     %d)", `BE_W);
     end
`endif
   // synopsys translate_on


   
   
endmodule