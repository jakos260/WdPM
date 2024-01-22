`timescale 1ns/1ps
`include "./src/control/instructions.v"

module id (instr, op, acu_zero, ldi, rf_en, acu_en, rst, jmp_en, r_or_w, stack_flags, stack_control);

    // parameter INSTR_WIDTH = 2;
    // parameter OP_WIDTH = 4;

    input [7:0] instr;
    input acu_zero;
    output reg [7:0] op;
    output reg rst, ldi, rf_en, acu_en, jmp_en, r_or_w;

    input [1:0] stack_flags; // FULL EMPTY
    output reg [1:0] stack_control; // PUSH POP

    initial {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control} = {8'b0_0_0_010_00};


    always @(*) begin
        case(instr)
            8'h00:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_010_00, `NOT}; // not
            8'h01:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_110_00, `XOR}; // xor
            8'h02:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_110_00, `OR};  // or
            8'h03:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_110_00, `AND}; // and
            8'h04:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_110_00, `SUB}; // sub
            8'h05:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_110_00, `ADD}; // add
            8'h06:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_010_00, `RR};  // rr
            8'h07:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_010_00, `RL};  // rl
            8'h08:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_010_00, `DEC}; // dec
            8'h09:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_010_00, `INC}; // inc
            8'h0A:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_001_00, `JMP}; // jmp
            8'h0B:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {5'b0_0_0_00, ~acu_zero, 2'b00, `JMA}; // jmp (if acu != 0)
            8'h0C:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {6'b0_0_0_001, stack_flags[1] == 0 ? 2'b10 : 2'b00, `CLL}; // call (push stack if not full)
            8'h0D:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {6'b0_0_0_001, stack_flags[0] == 0 ? 2'b01 : 2'b00, `RET}; // return (pop stack if not empty)
            8'h0E:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_110_00, `LD};  // ld
            8'h0F:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_1_100_00, `ST};  // st
            8'h10:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_1_0_010_00, `LDI}; // ldi
            8'h11:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_000_00, `NOP}; // nop
            8'h12:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b1_0_0_000_00, `RST}; // rst
            default:  {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, stack_control, op} <= {8'b0_0_0_000_00, `NOP}; // nop
        endcase
    end
endmodule




