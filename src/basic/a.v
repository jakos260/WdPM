module a(ce, clk, in, out);

parameter WIDTH = 4;

input ce, clk;
input [WIDTH-1:0] in;
output reg [WIDTH-1:0] out;

initial out <= 16'd0;

always @(negedge clk) begin
    if(ce) out <= in;
    else out <= out; // ---
end

endmodule