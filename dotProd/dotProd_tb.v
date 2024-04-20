`timescale 1ns/1ps

module dotProd_tb;

reg [7:0] a, b;
wire [15:0] s;
reg clk;
wire ready;
reg reset;
dotProd dp(s,ready, clk, reset, a, b);

always #10 clk = ~clk;

initial begin

    $dumpfile("dotProd.vds"); $dumpvars;
    reset <= 1;
    clk <= 0;
    
    #10
    reset <= 1;
    a <= 8'ha3;
    b <= 8'h24;
    #21
    a <= 8'h01;
    b <= 8'h01;

    #42

    a <= 8'h02;
    b <= 8'h02;
end

endmodule