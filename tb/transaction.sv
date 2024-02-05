class transaction;
  rand bit [7:0]  data_out;  
  rand bit [7:0]  data_in;  
  rand bit        zero;
  rand bit        op;

  //example constaint
  constraint op_constr { op < 8'h16; }; // max opcode, 

endclass