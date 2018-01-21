module wb_gpio (
  input clk_sys_i,
  input rst_n_i,
  
  input  [7:0] gpio_in_i,
  output [7:0] gpio_oen_o,
  output [7:0] gpio_out_o,
  
  output reg [31:0] wb_dat_o,
  input [4:0] wb_adr_i,
  input [31:0] wb_dat_i,
  //input wb_sel_i,
  input wb_stb_i,
  input wb_cyc_i,
  input wb_we_i,
  output reg wb_ack_o
);

// logic for gpio
endmodule