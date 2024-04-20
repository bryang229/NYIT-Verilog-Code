`timescale 1ns/1ps

module Mem_interface_tb;
reg [3:0] addr_a, addr_b;
reg [7:0] a, b;
reg clk;
reg reset;
reg rw;
reg wipe;
wire [7:0] a_out, b_out;
wire [3:0] a_addr, b_addr;

reg[3:0] i;
integer idx;
integer idy;


Mem_interface mem(
    addr_a, addr_b,
    a, b, 
    clk, reset, rw, wipe,
    a_out, b_out,
    a_addr, b_addr
);

always #5 clk = ~clk;

initial begin 
    clk <= 0;
    reset <=1;
    $dumpfile("Mem_interface.vds"); $dumpvars;
    for(idx = 0; idx < 16; idx = idx + 1) $dumpvars(1, mem.a_reg[idx]);
    for(idy = 0; idy < 16; idy = idy + 1) $dumpvars(1, mem.b_reg[idy]);

    i <= 'h0;
    a <= 'h54;
    b <= 'ha3;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;
    wipe <= 0;
    rw <= 1;

    #10

    reset <=0;

    #20 

    reset <=1;

    #20

    a <= 'h16;
    b <= 'h32;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;
    
    #10
    a <= 'h83;
    b <= 'hF2;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;
    #10
    a <= 'h0e;
    b <= 'h35;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'hF9;
    b <= 'hE2;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;
    
    #10
    a <= 'hFc;
    b <= 'h7c;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;
    
    #10
    a <= 'h5d;
    b <= 'h02;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'hFe;
    b <= 'h58;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;    

    #10
    a <= 'h73;
    b <= 'h75;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'hDf;
    b <= 'h3c;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'h26;
    b <= 'h63;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'hAa;
    b <= 'hDb;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'hD7;
    b <= 'hD8;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'hCe;
    b <= 'hC7;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'h5d;
    b <= 'h35;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'hF8;
    b <= 'h94;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    a <= 'h4e;
    b <= 'h98;
    i <= i + 1;
    addr_a[3:0] <= i;
    addr_b[3:0] <= i;

    #10
    rw <= 0;
    addr_a[3:0] <= 'h3;
    addr_b[3:0] <= 'h5;

    #10
    addr_a[3:0] <= 'h8;
    addr_b[3:0] <= 'h2;

    #10
    rw <= 0;
    addr_a[3:0] <= 'hA;
    addr_b[3:0] <= 'hC;

    #10
    addr_a[3:0] <= 'h0;
    addr_b[3:0] <= 'h1;

    #10
    rw <= 0;
    addr_a[3:0] <= 'h1;
    addr_b[3:0] <= 'h0;

    #10
    addr_a[3:0] <= 'hF;
    addr_b[3:0] <= 'hE;

    #10
    rw <= 0;
    addr_a[3:0] <= 'hE;
    addr_b[3:0] <= 'hF;

    #10
    addr_a[3:0] <= 'hB;
    addr_b[3:0] <= 'hD;


$finish;
end


endmodule 