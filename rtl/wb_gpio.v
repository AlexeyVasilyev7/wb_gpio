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

  reg [7:0] oen;
  reg [7:0] out;

  wire wb_transaction = wb_cyc_i && wb_stb_i;
  wire wb_write = wb_we_i && wb_transaction;
  wire wb_read = !wb_we_i && wb_transaction;
  
  assign gpio_oen_o = oen;
  assign gpio_out_o = out;
  
  always @(posedge clk_sys_i or negedge rst_n_i)
    if(!rst_n_i)
      wb_ack_o <= 0;
    else if(wb_transaction)
      wb_ack_o <= 1;
    else
      wb_ack_o <= 0;
  
  always @(posedge clk_sys_i or negedge rst_n_i)
    if(!rst_n_i)
      wb_dat_o <= 0;
    else if(wb_read)
      case (wb_adr_i) 
        //some wb logic
        default    : wb_dat_o <= 0;
      endcase
endmodule