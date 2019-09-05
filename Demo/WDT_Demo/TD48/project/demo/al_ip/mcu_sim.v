// Verilog netlist created by TD v4.2.169
// Wed Aug  1 14:54:25 2018

`timescale 1ns / 1ps
module mcu  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(14)
  (
  gpio_h0_in,
  gpio_h1_in,
  gpio_h2_in,
  gpio_h3_in,
  ppm_rstn,
  gpio_h0_oe_n,
  gpio_h0_out,
  gpio_h1_oe_n,
  gpio_h1_out,
  gpio_h2_oe_n,
  gpio_h2_out,
  gpio_h3_oe_n,
  gpio_h3_out
  );

  input gpio_h0_in;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(31)
  input gpio_h1_in;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(34)
  input gpio_h2_in;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(37)
  input gpio_h3_in;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(40)
  input ppm_rstn;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(28)
  output gpio_h0_oe_n;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(30)
  output gpio_h0_out;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(29)
  output gpio_h1_oe_n;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(33)
  output gpio_h1_out;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(32)
  output gpio_h2_oe_n;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(36)
  output gpio_h2_out;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(35)
  output gpio_h3_oe_n;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(39)
  output gpio_h3_out;  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(38)


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
    .ppm_rstn(ppm_rstn),
    .gpio_h_oe_n({open_n95,open_n96,open_n97,open_n98,open_n99,open_n100,open_n101,open_n102,open_n103,open_n104,open_n105,open_n106,gpio_h3_oe_n,gpio_h2_oe_n,gpio_h1_oe_n,gpio_h0_oe_n}),
    .gpio_h_out({open_n107,open_n108,open_n109,open_n110,open_n111,open_n112,open_n113,open_n114,open_n115,open_n116,open_n117,open_n118,gpio_h3_out,gpio_h2_out,gpio_h1_out,gpio_h0_out}));  // C:/Users/Administrator/Desktop/ELF2M45/Demo/newproject_1/TD/project/demo/al_ip/mcu.v(48)

endmodule 

