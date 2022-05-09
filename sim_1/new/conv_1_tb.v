`timescale 1ns / 1ns
module conv_1_tb;

    reg clk;
    wire conv1_start;
    wire conv1_over;
    wire [13:0] sum;
    wire [14:0] poor_addra;
    wire poor_dina;
    
    conv_1 conv_1(
        .clk(clk),
        .conv1_start(conv1_start),
        .conv1_over(conv1_over),
        .sum(sum),
        .poor_addra(poor_addra),
        .poor_dina(poor_dina)
    );
    
        initial clk = 1;
    always#10 clk= !clk;
    
    initial begin
        #30000000;
        $stop;
    end
endmodule
