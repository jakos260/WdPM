`timescale 1ns/1ps
`include "./src/control/instructions.v"

module id (instr, op, acu_zero, ldi, rf_en, io_en, r_or_w, acu_en, rst, jmp_en, stack_flags, stack_control);

    // parameter INSTR_WIDTH = 2;
    // parameter OP_WIDTH = 4;

    input [7:0] instr;
    input acu_zero;
    output reg [7:0] op;
    output reg rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en;

    input [1:0] stack_flags; // FULL EMPTY
    output reg [1:0] stack_control; // PUSH POP

    initial {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control} = {9'b0_1_0_000_000}; // enable acu on init


    always @(*) begin
        case(instr)
            8'h00:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_000_000, `NOT}; // not
            8'h01:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_100_000, `XOR}; // xor
            8'h02:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_100_000, `OR};  // or
            8'h03:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_100_000, `AND}; // and
            8'h04:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_100_000, `SUB}; // sub
            8'h05:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_100_000, `ADD}; // add
            8'h06:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_000_000, `RR};  // rr
            8'h07:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_000_000, `RL};  // rl
            8'h08:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_000_000, `DEC}; // dec
            8'h09:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_000_000, `INC}; // inc
            8'h0A:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_100_000, `CMP}; // cmp
            8'h0B:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_000_100, `JMP}; // jmp
            8'h0C:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {6'b0_0_0_000, ~acu_zero, 2'b00, `JMA}; // jmp (if acu != 0)
            8'h0D:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {7'b0_0_0_000_1, stack_flags[1] == 0 ? 2'b10 : 2'b00, `CLL}; // call (push stack if not full)
            8'h0E:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {7'b0_0_0_000_1, stack_flags[0] == 0 ? 2'b01 : 2'b00, `RET}; // return (pop stack if not empty)
            8'h0F:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_100_000, `LD};  // ld
            8'h10:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_0_0_101_000, `ST};  // st
            8'h11:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_0_010_000, `IOR}; // ior
            8'h12:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_0_0_011_000, `IOW}; // iow
            8'h13:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_1_1_000_000, `LDI}; // ldi
            8'h14:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_0_0_000_000, `NOP}; // nop
            8'h15:    {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b1_0_0_000_000, `RST}; // rst
            default:  {rst, acu_en, ldi, rf_en, io_en, r_or_w, jmp_en, stack_control, op} <= {9'b0_0_0_000_000, `NOP}; // nop
        endcase
    end
endmodule




