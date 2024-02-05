class environment;
    generator gen;
    driver    driv;
    monitor   mon;
    scoreboard scb;
    mailbox   env_mbx_drv;
    mailbox   env_mbx_mon;
    event gen_ended;
    virtual acualu_intf acualu_virt_intf;
    
function new(virtual acualu_intf acualu_virt_intf);
    this.acualu_virt_intf = acualu_virt_intf;
    env_mbx_drv = new();
    env_mbx_mon = new();
    gen = new(env_mbx_drv,gen_ended);
    driv = new(acualu_virt_intf,env_mbx_drv);
    mon  = new(acualu_virt_intf,env_mbx_mon);
    scb  = new(env_mbx_mon);
  endfunction

  task pre_test();
    driv.reset();
  endtask
  
  task test();
    fork 
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join_any
  endtask
  
  task post_test();
    wait(gen_ended.triggered);
    wait(gen.repeat_tests == driv.trans_cnt);
    wait(gen.repeat_tests == scb.trans_cnt);
  endtask  
  
  //run task
  task run;
    pre_test();
    test();
    post_test();
    $finish;
  endtask
  
endclass