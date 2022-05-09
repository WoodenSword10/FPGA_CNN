`timescale 1ns/1ns

module read_Cs_tb;

    reg clk;
    wire [9:0] addr;
    wire [7:0] dout;
    
    read_Cs read_Cs(
        .clk(clk),
        .addr(addr),
        .dout(dout)
    );
    
    initial clk = 0;
    always#10 clk = !clk;
    initial begin
        #1000000;
        $stop;
    end
    
endmodule