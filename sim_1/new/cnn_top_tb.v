`timescale 1ns/1ns

module cnn_top_tb;
    
    reg clk;
    wire [3:0] res;
    
     RAM_r_w_layer2_data RAM_r_w_layer2_data(
        .clk(clk),
        .res(res)
    );
    
    initial clk = 0;
    always#10 clk = !clk;
    
    initial begin
        #150000000;
        $stop;
    end

endmodule