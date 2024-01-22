`timescale 1ns/1ps

module processor(clk_in, rst_in, out);

	input clk_in;
	input rst_in;
	output reg [15:0] out;

	reg rst = 1'b0;

	wire rst_id, ldi, acu_en, rf_en, jmp_en;
	wire[15:0] pc_bits;
	wire[23:0] rom_data; // 8op + 16data
	wire[15:0] alu_out;
	wire[15:0] acu_out;
	wire[15:0] reg_out;
	wire[15:0] mux_out;

	wire[7:0] op;

	wire r_or_w;
	wire acu_zero;
	wire alu_overflow;

	wire stack_push, stack_pop, stack_full, stack_empty;
	wire [15:0] ret_addr;

	initial out <= 16'd0;
	always @(*) begin
		rst <= rst_in || rst_id;
		out <= alu_out;
	end

	counter ProgramCounter(
		.clk(clk_in),
		.rst(rst),
		.jmp_en(jmp_en),
		.jmp_addr(jmp_en ? (stack_pop ? ret_addr+1'b1 : rom_data[15:0]) : 16'bz),
		.pc(pc_bits)
	);

	rom #(.RAM_WORD_WIDTH(24), .RAM_ADDR_BITS(4)) Rom
	(	.addr(pc_bits),
		.data(rom_data));

	id InstructionDecoder(
		.instr(rom_data[23:16]),
		.op(op),
		.acu_zero(acu_zero),
		.rst(rst_id),
		.ldi(ldi),
		.acu_en(acu_en),
		.rf_en(rf_en),
		.jmp_en(jmp_en),
		.r_or_w(r_or_w),
		.stack_flags({stack_full, stack_empty}),
		.stack_control({stack_push, stack_pop})
	);

	alu #(.WIDTH(16)) Alu(
		.in1(mux_out),
		.in2(reg_out),
		.op(op),
	    .overflow(alu_overflow),
		.out(alu_out)
	);

	a #(.WIDTH(16)) Accumulator(
		.clk(clk_in),
		.ce(acu_en),
		.in(alu_out),
		.zero(acu_zero),
		.out(acu_out)
	);

	registers #(.REG_NUM(16), .WIDTH(16)) Registers(
		.clk(clk_in),
		.en(rf_en),
		.r_or_w(r_or_w),
		.reg_addr(rf_en ? rom_data[15:0] : 16'bz),
		.in(acu_out),
		.out(reg_out)
	);

	mux #(.WIDTH(16)) Mux(
		.in1(acu_out),
		.in2(rom_data[15:0]),
		.out(mux_out),
		.sel(ldi)
	);

	stack #(.WIDTH(16)) Stack(
		.clk(clk_in),
		.rst(rst),
		.push(stack_push),
		.pop(stack_pop),
		.data_in(pc_bits),
		.data_out(ret_addr),
		.full(stack_full),
		.empty(stack_empty)
	);

endmodule