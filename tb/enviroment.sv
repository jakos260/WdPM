class environment;
    generator gen;
    driver    driv;
    monitor   mon;
    scoreboard scb;
    mailbox   env_mbx_drv;
    mailbox   env_mbx_mon;
    event gen_ended;
    virtual fifo_intf fifo_virt_intf;
    
endclass