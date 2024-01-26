`timescale 1ns/1ps
`include "./src/control/instructions.v"

module rom(clk, addr, data);

parameter RAM_WORD_WIDTH = 24;
parameter RAM_ADDR_BITS = 8;

input clk;
input [RAM_ADDR_BITS-1 : 0] addr;
output reg [RAM_WORD_WIDTH-1 : 0] data;


reg [RAM_WORD_WIDTH-1:0] mem [(2**RAM_ADDR_BITS)-1:0];

// test
initial begin
	// test 1
	// mem [0]  = {`NOP,	16'h0};
	// mem [1]  = {`LDI,	16'h5};
	// mem [2]  = {`ST,	16'h1};
	// mem [3]  = {`LDI,	16'h3};
	// mem [4]  = {`ADD,	16'h1};
	// mem [5]  = {`ST,	16'h2};
	// mem [6]  = {`NOP,	16'h0};
	// mem [7]  = {`NOP, 	16'h0};
	// mem [8]  = {`LD, 	16'h2};
	// mem [9]  = {`INC,	16'h0};
	// mem [10] = {`JMP,	16'h9};
	// mem [11] = {`RST,	16'h0};

	//test 2
	// mem [0]  	= {`NOP,	16'h0};
	// mem [1]		= {`CLL,	16'd20};
	// mem [2]  	= {`LD, 	16'h2};
	// mem [2]  	= {`RST, 	16'h0};
	// mem [20] 	= {`LDI,	16'h5};
	// mem [21]  	= {`ST,		16'h1};
	// mem [22]  	= {`LDI,	16'h3};
	// mem [23]  	= {`ADD,	16'h1};
	// mem [24]  	= {`ST,		16'h2};
	// mem [25]  	= {`RET,	16'h0};

	
	//test 3
	// mem [0]  	= {`NOP,	16'h0};
	// mem [1]		= {`CLL,	16'd4};
	// mem [2]  	= {`RST, 	16'h0};

	// mem [4] 	= {`LDI,	16'h1};
	// mem [5]  	= {`ST,		16'h3};
	// mem [6]  	= {`ST,		16'h2};
	// mem [7] 	= {`LDI,	16'h5};
	// mem [8]  	= {`ST,		16'h0};
	// mem [9]  	= {`LD,		16'h3};
	// mem [10]  	= {`ADD,	16'h2};
	// mem [11]  	= {`ST,		16'h2};
	// mem [12]  	= {`LD,		16'h0};
	// mem [13]  	= {`DEC,	16'h0};
	// mem [14]  	= {`JMA,	16'h8};
	// mem [15]  	= {`RET,	16'h0};

	// test 4
	mem [0]  	= {`NOP,	16'h0};
	mem [1]  	= {`IOR,	16'h2};
	mem [2]  	= {`ST,		16'd12};
	mem [3]  	= {`IOR,	16'h3};
	mem [4]  	= {`AND,	16'd12};
	mem [5]  	= {`IOW,	16'h0};
	mem [6]  	= {`NOT,	16'h0};
	mem [7]  	= {`IOW,	16'h1};
	mem [8]		= {`CLL,	16'd20};
	mem [9]  	= {`LD, 	16'h2};
	mem [10]  	= {`RST, 	16'h0};
	
	mem [20] 	= {`LDI,	16'h5};
	mem [21]  	= {`ST,		16'h1};
	mem [22]  	= {`LDI,	16'h3};
	mem [23]  	= {`ADD,	16'h1};
	mem [24]  	= {`ST,		16'h2};
	mem [25]  	= {`RET,	16'h0};
end

always @(*) begin
    data <= mem[addr];
end

endmodule

