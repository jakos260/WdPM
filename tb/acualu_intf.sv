interface alu_intf(input logic clk, ce);
  logic [15:0]  data_out;  
  logic [15:0]  data_in;  
  logic [7:0]   op;
  logic         zero;
  
  //driver clocking block
  clocking driver_clk_block @(posedge clk);
    default input #1 output #1;
    output data_in;
    output push;
    output pop;
    input  data_out;  
  endclocking
  
  //monitor clocking block
  clocking monitor_clk_block @(posedge clk);
    default input #1 output #1;
    input data_in;
    input push;
    input pop;
    input data_out;
  endclocking
  
  //driver modport
  modport driver_mode  (clocking driver_clk_block, input clk, reset, clr);
  
  //monitor modport  
  modport monitor_mode (clocking monitor_clk_block, input clk, reset, clr);
  
endinterface