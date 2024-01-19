`include "./src/control/instructions.v"

module alu(in1, in2, op, funct, zero, overflow, out);

parameter WIDTH = 16;

input [WIDTH-1:0] in1, in2;
input [7:0] op;
input funct;

output reg [WIDTH-1:0] out;

output reg zero;
output reg overflow;

always @(*) begin
    case(op)
        `NOT:   out <= !in1;
        `XOR:   out <= in1 ^ in2;
        `OR:    out <= in1 | in2;
        `AND:   out <= in1 & in2;
        `SUB:   out <= in1 - in2;
        `ADD:   out <= in1 + in2;
        `RR:    out <= {in1[0], in1[(WIDTH-1):1]};
        `RL:    out <= {in1[(WIDTH-2):0], in1[(WIDTH-1)]};
        `DEC:   out <= in1 - 1'b1;
        `INC:   out <= in1 + 1'b1;
        `LD:    out <= in2;
        `ST:    out <= 16'd0;
        `NOP:   out <= 16'd0;
        `LDI:   out <= in1;
        `JMP:   out <= 16'd0;
        `RST:   out <= 16'd0;
        default: out <= 16'd0;
    endcase
    zero <= (out==0)?1:0;

end

endmodule

