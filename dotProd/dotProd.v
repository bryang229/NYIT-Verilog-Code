module dotProd
#(parameter S = 9)
(
    output reg [15:0] s,
    output reg ready,
    input clk,
    input reset,
    input [7:0] a, 
    input [7:0] b
    );

// input reg [7:0] a;
// input reg [7:0] b;
// input clk;
// output reg [15:0] s;
// use parameter to set size of vectors
// ready signal - to tell output is ready 
reg [$clog2(S)-1:0] counter;
reg [15:0] tempSum;

// initial begin // replace with async reset
//     s = 0;
//     tempSum = 0;
//     counter = 0;
// end

always @(posedge clk or negedge reset) begin
    if (!reset) begin //async reset
    s <= 0;
    tempSum <= 0;
    counter <= 0;
    ready <= 1;
    end
    else if (counter == 4'b1001) begin
        ready <= 0;
        counter <= 0;
        s <= tempSum;
        // #5
        tempSum <= 0;
    end
    else begin
        ready <= 1;
        counter <= counter + 1;
        tempSum <= tempSum + (a * b);
    end
end

endmodule