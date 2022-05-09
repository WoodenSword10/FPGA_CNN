module conv_1(
    clk,                // 输入，时钟
    conv1_start,        // 输出，卷积核工作使能信号
    conv1_over,         // 输出，部卷积核读取结束信号
    sum,                // 输出，一次卷积计算
    poor_addra,         // 输出，poor_1 RAM 写入地址
    poor_dina           // 输出，poor_1 RAM 写入数据
);

    parameter initsum = 14'b10_0000_0000_0000;
    
    input clk;                                  // 时钟
    // 卷积核读取模块
    output reg conv1_start = 1;                 // 卷积核读取模块工作使能
    output wire conv1_over;                     // 卷积核全部读取结束信号
    wire step_stop;                             // 卷积核一次读取结束结束
    reg stop = 1;                               // 卷积核一次读取开始信号
    wire [5:0] kernal_num;                      // 卷积核个数
    // 卷积运算模块
    reg ok = 0;                                 // 图片全部读取结束标志，初始为0 
    output reg [13:0] sum = initsum;            // 卷积运算结果
    output reg [14:0] poor_addra = 0;           // 
    output reg poor_dina;                       // 
    // 图片读取模块
    reg en = 0;                                 // 图片数据读取模块工作使能
    reg restart = 0;                            // 图片数据一次读取开始信号
    reg [4:0] row = 0;                          // 图片读取行数
    reg [4:0] col = 0;                          // 图片读取列数
    wire Stop;                                  // 图片数据一次读取结束信号
    wire [9:0] addra;
    wire [7:0] img_data_0;  
    wire [7:0] img_data_1;  
    wire [7:0] img_data_2;  
    wire [7:0] img_data_3;  
    wire [7:0] img_data_4;  
    wire [7:0] img_data_5;  
    wire [7:0] img_data_6;  
    wire [7:0] img_data_7;  
    wire [7:0] img_data_8;  
    wire [7:0] img_data_9;  
    wire [7:0] img_data_10; 
    wire [7:0] img_data_11; 
    wire [7:0] img_data_12; 
    wire [7:0] img_data_13; 
    wire [7:0] img_data_14; 
    wire [7:0] img_data_15; 
    wire [7:0] img_data_16; 
    wire [7:0] img_data_17; 
    wire [7:0] img_data_18; 
    wire [7:0] img_data_19; 
    wire [7:0] img_data_20; 
    wire [7:0] img_data_21; 
    wire [7:0] img_data_22; 
    wire [7:0] img_data_23; 
    wire [7:0] img_data_24; 
    wire kernal_data_0;
    wire kernal_data_1;
    wire kernal_data_2;
    wire kernal_data_3;
    wire kernal_data_4;
    wire kernal_data_5;
    wire kernal_data_6;
    wire kernal_data_7;
    wire kernal_data_8;
    wire kernal_data_9;
    wire kernal_data_10;
    wire kernal_data_11;
    wire kernal_data_12;
    wire kernal_data_13;
    wire kernal_data_14;
    wire kernal_data_15;
    wire kernal_data_16;
    wire kernal_data_17;
    wire kernal_data_18;
    wire kernal_data_19;
    wire kernal_data_20;
    wire kernal_data_21;
    wire kernal_data_22;
    wire kernal_data_23;
    wire kernal_data_24;
    
    reg sign = 1'd1;
    
    RAM_read_IMG RAM_read_IMG(
        .clk(clk),                  // 输入，时钟
        .en(en),                    // 输入，图片数据读取模块工作使能，初始为0
        .row(row),                  // 输入，当前读取行数
        .col(col),                  // 输入，当前读取列数
        .restart(restart),          // 输入，一次读取开始信号
        .Stop(Stop),                // 输出，读取一次结束信号
        .addra(addra),
        .img_data_0(img_data_0),    // 输出，图片数据
        .img_data_1(img_data_1),
        .img_data_2(img_data_2),
        .img_data_3(img_data_3),
        .img_data_4(img_data_4),
        .img_data_5(img_data_5),
        .img_data_6(img_data_6),
        .img_data_7(img_data_7),
        .img_data_8(img_data_8),
        .img_data_9(img_data_9),
        .img_data_10(img_data_10),
        .img_data_11(img_data_11),
        .img_data_12(img_data_12),
        .img_data_13(img_data_13),
        .img_data_14(img_data_14),
        .img_data_15(img_data_15),
        .img_data_16(img_data_16),
        .img_data_17(img_data_17), 
        .img_data_18(img_data_18),
        .img_data_19(img_data_19),
        .img_data_20(img_data_20),
        .img_data_21(img_data_21),
        .img_data_22(img_data_22),
        .img_data_23(img_data_23),
        .img_data_24(img_data_24)
    );
    
    RAM_read_convkernal RAM_read_convkernal(
        .clk(clk),                      // 输入，时钟
        .en(conv1_start),               // 输入，卷积核读取模块工作使能，初始为1
        .ok(conv1_over),                // 输出，全部读取结束信号
        .stop(stop),                    // 输入，一次读取开始信号
        .step_stop(step_stop),          // 输出，一次读取结束信号
        .kernal_num(kernal_num),        // 输出，卷积核个数
        .kernal_data_0(kernal_data_0),
        .kernal_data_1(kernal_data_1),
        .kernal_data_2(kernal_data_2),
        .kernal_data_3(kernal_data_3),
        .kernal_data_4(kernal_data_4),
        .kernal_data_5(kernal_data_5),
        .kernal_data_6(kernal_data_6),
        .kernal_data_7(kernal_data_7),
        .kernal_data_8(kernal_data_8),
        .kernal_data_9(kernal_data_9),
        .kernal_data_10(kernal_data_10),
        .kernal_data_11(kernal_data_11),
        .kernal_data_12(kernal_data_12),
        .kernal_data_13(kernal_data_13),
        .kernal_data_14(kernal_data_14),
        .kernal_data_15(kernal_data_15),
        .kernal_data_16(kernal_data_16),
        .kernal_data_17(kernal_data_17),
        .kernal_data_18(kernal_data_18),
        .kernal_data_19(kernal_data_19),
        .kernal_data_20(kernal_data_20),
        .kernal_data_21(kernal_data_21),
        .kernal_data_22(kernal_data_22),
        .kernal_data_23(kernal_data_23),
        .kernal_data_24(kernal_data_24)
    );

    // 开始执行一次卷积和读取，等待step_stop信号

    always@(posedge clk)begin
        // 如果卷积核全部读取结束
        if(conv1_over)begin
            // 关闭卷积核模块工作使能
            conv1_start = 1'd0;
        end
        else if(stop) begin
            stop = 1'd0;
            ok = 1'd0;
        end
        // 一次卷积读取结束后打开图片数据读取模块工作使能
        else if(step_stop & !en) begin
            en = 1'd1;                  // 图片数据读取模块工作使能
            restart = 1'd1;             // 一次读取开始信号置为1
        end
        // 图片全部读取结束标志为1，
        else if(ok) begin
            sum <= initsum;
            en <= 0;
            col <= 0;
            row <= 0;
            stop <= 1;
        end
        // 等待图片数据一次读取结束信号
        else if(Stop) begin
            // 更新col/row
            if(col == 5'd23) begin
                col = 5'd0;
                if(row == 5'd23) begin
                    ok=1'd1;
                end
                else row = row + 1'd1;
            end
            else col = col + 1'd1;
            // 计算一次卷积运算
            sum = initsum;
            if(kernal_data_0) sum = sum + img_data_0;
            else sum = sum - img_data_0;
            if(kernal_data_1) sum = sum + img_data_1;
            else sum = sum - img_data_1;
            if(kernal_data_2) sum = sum + img_data_2;
            else sum = sum - img_data_2;
            if(kernal_data_3) sum = sum + img_data_3;
            else sum = sum - img_data_3;
            if(kernal_data_4) sum = sum + img_data_4;
            else sum = sum - img_data_4;
            if(kernal_data_5) sum = sum + img_data_5;
            else sum = sum - img_data_5;
            if(kernal_data_6) sum = sum + img_data_6;
            else sum = sum - img_data_6;
            if(kernal_data_7) sum = sum + img_data_7;
            else sum = sum - img_data_7;
            if(kernal_data_8) sum = sum + img_data_8;
            else sum = sum - img_data_8;
            if(kernal_data_9) sum = sum + img_data_9;
            else sum = sum - img_data_9;
            if(kernal_data_10) sum = sum + img_data_10;
            else sum = sum - img_data_10;
            if(kernal_data_11) sum = sum + img_data_11;
            else sum = sum - img_data_11;
            if(kernal_data_12) sum = sum + img_data_12;
            else sum = sum - img_data_12;
            if(kernal_data_13) sum = sum + img_data_13;
            else sum = sum - img_data_13;
            if(kernal_data_14) sum = sum + img_data_14;
            else sum = sum - img_data_14;
            if(kernal_data_15) sum = sum + img_data_15;
            else sum = sum - img_data_15;
            if(kernal_data_16) sum = sum + img_data_16;
            else sum = sum - img_data_16;
            if(kernal_data_17) sum = sum + img_data_17;
            else sum = sum - img_data_17;
            if(kernal_data_18) sum = sum + img_data_18;
            else sum = sum - img_data_18;
            if(kernal_data_19) sum = sum + img_data_19;
            else sum = sum - img_data_19;
            if(kernal_data_20) sum = sum + img_data_20;
            else sum = sum - img_data_20;
            if(kernal_data_21) sum = sum + img_data_21;
            else sum = sum - img_data_21;
            if(kernal_data_22) sum = sum + img_data_22;
            else sum = sum - img_data_22;
            if(kernal_data_23) sum = sum + img_data_23;
            else sum = sum - img_data_23;
            if(kernal_data_24) sum = sum + img_data_24;
            else sum = sum - img_data_24;
            if(sum >= initsum) poor_dina = 1'd1;
            else poor_dina = 1'd0;
            if(sign) begin
                sign = 0;
                poor_addra = 0;
            end
            else poor_addra = poor_addra + 1;
        end
        // 将一次读取开始信号置为0
        else restart = 1'd0;
    end
    
endmodule