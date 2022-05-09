module RAM_read_convkernal(
    clk,                // 输入，时钟
    en,                 // 输入，工作使能
    ok,                 // 输出，全部读取完成信号
    stop,               // 输入， 一次读取开始信号
    step_stop,          // 输出，一次读取结束信号
//    count,              // 输出，计数量
    kernal_num,         // 输出，当前第几个卷积核
    kernal_data_0,      // 输出，卷积核数据
    kernal_data_1,      // 输出，卷积核数据
    kernal_data_2,      // 输出，卷积核数据
    kernal_data_3,      // 输出，卷积核数据
    kernal_data_4,      // 输出，卷积核数据
    kernal_data_5,      // 输出，卷积核数据
    kernal_data_6,      // 输出，卷积核数据
    kernal_data_7,      // 输出，卷积核数据
    kernal_data_8,      // 输出，卷积核数据
    kernal_data_9,      // 输出，卷积核数据
    kernal_data_10,      // 输出，卷积核数据
    kernal_data_11,      // 输出，卷积核数据
    kernal_data_12,      // 输出，卷积核数据
    kernal_data_13,      // 输出，卷积核数据
    kernal_data_14,      // 输出，卷积核数据
    kernal_data_15,      // 输出，卷积核数据
    kernal_data_16,      // 输出，卷积核数据
    kernal_data_17,      // 输出，卷积核数据
    kernal_data_18,      // 输出，卷积核数据
    kernal_data_19,      // 输出，卷积核数据
    kernal_data_20,      // 输出，卷积核数据
    kernal_data_21,      // 输出，卷积核数据
    kernal_data_22,      // 输出，卷积核数据
    kernal_data_23,      // 输出，卷积核数据
    kernal_data_24      // 输出，卷积核数据
);

    input clk;                  // 时钟
    input en;                   // 工作使能
    input stop;                 // 一次读取开始信号
    output reg ok = 1'd0;       // 全部读取结束信号
    output reg step_stop = 0;    // 一次读取结束信号
    output reg kernal_data_0;   
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
    
    output reg [5:0] kernal_num = 63;      // 卷积核计数
    reg [9:0] addra;                // kernal RAM读取地址
    wire douta;                     // kernal RAM读取数据
    reg [5:0] count = 0;            // 计数量
    reg [5:0] num = 0;              
    reg sign = 1'd1;                // 第一个卷积核信号
    
    
    conv_kernal_1 conv_kernal_1(
        .clka(clk),     // 时钟
        .addra(addra),  // 地址
        .douta(douta)   // 数据
    );
   
    always@(posedge clk)begin
        // 工作使能
        if(en) begin
            // 接收到开始信号开始读取25个卷积核数据
            if(stop)begin
                addra = 25 * num;
                // 一次读取结束信号置为0
                if(num == 32) ok = 1;
                else step_stop <= 0;
                // 计数量置为0
                count <= 0;
            end
            // stop为脉冲信号，一时钟后变为0
            // 开始step_stop为0,将读取一次数据
            else if(!step_stop)begin
                // 当计数达到52，一次读取过程结束，判断当前已读取卷积核个数
                if(count == 52)begin
                    if(sign) begin
                        sign = 0;
                        kernal_num = 0;
                    end
                    else kernal_num = kernal_num + 1;
                    // 已读取卷积核个数增加
                    num <= num +1'd1;
                    // 如果读取完32个卷积核则将全部读取结束信号置1
                    if(num == 32) begin
                        ok <= 1'd1;
                        num = 0;
                    end
                    else step_stop <= 1'd1;
                end
                // 开始计数
                else begin
                    case(count)
                        6'd0,6'd1: addra = 25*num;
                        6'd2: addra = 25*num + 1;
                        6'd3: kernal_data_0 = douta;
                        6'd4: addra = 25*num + 2;
                        6'd5: kernal_data_1 = douta;
                        6'd6: addra = 25*num + 3;
                        6'd7: kernal_data_2 = douta;
                        6'd8: addra = 25*num + 4;
                        6'd9: kernal_data_3 = douta;
                        6'd10: addra = 25*num + 5;
                        6'd11: kernal_data_4 = douta;
                        6'd12: addra = 25*num + 6;
                        6'd13: kernal_data_5 = douta;
                        6'd14: addra = 25*num + 7;
                        6'd15: kernal_data_6 = douta;
                        6'd16: addra = 25*num + 8;
                        6'd17: kernal_data_7 = douta;
                        6'd18: addra = 25*num + 9;
                        6'd19: kernal_data_8 = douta;
                        6'd20: addra = 25*num + 10;
                        6'd21: kernal_data_9 = douta;
                        6'd22: addra = 25*num + 11;
                        6'd23: kernal_data_10 = douta;
                        6'd24: addra = 25*num + 12;
                        6'd25: kernal_data_11 = douta;
                        6'd26: addra = 25*num + 13;
                        6'd27: kernal_data_12 = douta;
                        6'd28: addra = 25*num + 14;
                        6'd29: kernal_data_13 = douta;
                        6'd30: addra = 25*num + 15;
                        6'd31: kernal_data_14 = douta;
                        6'd32: addra = 25*num + 16;
                        6'd33: kernal_data_15 = douta;
                        6'd34: addra = 25*num + 17;
                        6'd35: kernal_data_16 = douta;
                        6'd36: addra = 25*num + 18;
                        6'd37: kernal_data_17 = douta;
                        6'd38: addra = 25*num + 19;
                        6'd39: kernal_data_18 = douta;
                        6'd40: addra = 25*num + 20;
                        6'd41: kernal_data_19 = douta;
                        6'd42: addra = 25*num + 21;
                        6'd43: kernal_data_20 = douta;
                        6'd44: addra = 25*num + 22;
                        6'd45: kernal_data_21 = douta;
                        6'd46: addra = 25*num + 23;
                        6'd47: kernal_data_22 = douta;
                        6'd48: addra = 25*num + 24;
                        6'd49: kernal_data_23 = douta;
                        6'd50: addra = 25*num + 24;
                        6'd51: kernal_data_24 = douta;
                    endcase
                    count = count +1'd1;
                end
            end
        end
    end
   
endmodule