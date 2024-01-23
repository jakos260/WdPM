class scoreboard;
  mailbox mon_mbx;
  int trans_cnt;


  //ref FIFO model
  bit [7:0] mem[15:0];
  bit [3:0] read_pointer;
  bit [3:0] write_pointer;
  //etc.
  
  //constructor
  function new(mailbox mon_mbx);
    this.mon_mbx = mon_mbx;
    foreach(mem[i]) mem[i] = 8'h0;
  endfunction
  
  //stores 
  task main;
    transaction trans;
    forever
    begin
      #50;
      mon_mbx.get(trans);
      if(trans.pop)
      begin
        if(mem[read_pointer] != trans.data_out) 
          $error("[SCOREBOARD] Data Expected = %0h Data Actual = %0h",mem[read_pointer],trans.data_out);
        else 
        begin
          $display(("[SCOREBOARD] Data Expected = %0h Data Actual = %0h",mem[read_pointer],trans.data_out);
          //pointer mechanics, etc.
        end
      end
      else 
      if(trans.push)
      begin
        mem[write_pointer] = trans.data_in;
        //pointer mechanics, etc.
      end

      trans_cnt++;
    end
  endtask
  
endclass