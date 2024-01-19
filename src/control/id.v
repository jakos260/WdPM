`timescale 1ns/1ps
`include "./src/control/instructions.v"

module id (instr, op, ldi, rf_en, acu_en, rst, jmp_en, r_or_w);

    parameter INSTR_WIDTH = 2;
    parameter OP_WIDTH = 4;

    input [7:0] instr;
    output reg [7:0] op;
    output reg rst, ldi, rf_en, acu_en, jmp_en, r_or_w;

    initial {rst, ldi, r_or_w, rf_en, acu_en, jmp_en} = {6'b0_0_0_010};


    always @(*) begin
        case(instr)
            8'd0:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_010, `NOT}; // not
            8'd1:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_110, `XOR}; // xor
            8'd2:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_110, `OR};  // or
            8'd3:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_110, `AND}; // and
            8'd4:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_110, `SUB}; // sub
            8'd5:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_110, `ADD}; // add
            8'd6:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_010, `RR};  // rr
            8'd7:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_010, `RL};  // rl
            8'd8:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_010, `DEC}; // dec
            8'd9:     {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_010, `INC}; // inc
            8'd10:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_110, `LD};  // ld
            8'd11:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_1_100, `ST};  // st
            8'd12:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_000, `NOP}; // nop
            8'd13:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_1_0_010, `LDI}; // ldi
            8'd14:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b0_0_0_001, `JMP}; // jmp
            8'd15:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd16:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd17:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd18:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd19:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd20:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd21:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd22:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd23:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd23:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd24:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd25:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd26:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd27:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd28:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd29:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd30:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
            8'd31:    {rst, ldi, r_or_w, rf_en, acu_en, jmp_en, op} <= {6'b1_0_0_000, `RST}; // rst
        endcase
    end
endmodule




