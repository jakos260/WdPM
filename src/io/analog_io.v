module analog_io(clk, en, direction, data_in, data_out, io_port);
    parameter BITS = 16;

    input   clk;        // The standard clock    
    input   en;         // Enable signal
    input   direction;  // Direction of io, 1 = set output, 0 = read input
    input   [BITS-1:0] data_in;    // Data to send out when direction is 1
    output  [BITS-1:0] data_out;   // Result of input pin when direction is 0
    inout   [BITS-1:0] io_port;     // The i/o port to send data through

    reg [BITS-1:0] a;
    reg [BITS-1:0] b;    

    assign io_port  = en ? (direction ? a : 16'bz) : io_port;
    assign data_out = b;

    initial begin
        a = 16'dz;
        b = 16'dz;
    end

    always @ (*) begin
        if(en) begin
            b <= io_port;
            a <= data_in;
        end
    end
endmodule