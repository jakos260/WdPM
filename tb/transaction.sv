class transaction;
  rand bit [7:0]  data_out;  
  rand bit [7:0]  data_in;  
  rand bit        push;
  rand bit        pop;

  //example constaint
  constraint push_pop_constr { push != pop; }; 

endclass