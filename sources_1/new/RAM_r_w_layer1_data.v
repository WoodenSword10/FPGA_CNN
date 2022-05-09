module RAM_r_w_layer1_data(
    clk,                    // 时钟
    ok,                     // 一次读取结束信号
    one_read_ok,            // 一次卷积核读取结束信号
    row,                    // 读取数据所在行数
    col,                    // 读取数据所在列数
    num,                    // 读取数据所在图片数
    wea1,                    // 写入使能
    layer1_data_0,          // 读取layer1_data数据
    layer1_data_1,          
    layer1_data_2,          
    layer1_data_3,
    layer1_data_4,
    layer1_data_5,
    layer1_data_6,
    layer1_data_7,
    layer1_data_8,
    layer1_data_9,
    layer1_data_10,
    layer1_data_11,
    layer1_data_12,
    layer1_data_13,
    layer1_data_14,
    layer1_data_15,
    layer1_data_16,
    layer1_data_17, 
    layer1_data_18,
    layer1_data_19,
    layer1_data_20,
    layer1_data_21,
    layer1_data_22,
    layer1_data_23,
    layer1_data_24
);
      
    input clk;                                      // 时钟
    input one_read_ok;                              // 一次卷积核读取结束信号
    input wire [3:0] col;                           // 读取数据所在列数
    input wire [3:0] row;                           // 读取数据所在行数
    input wire [4:0] num;                           // 读取数据所在图片数
    output reg ok = 0;                           // 读取结束标志
    wire doutb;                                     // layer1_data RAM 读取数据结果
    reg wea;                                 // layer1_data RAM 写入使能
    output reg wea1;
    wire dina;                               // layer1_data RAM 写入数据
    wire [12:0] addra;                       // layer1_data RAM 写入地址
    reg [12:0] addrb = 13'd0;                // layer1_data RAM 读取地址
    output reg layer1_data_0;   //数据0
    output reg layer1_data_1;   //数据1
    output reg layer1_data_2;   //数据2
    output reg layer1_data_3;   //数据3
    output reg layer1_data_4;   //数据4
    output reg layer1_data_5;   //数据5
    output reg layer1_data_6;   //数据6
    output reg layer1_data_7;   //数据7
    output reg layer1_data_8;   //数据8
    output reg layer1_data_9;   //数据9
    output reg layer1_data_10;  //数据10
    output reg layer1_data_11;  //数据11
    output reg layer1_data_12;  //数据12
    output reg layer1_data_13;  //数据13
    output reg layer1_data_14;  //数据14
    output reg layer1_data_15;  //数据15
    output reg layer1_data_16;  //数据16
    output reg layer1_data_17;  //数据17
    output reg layer1_data_18;  //数据18
    output reg layer1_data_19;  //数据19
    output reg layer1_data_20;  //数据20
    output reg layer1_data_21;  //数据21
    output reg layer1_data_22;  //数据22
    output reg layer1_data_23;  //数据23
    output reg layer1_data_24;  //数据24
    
    reg [6:0] count = 7'd0;
    wire sign;
    wire sign2;
    reg sign3 = 0;
    // 池化模块
    layer1 layer1(
        .clk(clk),
        .sign(sign),
        .sign2(sign2),
        .res(dina),
        .addra(addra)
    );
    // layer1_data RAM 模块 存放第一层卷积池化网络运算结果
    layer1_data layer1_data(
      .clka(clk),
      .wea(wea),
      .addra(addra),
      .dina(dina),
      .clkb(clk),
      .addrb(addrb),
      .doutb(doutb)
    );
    
    always@(posedge clk) begin
        if(!sign & !sign2) wea1 = 1;
        else wea1 = 0;
    end
    // 写入使能控制
    always@(posedge clk) begin
        // 当sign/sign2不一致时，layer1_data RAM写入使能生效
        if(sign ^ sign2) wea = 1;
        else wea = 0;
    end
    // 读取操作
    always@(posedge clk) begin
        // 一次卷积核读取结束后
        if(one_read_ok) begin
            // 将读取结束标志置0
            ok = 0;
            sign3 = 1;
            // 计数清空
            count = 0;
        end
        else if(sign3) begin
            if(count == 76)begin
                count = 7'd0;
                // 读取结束
                ok = 1;
                sign3 = 0;
            end
            else begin
                case(count)
                    0: addrb = 12 * row + col + num * 144;
                    3: begin addrb = 12 * row + col + 1 + num *144; layer1_data_0 = doutb; end
                    6: begin addrb = 12 * row + col + 2 + num *144; layer1_data_1 = doutb; end
                    9: begin addrb = 12 * row + col + 3 + num *144; layer1_data_2 = doutb; end
                    12: begin addrb = 12 * row + col + 4 + num *144; layer1_data_3 = doutb; end
                    15: begin addrb = 12 * (row + 1) + col + num *144; layer1_data_4 = doutb; end
                    18: begin addrb = 12 * (row + 1) + col + 1 + num *144; layer1_data_5 = doutb; end
                    21: begin addrb = 12 * (row + 1) + col + 2 + num *144; layer1_data_6 = doutb; end
                    24: begin addrb = 12 * (row + 1) + col + 3 + num *144; layer1_data_7 = doutb; end
                    27: begin addrb = 12 * (row + 1) + col + 4 + num *144; layer1_data_8 = doutb; end
                    30: begin addrb = 12 * (row + 2) + col + num *144; layer1_data_9 = doutb; end
                    33: begin addrb = 12 * (row + 2) + col + 1 + num *144; layer1_data_10 = doutb; end
                    36: begin addrb = 12 * (row + 2) + col + 2 + num *144; layer1_data_11 = doutb; end
                    39: begin addrb = 12 * (row + 2) + col + 3 + num *144; layer1_data_12 = doutb; end
                    42: begin addrb = 12 * (row + 2) + col + 4 + num *144; layer1_data_13 = doutb; end
                    45: begin addrb = 12 * (row + 3) + col + num *144; layer1_data_14 = doutb; end
                    48: begin addrb = 12 * (row + 3) + col + 1 + num *144; layer1_data_15 = doutb; end
                    51: begin addrb = 12 * (row + 3) + col + 2 + num *144; layer1_data_16 = doutb; end
                    54: begin addrb = 12 * (row + 3) + col + 3 + num *144; layer1_data_17 = doutb; end
                    57: begin addrb = 12 * (row + 3) + col + 4 + num *144; layer1_data_18 = doutb; end
                    60: begin addrb = 12 * (row + 4) + col + num *144; layer1_data_19 = doutb; end
                    63: begin addrb = 12 * (row + 4) + col + 1 + num *144; layer1_data_20 = doutb; end
                    66: begin addrb = 12 * (row + 4) + col + 2 + num *144; layer1_data_21 = doutb; end
                    69: begin addrb = 12 * (row + 4) + col + 3 + num *144; layer1_data_22 = doutb; end
                    72: begin addrb = 12 * (row + 4) + col + 4 + num *144; layer1_data_23 = doutb; end
                    75: begin addrb = 12 * (row + 4) + col + 4 + num *144; layer1_data_24 = doutb; end
                endcase
                count = count + 1'd1;
            end
        end
    end

endmodule
