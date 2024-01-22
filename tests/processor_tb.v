`timescale 1ns/1ps

module processor_tb;
integer i;

// Clock and reset signals
reg clk = 1'b1;
reg rst = 1'b0;

// Design Inputs and outputs
// wire out [3:0];

// DUT instantiation
processor P(
    .clk_in(clk),
    .rst_in(rst)
);

// generate the clock
// initial begin
//     clk = 1'b0;
//     forever #1 clk = ~clk;
// end

// Generate the reset
// initial begin
//     reset = 1'b1;
//     #10
//     reset = 1'b0;
// end

// Test stimulus
initial begin

    // Use the monitor task to display the FPGA IO
    // $monitor("time=%3d, q=%2b \n", $time, out);
    // Generate each input with a 20 ns delay between them
    for (i = 0; i<100; i++) begin
        #1 clk = ~clk;        
    end
    #1   
    rst = 1;
    #1
    rst = 0;
    $finish;
end

initial begin
    $dumpfile("tests/up_tb.vcd");
    $dumpvars(0, processor_tb);
    $dumpon;
end

endmodule
