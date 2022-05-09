module layer2(
    clk,
    sign1,
    sign2,
    sum,
    counter
);
    input clk;
    wire [10:0] addra;
    wire en;
    wire res;
    wire res_ok;
    reg [10:0] addrb = 1'd0;
    wire doutb;
    output reg sign1 = 1'd0;
    output reg sign2 = 1'd1;
    reg sign3 = 1'd1;
    reg sign4 = 1;
    reg data_0;
    reg data_1;
    reg data_2;
    reg data_3;
    reg [2:0] row = 3'd0;
    reg [2:0] col = 3'd0;
    reg [3:0] count = 4'd0;
    reg [4:0] num = 5'd0;
    output reg sum;
    output reg [8:0] counter = 9'd0; 
    
    conv_2 conv_2(
        .clk(clk),
        .en(en),
        .addra(addra),
        .res(res),
        .res_ok(res_ok)
    );

    poor2 poor2(
      .clka(clk),
      .wea(en),
      .addra(addra),
      .dina(res),
      .clkb(clk),
      .addrb(addrb),
      .doutb(doutb)
    );
    
    
    always@(posedge clk)begin
        if(res_ok & sign4)begin
            sign1 = 1'd1;
            sign4 = 0;
        end
        else if(sign1 & sign2)begin
            if(count == 4'd13)begin
                count = 4'd0;
                if(sign3) begin counter = 9'd0; sign3 = 1'd0; end
                else if(counter == 9'b1_1111_1111)  sign2 = 0;
                else counter = counter + 1'd1;
                if(col == 3'd6) begin
                    col = 3'd0;
                    if(row == 3'd6) begin
                        row = 3'd0;
                        if(num == 5'd31)begin
                            num = 5'd0;
                        end
                        else num = num + 1'd1;
                    end
                    else row = row + 2'd2;
                end
                else col = col + 2'd2;
                if(data_0 | data_1 | data_2 | data_3) sum = 1'd1;
                else sum = 1'd0;
            end
            case(count)
                4'd0: addrb = 8 * row + col + num * 64;
                4'd3: begin addrb = 8 * row + col + 1 + num * 64;data_0 = doutb;end
                4'd6: begin addrb = 8 * (row+1) + col + num * 64;data_1 = doutb;end
                4'd9: begin addrb = 8 * (row+1) + col + 1 + num * 64; data_2 = doutb;end
                4'd12: data_3 = doutb;
            endcase
            count = count + 1'd1;
        end
    end
endmodule