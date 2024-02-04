module a(ce, clk, in, out, zero);

parameter WIDTH = 4;

input ce, clk;
input [WIDTH-1:0] in;
output zero;
output reg [WIDTH-1:0] out;

initial begin
    out <= 16'd0;
end
assign zero = (out == 16'd0) ? 1'd1 : 1'd0;

always @(negedge clk) begin
    if(ce) begin
        out <= in;
    end
end

endmodule