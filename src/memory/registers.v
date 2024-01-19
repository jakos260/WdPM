module registers(clk, rf_en, r_or_w, reg_addr, in, out);

    parameter WIDTH = 16;
    parameter REG_NUM = 16;

    input clk, rf_en, r_or_w; // r_or_w => 1 = write, 0 = read
    input [REG_NUM-1:0] reg_addr;
    input [WIDTH-1:0] in;
    output reg [WIDTH-1:0] out;

    reg [WIDTH-1:0] mem [REG_NUM-1:0];

    initial out <= 16'dz;

    always @(*) begin
        if(rf_en) begin        
            if(r_or_w) begin // write
                mem[reg_addr] <= in;
                out <= 16'dz;
            end
            else begin //read
                out <= mem[reg_addr];
            end
        end
        else out <= 16'dz;
    end

endmodule

// genvar i;
// generate
//     for (i = 0; i < REG_NUM; i = i+1) begin
//         rf register0 (
// 	        .clk(clk),
// 	        .ce(reg_sel[i]),
// 	        .in(in),
// 	        .out(out)
//         );
//     end
// endgenerate

// rf Rf_0(
// 	.clk(clk),
// 	.ce(reg_sel[0]),
// 	.in(in),
// 	.out(out)
// );

// rf Rf_1(
// 	.clk(clk),
// 	.ce(reg_sel[1]),
// 	.in(in),
// 	.out(out)
// );

// rf Rf_2(
// 	.clk(clk),
// 	.ce(reg_sel[2]),
// 	.in(in),
// 	.out(out)
// );

// rf Rf_3(
// 	.clk(clk),
// 	.ce(reg_sel[3]),
// 	.in(in),
// 	.out(out)
// );

// rf Rf_4(
// 	.clk(clk),
// 	.ce(reg_sel[4]),
// 	.in(in),
// 	.out(out)
// );

// rf Rf_5(
// 	.clk(clk),
// 	.ce(reg_sel[5]),
// 	.in(in),
// 	.out(out)
// );

// rf Rf_6(
// 	.clk(clk),
// 	.ce(reg_sel[6]),
// 	.in(in),
// 	.out(out)
// );

// rf Rf_7(
// 	.clk(clk),
// 	.ce(reg_sel[7]),
// 	.in(in),
// 	.out(out)
// );
