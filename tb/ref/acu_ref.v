module acu_ref(in, out, zero);

parameter WIDTH = 16;

input [WIDTH-1:0] in;
output reg zero;
output reg [WIDTH-1:0] out;

initial begin
    out <= 16'd0;
    zero <= 0;
end

always @(*) begin
    out <= in;
    zero <= (in == 0) ? 1 : 0;
end

endmodule