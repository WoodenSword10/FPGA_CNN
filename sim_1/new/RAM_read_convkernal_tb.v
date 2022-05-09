`timescale 1ns / 1ns
module RAM_read_convkernal_tb;

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
    
    
   initial clk = 0;
   always#10 clk = !clk;
   
   initial begin
        #150000000;
        $stop;
   end
endmodule
