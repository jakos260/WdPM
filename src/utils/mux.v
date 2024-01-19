module mux(in1, in2, out, sel);

    parameter WIDTH = 16;

    input [WIDTH-1:0] in1, in2;
    input sel;
    output reg [WIDTH-1:0] out;

    always@(*) begin
        case(sel)
            1'b0: out <= in1; // acu
            1'b1: out <= in2; // ldi
        endcase
    end
endmodule