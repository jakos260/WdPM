class monitor;
    virtual acualu_intf acualu_virt_intf;
    mailbox mon_mbx;
    
    //constructor
    function new(virtual acualu_intf acualu_virt_intf, mailbox mon_mbx);
        this.acualu_virt_intf = acualu_virt_intf;
        this.mon_mbx = mon_mbx;
    endfunction
    
    //++
    task main;
        forever
        begin
            transaction trans;
            trans = new();

            @(posedge acualu_virt_intf.monitor_mode.clk);

            begin // todo
            end 

            mon_mbx.put(trans);
        end
    endtask
  
endclass