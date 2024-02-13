class driver;
int trans_cnt; //number of transactions
  virtual acualu_intf acualu_intf;
  mailbox drv_mbx;
    
  //constructor
  function new(virtual acualu_intf acualu_virt_intf, mailbox drv_mbx);
    this.acualu_virt_intf = acualu_virt_intf;
    this.drv_mbx = drv_mbx;
  endfunction
  
  
  // Reset task
  task reset;
    wait(acualu_virt_intf.rst);
    $display("[DRIVER] reset started");
      acualu_virt_intf.driver_mode.driver_clk_block.data_in <= 0;
      acualu_virt_intf.driver_mode.driver_clk_block.op <= 8'h15; // rst
    wait(!acualu_virt_intf.rst);
    $display("[DRIVER] reset finished");
  endtask
  
  // Drive task
  task drive;
    forever
    begin
      transaction trans;

      drv_mbx.get(trans);
      $display("[DRIVER] transfer: %0d ]", trans_cnt);
      
      @(posedge acualu_virt_intf.driver_mode.clk);

      acualu_virt_intf.driver_mode.driver_clk_block.data_in <= trans.data_in;
      acualu_virt_intf.driver_mode.driver_clk_block.op <= trans.op;      
      trans_cnt++;

    end
  endtask
         
endclass