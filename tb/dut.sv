`include "./src/basic/a.v"
`include "./src/basic/alu.v"

module dut(clk, ce, zero, op, in, out);

    input clk, ce;
    input [7:0] op;
    input [15:0] in;
    output zero;
    output [15:0] out;

    wire [15:0] acu_out;

    alu #(.WIDTH(16)) Alu(
		.in1(acu_out),
		.in2(in),
		.op(op),
		.out(out)
	);

	a #(.WIDTH(16)) Accumulator(
		.clk(clk),
		.ce(ce),
		.in(out),
		.zero(zero),
		.out(acu_out)
	);


endmodule