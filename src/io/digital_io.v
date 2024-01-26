module digital_io(clk, en, direction, data_in, data_out, io_port);


    input   clk;        // The standard clock    
    input   en;         // Enable signal
    input   direction;  // Direction of io, 1 = set output, 0 = read input
    input   data_in;    // Data to send out when direction is 1
    output  data_out;   // Result of input pin when direction is 0
    inout   io_port;     // The i/o port to send data through

    reg a, b;    

    assign io_port  = en ? (direction ? a : 1'bz) : io_port;
    assign data_out = b;

    initial begin
        a = 1'dz;
        b = 1'dz;
    end

    always @ (*)
    begin
        if(en) begin
            b <= io_port;
            a <= data_in;
        end
    end
endmodule