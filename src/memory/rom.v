`timescale 1ns/1ps
`include "./src/control/instructions.v"

module rom(addr, data);

parameter RAM_WORD_WIDTH = 24;
parameter RAM_ADDR_BITS = 4;

input [(2**RAM_ADDR_BITS)-1 : 0] addr;
output reg [RAM_WORD_WIDTH-1 : 0] data;


reg [RAM_WORD_WIDTH-1:0] mem [(2**RAM_ADDR_BITS)-1:0];

// test
initial begin
	mem [0]  = {`NOP,	16'h0};
	mem [1]  = {`LDI,	16'h5};
	mem [2]  = {`ST,	16'h1};
	mem [3]  = {`LDI,	16'h3};
	mem [4]  = {`ADD,	16'h1};
	mem [5]  = {`ST,	16'h2};
	mem [6]  = {`NOP,	16'h0};
	mem [7]  = {`NOP, 	16'h0};
	mem [8]  = {`LD, 	16'h2};
	mem [9]  = {`INC,	16'h0};
	mem [10] = {`JMP,	16'h9};
	mem [11] = {`RST,	16'h0};
	
	// mem [0]  = {`NOP,	16'h0};
	// mem [1]  = {`LDI,	16'h5};
	// mem [2]  = {`ST,	16'h1};
	// mem [3]  = {`LDI,	16'h3};
	// mem [4]  = {`ST,	16'h1};
	// mem [5]  = {`LD,	16'h0};
	// mem [6]  = {`ST,	16'h2};
	// mem [7]  = {`LD, 	16'h0};
	// mem [8]  = {`ADD, 	16'h2};
	// mem [9]  = {`RST,	16'h0};
end

always @(*) begin
    data <= mem[addr];
end

endmodule

