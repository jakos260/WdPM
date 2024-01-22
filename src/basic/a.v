module a(ce, clk, in, out, zero);

parameter WIDTH = 4;

input ce, clk;
input [WIDTH-1:0] in;
output reg zero;
output reg [WIDTH-1:0] out;

initial begin
    out <= 16'd0;
    zero <= 0;
end

always @(negedge clk) begin
    if(ce) begin
        out <= in;
        zero <= (in == 0) ? 1 : 0;
    end
end

endmodule