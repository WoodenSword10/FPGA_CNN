module RAM_r_w_layer2_data(
    clk,
    res
);

    input clk;
    wire sign2;
    wire sign1;
    wire sum;
    wire [8:0] counter;
    reg en;
    reg [8:0] addrb;
    wire doutb;
    reg sign3 = 1;
    reg sign4 = 1;
    reg sign5 = 0;
    reg sign6 = 1;
    reg [12:0] addra = 0;
    wire douta;
    reg ok = 0;
    output reg [3:0] res;
    reg [9:0] maxdata=0;
    reg [3:0] count_num = 1'd0;
    reg [9:0] res0 = 10'd512;
    reg [9:0] res1 = 10'd512;
    reg [9:0] res2 = 10'd512;
    reg [9:0] res3 = 10'd512;
    reg [9:0] res4 = 10'd512;
    reg [9:0] res5 = 10'd512;
    reg [9:0] res6 = 10'd512;
    reg [9:0] res7 = 10'd512;
    reg [9:0] res8 = 10'd512;
    reg [9:0] res9 = 10'd512;
    
    layer2 layer2(
        .clk(clk),
        .sign1(sign1),
        .sign2(sign2),
        .sum(sum),
        .counter(counter)
    );
    
    layer2_data layer2_data(
      .clka(clk),
      .wea(en),
      .addra(counter),
      .dina(sum),
      .clkb(clk),
      .addrb(addrb),
      .doutb(doutb)
    );
    
    w2 w2(
      .clka(clk),
      .addra(addra),
      .douta(douta)
    );
    
    always@(posedge clk)begin
        if(sign1 & sign2) en = 1;
        else en = 0;
    end
    
    always@(posedge clk)begin
        if(ok & sign6)begin
            sign6 = 0;
            if(maxdata <= res0) begin
                maxdata = res0;
                res = 0;
            end
            if(maxdata <= res1) begin
                maxdata = res1;
                res = 1;
            end
            if(maxdata <= res2) begin
                maxdata = res2;
                res = 2;
            end
            if(maxdata <= res3) begin
                maxdata = res3;
                res = 3;
            end
            if(maxdata <= res4) begin
                maxdata = res4;
                res = 4;
            end
            if(maxdata <= res5) begin
                maxdata = res5;
                res = 5;
            end
            if(maxdata <= res6) begin
                maxdata = res6;
                res = 6;
            end
            if(maxdata <= res7) begin
                maxdata = res7;
                res = 7;
            end
            if(maxdata <= res8) begin
                maxdata = res8;
                res = 8;
            end
            if(maxdata <= res9) begin
                maxdata = res9;
                res = 9;
            end
        end
    end
    
    always@(posedge clk)begin
        if(!sign2 & !ok) begin
            if(sign3 | sign5)begin
                addrb = 0;
                addra = 1;
                sign3 = 0;
                count_num = 0;
            end
            else if(sign4)begin
                sign4 = 0;   
                case(count_num)
                    0: if(douta ^ doutb) res0 = res0 - 1; else res0 = res0 + 1;
                    1: if(douta ^ doutb) res1 = res1 - 1; else res1 = res1 + 1;  
                    2: if(douta ^ doutb) res2 = res2 - 1; else res2 = res2 + 1;
                    3: if(douta ^ doutb) res3 = res3 - 1; else res3 = res3 + 1;
                    4: if(douta ^ doutb) res4 = res4 - 1; else res4 = res4 + 1;
                    5: if(douta ^ doutb) res5 = res5 - 1; else res5 = res5 + 1;
                    6: if(douta ^ doutb) res6 = res6 - 1; else res6 = res6 + 1; 
                    7: if(douta ^ doutb) res7 = res7 - 1; else res7 = res7 + 1; 
                    8: if(douta ^ doutb) res8 = res8 - 1; else res8 = res8 + 1;
                    9: if(douta ^ doutb) res9 = res9 - 1; else res9 = res9 + 1;
                    default:;    
                endcase
            end
            else if(addra == 5120)begin
                sign5=1;
                ok = 1;
            end
            else  begin
                sign4 = 1;
                if(addrb == 511) begin
                    addrb = 0;
                    count_num = count_num + 1;
                end
                else addrb = addrb + 1;
                addra = addra + 1;
            end
        end
    end
   
endmodule
