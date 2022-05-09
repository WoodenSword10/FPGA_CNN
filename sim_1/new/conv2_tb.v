`timescale 1ns / 1ns
module conv2_tb;
    
    reg clk;
    wire en;
    wire res;
    wire [10:0] count_num;
    wire res_ok;
    
    conv_2 conv_2(
        .clk(clk),
        .en(en),
//        .channel_change(channel_change),
        .count_num(count_num),
        .res(res),
        .res_ok(res_ok)
    );
    
    initial clk = 1;
    always#10 clk = !clk;
    
    initial begin
//        #140000000;
        #160000000;
        $stop;
    end
endmodule
