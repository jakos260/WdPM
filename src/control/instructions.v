`define NOT 8'h00
`define XOR 8'h01
`define OR  8'h02
`define AND 8'h03
`define SUB 8'h04
`define ADD 8'h05
`define RR  8'h06
`define RL  8'h07
`define DEC 8'h08
`define INC 8'h09
`define JMP 8'h0A // jump
`define JMA 8'h0B // jump if acu != 0
`define CLL 8'h0C // Call   - skok z adresem powrotu
`define RET 8'h0D // Return - adres powrotu
`define LD  8'h0E // load register -> accumulator
`define ST  8'h0F // store accumulator -> register
`define LDI 8'h10 // load rom -> accumulator
`define NOP 8'h11
`define RST 8'h12

/*
    case(instr)
        4'd0:     {rst, decoded} <= {1'b0, `NOT}; // not
        4'd1:     {rst, decoded} <= {1'b0, `XOR}; // xor
        4'd2:     {rst, decoded} <= {1'b0, `OR};  // or
        4'd3:     {rst, decoded} <= {1'b0, `AND}; // and
        4'd4:     {rst, decoded} <= {1'b0, `SUB}; // sub
        4'd5:     {rst, decoded} <= {1'b0, `ADD}; // add
        4'd6:     {rst, decoded} <= {1'b0, `RR};  // rr
        4'd7:     {rst, decoded} <= {1'b0, `RL};  // rl
        4'd8:     {rst, decoded} <= {1'b0, `DEC}; // dec
        4'd9:     {rst, decoded} <= {1'b0, `INC}; // inc
        4'd10:    {rst, decoded} <= {1'b0, `LD};  // ld
        4'd11:    {rst, decoded} <= {1'b0, `ST};  // st
        4'd12:    {rst, decoded} <= {1'b0, `NOP}; // nop
        4'd13:    {rst, decoded} <= {1'b0, `NOP}; // nop
        4'd14:    {rst, decoded} <= {1'b1, `RST}; // rst
        4'd15:    {rst, decoded} <= {1'b1, `RST}; // rst
        default:  {rst, decoded} <= {1'b1, `RST}; // rst
    endcase
*/