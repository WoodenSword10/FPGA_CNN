module read_Cs(
    clk,
    addr,
    dout
);
    
    input clk;
    output [9:0] addr;
    output wire [7:0] dout;
    
    reg [9:0] addr = 10'd0;
    reg ok = 1'd0;
    
    IMG2  IMG2(
      .clka(clk),
      .addra(addr),
      .douta(dout)
    );
    
    always@(posedge clk) begin
        if(addr == 10'd783) begin
            ok = 1'd1;
        end
        else begin
            addr = addr + 1'd1;
        end
    end
endmodule
