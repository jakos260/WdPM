class monitor;
    virtual acualu_intf acualu_virt_intf;
    mailbox             mon_mbx;
    transaction         trans;
    
    //constructor
    function new(virtual acualu_intf acualu_virt_intf, mailbox mon_mbx);
        this.acualu_virt_intf = acualu_virt_intf;
        this.mon_mbx = mon_mbx;
    endfunction
    
    //++
    task main;
        forever
        begin
            trans = new();

            @(posedge acualu_virt_intf.monitor_mode.clk);

            trans.data_out  = acualu_virt_intf.monitor_mode.monitor_clk_block.data_out;
            trans.data_in   = acualu_virt_intf.monitor_mode.monitor_clk_block.data_in;
            trans.op        = acualu_virt_intf.monitor_mode.monitor_clk_block.op;
            trans.zero      = acualu_virt_intf.monitor_mode.monitor_clk_block.zero;

            mon_mbx.put(trans);
        end
    endtask
  
endclass