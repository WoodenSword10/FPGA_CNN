`timescale 1ns / 1ns

module layer1_tb;
    
    reg clk;
    wire sign;
    wire sign2;
    wire res;
    wire [12:0] addra;
    
    layer1 layer1(
        .clk(clk),        // 时钟
        .sign(sign),       // RAM读取操作开始标志
        .sign2(sign2),      // 用于池化结果计数，将第一次池化结果的位数设定为1
        .res(res),        // 池化结果
        .addra(addra)       //  池化后存入地址
    );

    initial clk = 1;
    always#10 clk= !clk;
    
    initial begin
        #35000000;
        $stop;
    end
endmodule
