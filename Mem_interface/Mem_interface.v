module Mem_interface(
    input [3:0] addr_a, addr_b,      // read/write address
    input [7:0] a, b,                // input number if write
    input clk, reset, rw, wipe,      // 
    output reg [7:0] a_out, b_out,   // output numbers from addr 
    output reg [3:0] a_addr, b_addr  // read/write address
);

// registers for output a & b
reg [7:0] a_reg [0:15]; 
reg [7:0] b_reg [0:15];

integer i;

// always @(negedge wipe) begin
//     if(!wipe) begin
//         a_reg <= 0;
//         b_reg <= 0;
//         i = 0;
//         j = 0;
//     end
// end

always @(posedge clk or negedge reset) begin
    if(!reset) begin
        a_out <= 0;
        b_out <= 0;
        a_addr <= 0;
        b_addr <= 0;
        for(i = 0; i < 16; i=i+1) begin
            a_reg[i] <= 0;
            b_reg[i] <= 0;
        end
    end 
    else if (!rw) begin
        a_out <= a_reg[addr_a];
        b_out <= b_reg[addr_b];
        a_addr <= addr_a;
        b_addr <= addr_b;
    end
     else begin
        a_addr <= addr_a;
        b_addr <= addr_b;
        a_reg[addr_a] <= a;
        b_reg[addr_a] <= b;
        
    end
end
endmodule