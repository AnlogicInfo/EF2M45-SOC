// Verilog netlist created by TD v4.2.285
// Thu Aug 23 19:19:51 2018

`timescale 1ns / 1ps
module AL_MCU  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(14)
  (
  gpio_h0_in,
  h2h_hrdata,
  h2h_hreadyout,
  h2h_hresp,
  h2h_mclk,
  h2h_rstn,
  ppm_clk,
  gpio_h0_oe_n,
  gpio_h0_out,
  h2h_haddr,
  h2h_hburst,
  h2h_hprot,
  h2h_hsize,
  h2h_htrans,
  h2h_hwdata,
  h2h_hwrite
  );

  input gpio_h0_in;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(46)
  input [31:0] h2h_hrdata;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(38)
  input h2h_hreadyout;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(39)
  input [1:0] h2h_hresp;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(40)
  input h2h_mclk;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(41)
  input h2h_rstn;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(42)
  input ppm_clk;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(43)
  output gpio_h0_oe_n;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(45)
  output gpio_h0_out;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(44)
  output [31:0] h2h_haddr;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(31)
  output [2:0] h2h_hburst;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(35)
  output [3:0] h2h_hprot;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(36)
  output [2:0] h2h_hsize;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(34)
  output [1:0] h2h_htrans;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(32)
  output [31:0] h2h_hwdata;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(37)
  output h2h_hwrite;  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(33)


  EF2_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EF2_PHY_MCU #(
    .GPIO_L0("ENABLE"),
    .GPIO_L1("ENABLE"),
    .GPIO_L10("DISABLE"),
    .GPIO_L11("DISABLE"),
    .GPIO_L12("DISABLE"),
    .GPIO_L13("DISABLE"),
    .GPIO_L14("DISABLE"),
    .GPIO_L15("DISABLE"),
    .GPIO_L2("DISABLE"),
    .GPIO_L3("DISABLE"),
    .GPIO_L4("DISABLE"),
    .GPIO_L5("DISABLE"),
    .GPIO_L6("DISABLE"),
    .GPIO_L7("ENABLE"),
    .GPIO_L8("DISABLE"),
    .GPIO_L9("DISABLE"))
    mcu_inst (
    .gpio_h_in({15'b000000000000000,gpio_h0_in}),
    .h2h_hrdata(h2h_hrdata),
    .h2h_hreadyout(h2h_hreadyout),
    .h2h_hresp(h2h_hresp),
    .h2h_mclk(h2h_mclk),
    .h2h_rstn(h2h_rstn),
    .ppm_clk(ppm_clk),
    .gpio_h_oe_n({open_n58,open_n59,open_n60,open_n61,open_n62,open_n63,open_n64,open_n65,open_n66,open_n67,open_n68,open_n69,open_n70,open_n71,open_n72,gpio_h0_oe_n}),
    .gpio_h_out({open_n73,open_n74,open_n75,open_n76,open_n77,open_n78,open_n79,open_n80,open_n81,open_n82,open_n83,open_n84,open_n85,open_n86,open_n87,gpio_h0_out}),
    .h2h_haddr(h2h_haddr),
    .h2h_hburst(h2h_hburst),
    .h2h_hprot(h2h_hprot),
    .h2h_hsize(h2h_hsize),
    .h2h_htrans(h2h_htrans),
    .h2h_hwdata(h2h_hwdata),
    .h2h_hwrite(h2h_hwrite));  // F:/SVN_ELF2_SOC/trunk/Basic_Demo/AHB_Demo/AHB_FPGA144/al_ip/AL_MCU.v(67)

endmodule 

