# run cmd -> 

param (
    [string]$files_to_tb_path
)
# Remove-Item -Path ./tests/up_tb.vvp
# Remove-Item -Path ./tests/up_tb.vcd

$files = Get-Content $files_to_tb_path
iverilog -o tests/up_tb.vvp ./tests/processor_tb.v $files
# ./a.v ./alu.v ./counter.v ./id.v ./mux.v ./rf.v ./rom.v ./registers.v
vvp tests/up_tb.vvp
gtkwave -f ./tests/up_tb.vcd -a "processor_tb.P.clk_in" -a "processor_tb.P.rst"