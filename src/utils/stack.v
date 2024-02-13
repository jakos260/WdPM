module stack (clk, rst, push, pop, data_in, data_out, full, empty);
    integer i;
    parameter WIDTH = 16;
    parameter DEPTH = 8;
    
    input clk;      // Zegar
    input rst;      // Sygnał resetu
    input push;     // Sygnał PUSH
    input pop;      // Sygnał POP
    input [WIDTH-1:0] data_in;  // Dane do umieszczenia na stosie
    output [WIDTH-1:0] data_out; // Dane pobrane ze stosu
    output reg full;      // Flaga pełnego stosu
    output reg empty;     // Flaga pustego stosu

    reg [WIDTH-1:0] mem [0:DEPTH-1]; // Stos o wielkości 8, przechowuje bajty (8-bitowe dane)
    reg [2:0] top;         // Wskaźnik wierzchołka stosu

    initial begin
        top <= 3'b0;
        full <= 0;
        empty <= 1;
    end

    assign data_out = top > 3'b000 ? mem[top-1] : 16'd0;

    always @(negedge clk or posedge rst) begin
        if (rst) begin
            top <= 3'b000;       // Reset wskaźnika wierzchołka stosu
            full <= 1'b0;      // Zresetuj flagę pełnego stosu
            empty <= 1'b1;     // Ustaw flagę pustego stosu
        end
        else begin
            // Obsługa PUSH
            if (push && ~full) begin
                mem[top] <= data_in;
                top <= top + 1;
                empty <= 1'b0;
                if (top == 3'b111) // Sprawdź, czy stos jest pełny
                    full <= 1'b1;
            end

            // Obsługa POP
            else if (pop && ~empty) begin
                top = top - 1;
                full <= 1'b0;
                if (top == 3'b000)   // Sprawdź, czy stos jest pusty
                    empty <= 1'b1;
            end
        end
    end

endmodule
