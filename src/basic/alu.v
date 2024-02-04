`include "./src/control/instructions.v"

module alu(in1, in2, op, overflow, out);

parameter WIDTH = 16;

input [WIDTH-1:0] in1, in2;
input [7:0] op;

output reg overflow;
output reg [WIDTH-1:0] out;

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
        `CMP:   out <= in1 >= in2 ? 16'd1 : 16'd0;
        `JMP:   out <= out;
        `JMA:   out <= out;
        `CLL:   out <= out;
        `RET:   out <= out;
        `LD:    out <= in2;
        `ST:    out <= out;
        `IOR:   out <= in2;
        `IOW:   out <= out;
        `LDI:   out <= in1;
        `NOP:   out <= out;
        `RST:   out <= 16'd0;
        default: out <= 16'd0;
    endcase

end

endmodule

