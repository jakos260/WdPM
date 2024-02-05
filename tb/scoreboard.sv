`include "./tb/ref/acu_ref.v"
`include "./tb/ref/alu_ref.v"

class scoreboard;
  mailbox mon_mbx;
  int trans_cnt;


  //ref AcuAlu model
  bit [15:0] data_out;
  bit [15:0] data_in;
  bit [15:0] alu_out;
  bit [7:0] op;
  bit zero;

  alu_ref #(.WIDTH(16)) alu_ref(
		.in1(data_in),
		.in2(data_out),
		.op(op),
		.out(alu_out));

  acu_ref #(.WIDTH(16)) acu_ref(
		.in(alu_out),
		.zero(zero),
		.out(data_out));

  
  
  //constructor
  function new(mailbox mon_mbx);
    this.mon_mbx = mon_mbx;
    // nothing?
  endfunction
  
  //stores 
  task main;
    transaction trans;
    forever
    begin
      #50;
      mon_mbx.get(trans);
      if(trans.op) // use always(negedge clk) ?
      begin
        if(data_out != trans.data_out) 
          $error("[SCOREBOARD] OPcode = %0h IN = %0h Data Expected = %0h Data Actual = %0h", op, data_in, data_out, trans.data_out);
        else 
        begin
          $display("[SCOREBOARD] OPcode = %0h IN = %0h Data Expected = %0h Data Actual = %0h", op, data_in, data_out, trans.data_out);
        end
      end

      trans_cnt++;
    end
  endtask
  
endclass