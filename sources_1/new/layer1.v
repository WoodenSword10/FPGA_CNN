module layer1(
    clk,        // 时钟
    sign,       // RAM读取操作开始标志
    sign2,      // 用于池化结果计数，将第一次池化结果的位数设定为1
    res,        // 池化结果
    addra       //  池化后存入地址
);

    input clk;              // 时钟
        
    wire conv1_start;       // 卷积运算开始
    wire conv1_over;        // 卷积运算结束
    wire [13:0] sum;        // 卷积运算结果
    wire [14:0] poor_addra; // poor_1 RAM 写入地址
    wire poor_dina;         // poor_1 RAM 写入数据
    reg [14 : 0] addrb;     // poor_1 RAM 读取地址
    wire doutb;             // poor_1 RAM 读取数据
    reg wea = 1'd1;         // poor_1 RAM写入使能
    reg ok = 1'd0;          // 一次池化运算结束标志
    
    reg poor1_data_0;       // 待池化数据1
    reg poor1_data_1;       // 待池化数据2
    reg poor1_data_2;       // 待池化数据3
    reg poor1_data_3;       // 待池化数据4
    reg [4:0] row = 5'd0;   // poor_1 RAM 读取数据所在列数
    reg [4:0] col = 5'd0;   // poor_1 RAM 读取数据所在行数
    reg [4:0] count = 5'd0; // 计数量
    output reg res;         // 池化结果
    reg [5:0] num = 6'd0;   // poor_1 RAM 读取数据所在图片
    output reg [12:0] addra = 13'd0; // 池化后结果位数
     
    output reg sign = 0;    // RAM读取操作开始标志
    output reg sign2 = 1;   // 用于池化结果计数，将第一次池化结果的位数设定为1
    // 卷积运算模块
    conv_1 conv_1(
        .clk(clk),
        .conv1_start(conv1_start),
        .conv1_over(conv1_over),
        .sum(sum),
        .poor_addra(poor_addra),
        .poor_dina(poor_dina)
    );
    // poor_1 RAM模块，存放卷积运算结果
   poor_1 poor_1(
      .clka(clk),
      .wea(conv1_start),
      .addra(poor_addra),
      .dina(poor_dina),
      .clkb(clk),
      .addrb(addrb),
      .doutb(doutb)
    );
    // 读取四个数据并进行池化操作取最大值，这里全0为0，否则为1
    always@(posedge clk)begin
        // 读取完最后一张图片后将读取操作关闭
        if(num == 6'd32) sign = 1'd0;
        else if(conv1_over) sign = 1'd1;
        // 读操作开始，初始化col/row/num
        if(sign & ok)begin
            ok = 1'd0;
            if(col == 5'd22)begin
                col = 4'd0;
                if(row == 5'd22)begin
                    row = 4'd0;
                    num = num + 1;
                end
                else row = row + 2;
            end
            else col = col + 2;
        end
        // 进行池化运算
        else if(sign)begin
            if(count == 13) begin
                count = 0;
               if(poor1_data_0 | poor1_data_1 | poor1_data_2 | poor1_data_3)
                    res = 1;
                else
                    res = 0;
                ok = 1;
                if(sign2) begin
                    addra = 0;
                    sign2 = 0;
                end
                else addra = addra + 1;
            end
            else begin
                case(count)
                    0: addrb = 24 * row + col + 576*num;
                    3: begin addrb = 24 * row + col + 1 + 576*num; poor1_data_0 = doutb; end
                    6: begin addrb = 24 * (row + 1) + col + 576*num; poor1_data_1 = doutb; end
                    9: begin addrb = 24 * (row + 1) + col + 1 + 576*num; poor1_data_2 = doutb; end
                    12: poor1_data_3 = doutb;
                endcase
                count = count + 1;
            end
        end
    end
    
endmodule
