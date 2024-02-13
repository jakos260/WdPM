module io_ports(
    clk, en, r_or_w, io_addr, data_in, data_out,
    d0_io, d1_io, d2_io, d3_io);

    parameter BITS = 16;

    input clk, en, r_or_w; // r_or_w => 1 = write, 0 = read
    input       [3:0] io_addr;
    input       [BITS-1:0] data_in;
    output reg  [BITS-1:0] data_out;

    wire direction;
    assign direction = r_or_w;
    initial data_out = 16'dz;

    // io list
    inout            d0_io;
    inout            d1_io;
    inout            d2_io;
    inout            d3_io;

    // port output wires list
    wire            d0_out;
    wire            d1_out;
    wire            d2_out;
    wire            d3_out;

    always @(negedge clk) begin
        if(en) begin
            case(io_addr)
                4'b0000: data_out <= {15'd0, d0_out};
                4'b0001: data_out <= {15'd0, d1_out};
                4'b0010: data_out <= {15'd0, d2_out};
                4'b0011: data_out <= {15'd0, d3_out};
                default: data_out <= 16'd0;
            endcase
        end
        else
            data_out <= 16'd0;
    end
    
    digital_io D0 (
        .clk(clk),
        .en(io_addr == 4'b0000 ? en : 1'b0),
        .direction(direction),
        .data_in(data_in[0]),
        .data_out(d0_out),
        .io_port(d0_io)
    );
    
    digital_io D1 (
        .clk(clk),
        .en(io_addr == 4'b0001 ? en : 1'b0),
        .direction(direction),
        .data_in(data_in[0]),
        .data_out(d1_out),
        .io_port(d1_io)
    );
    
    digital_io D2 (
        .clk(clk),
        .en(io_addr == 4'b0010 ? en : 1'b0),
        .direction(direction),
        .data_in(data_in[0]),
        .data_out(d2_out),
        .io_port(d2_io)
    );
    
    digital_io D3 (
        .clk(clk),
        .en(io_addr == 4'b0011 ? en : 1'b0),
        .direction(direction),
        .data_in(data_in[0]),
        .data_out(d3_out),
        .io_port(d3_io)
    );

endmodule
