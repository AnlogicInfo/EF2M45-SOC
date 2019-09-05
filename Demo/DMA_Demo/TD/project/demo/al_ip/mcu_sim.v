// Verilog netlist created by TD v4.2.217
// Tue Aug  7 10:38:18 2018

`timescale 1ns / 1ps
module mcu  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(14)
  (
  gpio_h0_in,
  gpio_h1_in,
  gpio_h2_in,
  gpio_h3_in,
  h2h_hrdata,
  h2h_hreadyout,
  h2h_hresp,
  h2h_mclk,
  h2h_rstn,
  ppm_rstn,
  gpio_h0_oe_n,
  gpio_h0_out,
  gpio_h1_oe_n,
  gpio_h1_out,
  gpio_h2_oe_n,
  gpio_h2_out,
  gpio_h3_oe_n,
  gpio_h3_out,
  h2h_haddr,
  h2h_hburst,
  h2h_hprot,
  h2h_hsize,
  h2h_htrans,
  h2h_hwdata,
  h2h_hwrite
  );

  input gpio_h0_in;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(55)
  input gpio_h1_in;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(58)
  input gpio_h2_in;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(61)
  input gpio_h3_in;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(64)
  input [31:0] h2h_hrdata;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(47)
  input h2h_hreadyout;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(48)
  input [1:0] h2h_hresp;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(49)
  input h2h_mclk;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(50)
  input h2h_rstn;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(51)
  input ppm_rstn;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(52)
  output gpio_h0_oe_n;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(54)
  output gpio_h0_out;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(53)
  output gpio_h1_oe_n;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(57)
  output gpio_h1_out;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(56)
  output gpio_h2_oe_n;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(60)
  output gpio_h2_out;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(59)
  output gpio_h3_oe_n;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(63)
  output gpio_h3_out;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(62)
  output [31:0] h2h_haddr;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(40)
  output [2:0] h2h_hburst;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(44)
  output [3:0] h2h_hprot;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(45)
  output [2:0] h2h_hsize;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(43)
  output [1:0] h2h_htrans;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(41)
  output [31:0] h2h_hwdata;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(46)
  output h2h_hwrite;  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(42)


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
    .GPIO_L7("DISABLE"),
    .GPIO_L8("DISABLE"),
    .GPIO_L9("DISABLE"))
    mcu_inst (
    .gpio_h_in({12'b000000000000,gpio_h3_in,gpio_h2_in,gpio_h1_in,gpio_h0_in}),
    .h2h_hrdata(h2h_hrdata),
    .h2h_hreadyout(h2h_hreadyout),
    .h2h_hresp(h2h_hresp),
    .h2h_mclk(h2h_mclk),
    .h2h_rstn(h2h_rstn),
    .ppm_rstn(ppm_rstn),
    .gpio_h_oe_n({open_n58,open_n59,open_n60,open_n61,open_n62,open_n63,open_n64,open_n65,open_n66,open_n67,open_n68,open_n69,gpio_h3_oe_n,gpio_h2_oe_n,gpio_h1_oe_n,gpio_h0_oe_n}),
    .gpio_h_out({open_n70,open_n71,open_n72,open_n73,open_n74,open_n75,open_n76,open_n77,open_n78,open_n79,open_n80,open_n81,gpio_h3_out,gpio_h2_out,gpio_h1_out,gpio_h0_out}),
    .h2h_haddr(h2h_haddr),
    .h2h_hburst(h2h_hburst),
    .h2h_hprot(h2h_hprot),
    .h2h_hsize(h2h_hsize),
    .h2h_htrans(h2h_htrans),
    .h2h_hwdata(h2h_hwdata),
    .h2h_hwrite(h2h_hwrite));  // E:/ELF2_SOC/trunk/Basic_Demo/AHB_Demo/TD/project/demo/al_ip/mcu.v(84)

endmodule 

