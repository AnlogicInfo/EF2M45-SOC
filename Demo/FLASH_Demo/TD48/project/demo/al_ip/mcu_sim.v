// Verilog netlist created by TD v4.2.285
// Wed Sep  5 17:04:05 2018

`timescale 1ns / 1ps
module mcu  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(14)
  (
  gpio_h0_in,
  gpio_h1_in,
  gpio_h2_in,
  gpio_h3_in,
  ppm_rstn,
  qspi_rxd,
  gpio_h0_oe_n,
  gpio_h0_out,
  gpio_h1_oe_n,
  gpio_h1_out,
  gpio_h2_oe_n,
  gpio_h2_out,
  gpio_h3_oe_n,
  gpio_h3_out,
  qspi_oen,
  qspi_sclk,
  qspi_ss,
  qspi_txd
  );

  input gpio_h0_in;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(41)
  input gpio_h1_in;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(44)
  input gpio_h2_in;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(47)
  input gpio_h3_in;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(50)
  input ppm_rstn;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(38)
  input [3:0] qspi_rxd;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(33)
  output gpio_h0_oe_n;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(40)
  output gpio_h0_out;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(39)
  output gpio_h1_oe_n;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(43)
  output gpio_h1_out;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(42)
  output gpio_h2_oe_n;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(46)
  output gpio_h2_out;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(45)
  output gpio_h3_oe_n;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(49)
  output gpio_h3_out;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(48)
  output [3:0] qspi_oen;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(37)
  output qspi_sclk;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(35)
  output qspi_ss;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(36)
  output [3:0] qspi_txd;  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(34)


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
    .qspi_rxd(qspi_rxd),
    .gpio_h_oe_n({open_n91,open_n92,open_n93,open_n94,open_n95,open_n96,open_n97,open_n98,open_n99,open_n100,open_n101,open_n102,gpio_h3_oe_n,gpio_h2_oe_n,gpio_h1_oe_n,gpio_h0_oe_n}),
    .gpio_h_out({open_n103,open_n104,open_n105,open_n106,open_n107,open_n108,open_n109,open_n110,open_n111,open_n112,open_n113,open_n114,gpio_h3_out,gpio_h2_out,gpio_h1_out,gpio_h0_out}),
    .qspi_oen(qspi_oen),
    .qspi_sclk(qspi_sclk),
    .qspi_ss(qspi_ss),
    .qspi_txd(qspi_txd));  // G:/ELF2_SOC_Shanghai/trunk/Demo/FLASH_Demo/TD48/project/demo/al_ip/mcu.v(63)

endmodule 

