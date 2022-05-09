module RAM_read_convkernal_2(
    clk,                // 输入，时钟
    en,                 // 输入，工作使能
    stop,               // 输入，图片数据读取结束标志
    ok,                 // 输出，全部卷积核读取结束标志
    step_stop,          // 输出，一次卷积核读取结束标志
    kernal_data_0,      // 卷积核数据
    kernal_data_1,
    kernal_data_2,
    kernal_data_3,
    kernal_data_4,
    kernal_data_5,
    kernal_data_6,
    kernal_data_7,
    kernal_data_8,
    kernal_data_9,
    kernal_data_10,
    kernal_data_11,
    kernal_data_12,
    kernal_data_13,
    kernal_data_14,
    kernal_data_15,
    kernal_data_16,
    kernal_data_17,
    kernal_data_18,
    kernal_data_19,
    kernal_data_20,
    kernal_data_21,
    kernal_data_22,
    kernal_data_23,
    kernal_data_24
);

    input clk;                  // 时钟
    input en;                   // 工作使能
    input stop;                 // 一次读取图片数据结束信号
    output reg ok = 1'd0;       // 全部卷积核读取结束标志
    output reg kernal_data_0;   // 卷积核数据
    output reg kernal_data_1;
    output reg kernal_data_2;
    output reg kernal_data_3;
    output reg kernal_data_4;
    output reg kernal_data_5;
    output reg kernal_data_6;
    output reg kernal_data_7;
    output reg kernal_data_8;
    output reg kernal_data_9;
    output reg kernal_data_10;
    output reg kernal_data_11;
    output reg kernal_data_12;
    output reg kernal_data_13;
    output reg kernal_data_14;
    output reg kernal_data_15;
    output reg kernal_data_16;
    output reg kernal_data_17;
    output reg kernal_data_18;
    output reg kernal_data_19;
    output reg kernal_data_20;
    output reg kernal_data_21;
    output reg kernal_data_22;
    output reg kernal_data_23;
    output reg kernal_data_24;
    
    reg [14:0] addra;               // 读取地址
    wire douta;                     // 读取数据
    reg [6:0] count = 7'd0;         // 计数量
    reg [5:0] num = 6'd0;           // 卷积核数
    reg [5:0] channel = 6'd0;       // 通道数
    output reg step_stop = 1'd0;    // 一次卷积核读取结束标志
    // conv_keranl_2 RAM 模块
    conv_kernal_2 conv_kernal_2(
        .clka(clk),
        .addra(addra),
        .douta(douta)
    );
   // 读取数据
    always@(posedge clk)begin
        if(en) begin
            if(stop)begin
                step_stop = 1'd0;
                count = 7'd0;
            end
            else if(!step_stop)begin
                if(count == 7'd76)begin
                    step_stop = 1'd1;
                    count = 7'd0;
                    if(num == 6'd31)begin
                        if(channel == 6'd31) begin
                            num = 6'd0;
                            ok = 1'd1;
                        end
                        else begin
                            channel = channel + 1'd1;
                            num = 6'd0;
                        end
                    end
                    else begin
                        num = num +1'd1;
                    end
                end
                else begin
                    case(count)
                        7'd0: addra = 25*num + 800 * channel;
                        7'd3: begin addra = 25*num + 1 + 800 * channel; kernal_data_0 = douta; end
                        7'd6: begin addra = 25*num + 2 + 800 * channel; kernal_data_1 = douta; end
                        7'd9: begin addra = 25*num + 3 + 800 * channel; kernal_data_2 = douta; end
                        7'd12: begin addra = 25*num + 4 + 800 * channel; kernal_data_3 = douta; end
                        7'd15: begin addra = 25*num + 5 + 800 * channel; kernal_data_4 = douta; end
                        7'd18: begin addra = 25*num + 6 + 800 * channel; kernal_data_5 = douta; end
                        7'd21: begin addra = 25*num + 7 + 800 * channel; kernal_data_6 = douta; end
                        7'd24: begin addra = 25*num + 8 + 800 * channel; kernal_data_7 = douta; end
                        7'd27: begin addra = 25*num + 9 + 800 * channel; kernal_data_8 = douta; end
                        7'd30: begin addra = 25*num + 10 + 800 * channel; kernal_data_9 = douta; end
                        7'd33: begin addra = 25*num + 11 + 800 * channel; kernal_data_10 = douta; end
                        7'd36: begin addra = 25*num + 12 + 800 * channel; kernal_data_11 = douta; end
                        7'd39: begin addra = 25*num + 13 + 800 * channel; kernal_data_12 = douta; end
                        7'd42: begin addra = 25*num + 14 + 800 * channel; kernal_data_13 = douta; end
                        7'd45: begin addra = 25*num + 15 + 800 * channel; kernal_data_14 = douta; end
                        7'd48: begin addra = 25*num + 16 + 800 * channel; kernal_data_15 = douta; end
                        7'd51: begin addra = 25*num + 17 + 800 * channel; kernal_data_16 = douta; end
                        7'd54: begin addra = 25*num + 18 + 800 * channel; kernal_data_17 = douta; end
                        7'd57: begin addra = 25*num + 19 + 800 * channel; kernal_data_18 = douta; end
                        7'd60: begin addra = 25*num + 20 + 800 * channel; kernal_data_19 = douta; end
                        7'd63: begin addra = 25*num + 21 + 800 * channel; kernal_data_20 = douta; end
                        7'd66: begin addra = 25*num + 22 + 800 * channel; kernal_data_21 = douta; end
                        7'd69: begin addra = 25*num + 23 + 800 * channel; kernal_data_22 = douta; end
                        7'd72: begin addra = 25*num + 24 + 800 * channel; kernal_data_23 = douta; end
                        7'd75: begin addra = 25*num + 2 + 800 * channel; kernal_data_24 = douta; end
                    endcase
                    count = count +1'd1;
                end
            end
        end
    end
   
endmodule