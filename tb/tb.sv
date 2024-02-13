program test(acualu_intf intf);
  environment env;
  
  initial 
  begin
    env = new(intf);
    env.gen.repeat_tests = 8;
    env.run();
  end
endprogram

module testbench_top;
    bit clk;
    bit rst;
    
    //clock generation
    always #5 clk = ~clk;
    
    //
    initial
    begin
        clr = 1;
    	rst = 0;
        #10 rst = 1;
        #10 rst = 0;
    end
    
    //interface
    acualu_intf intf(clk, rst);
    
    //testcase
    test test1(intf);
    
    //DUT
    acu_alu dut( 
        .clk(intf.clk),
        .ce(intf.ce),
        .zero(intf.zero)
        .op(intf.op),
        .in(intf.data_in),
        .out(intf.data_out)
    );

endmodule