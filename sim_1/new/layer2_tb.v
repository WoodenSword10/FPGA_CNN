`timescale 1ns / 1ns
module layer2_tb;
    
    reg clk;
    wire sign2;
    wire sum;
    wire [8:0] counter;
    
    layer2 layer2(
        .clk(clk),
        .sign2(sign2),
        .sum(sum),
        .counter(counter)
    );
    
    initial clk = 1;
    always#20 clk = ~clk;
    
    initial begin
        #400000000;
        $stop;
    end
endmodule
