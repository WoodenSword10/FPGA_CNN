module RAM_read_IMG(
    clk,            // 输入，时钟
    en,             // 输入，工作使能
    row,            // 输入，当前开始读取数据所在行数
    col,            // 输入，当前开始读取数据所在列数
    restart,        // 输入，重新开始读取标志
    Stop,           // 输出，读取一次结束标志
    addra,          // 输出，MG2 RAM地址
    img_data_0,     // 输出，图片数据0
    img_data_1,     // 输出，图片数据1
    img_data_2,     // 输出，图片数据2
    img_data_3,     // 输出，图片数据3
    img_data_4,     // 输出，图片数据4
    img_data_5,     // 输出，图片数据5
    img_data_6,     // 输出，图片数据6
    img_data_7,     // 输出，图片数据7
    img_data_8,     // 输出，图片数据8
    img_data_9,     // 输出，图片数据9
    img_data_10,    // 输出，图片数据10
    img_data_11,    // 输出，图片数据11
    img_data_12,    // 输出，图片数据12
    img_data_13,    // 输出，图片数据13
    img_data_14,    // 输出，图片数据14
    img_data_15,    // 输出，图片数据15
    img_data_16,    // 输出，图片数据16
    img_data_17,    // 输出，图片数据17
    img_data_18,    // 输出，图片数据18
    img_data_19,    // 输出，图片数据19
    img_data_20,    // 输出，图片数据20
    img_data_21,    // 输出，图片数据21
    img_data_22,    // 输出，图片数据22
    img_data_23,    // 输出，图片数据23
    img_data_24     // 输出，图片数据24
);

    input clk;                      // 时钟
    input en;                       // 工作使能
    input wire [4:0] row;           // 当前开始读取数据所在行数
    input wire [4:0] col;           // 当前开始读取数据所在列数
    input restart;                  // 重新开始读取标志
    output Stop;                    // 读取一次结束标志
    output reg [7:0] img_data_0;   //数据0
    output reg [7:0] img_data_1;   //数据1
    output reg [7:0] img_data_2;   //数据2
    output reg [7:0] img_data_3;   //数据3
    output reg [7:0] img_data_4;   //数据4
    output reg [7:0] img_data_5;   //数据5
    output reg [7:0] img_data_6;   //数据6
    output reg [7:0] img_data_7;   //数据7
    output reg [7:0] img_data_8;   //数据8
    output reg [7:0] img_data_9;   //数据9
    output reg [7:0] img_data_10;  //数据10
    output reg [7:0] img_data_11;  //数据11
    output reg [7:0] img_data_12;  //数据12
    output reg [7:0] img_data_13;  //数据13
    output reg [7:0] img_data_14;  //数据14
    output reg [7:0] img_data_15;  //数据15
    output reg [7:0] img_data_16;  //数据16
    output reg [7:0] img_data_17;  //数据17
    output reg [7:0] img_data_18;  //数据18
    output reg [7:0] img_data_19;  //数据19
    output reg [7:0] img_data_20;  //数据20
    output reg [7:0] img_data_21;  //数据21
    output reg [7:0] img_data_22;  //数据22
    output reg [7:0] img_data_23;  //数据23
    output reg [7:0] img_data_24;  //数据24
    
    output reg [9:0] addra = 10'd0;  // IMG2 RAM地址
    wire [7:0] douta;                // IMG2 RAM读取结果
    reg [7:0] count = 7'd0;         // 读取数据计数
    reg Stop = 1'd0;                // 读取一次结束标志， 1为结束
    reg img_start = 1'd0;
    
    always@(posedge clk) begin
        // 工作使能
        if(en) begin
            // 收到restart信号开始读取5*5矩阵区域数据
            if(restart | Stop) begin
                count = 7'd0;
                img_start = 1'd1;
                Stop = 1'd0;
            end
            else if(img_start) begin
                if(count == 7'd75) begin
                    img_data_24 = douta;
                    Stop = 1'd1;
                    img_start = 1'd0;
                    count = 7'd0;
                end
                else begin
                    case(count)
                        0: addra = 28*row + col;
                        3: begin addra = 28*row + col + 1; img_data_0 = douta; end
                        6: begin addra = 28*row + col + 2; img_data_1 = douta; end
                        9: begin addra = 28*row + col + 3; img_data_2 = douta; end
                        12: begin addra = 28*row + col + 4; img_data_3 = douta; end
                        15: begin addra = 28 * (row + 1) + col; img_data_4 = douta; end
                        18: begin addra = 28 * (row + 1) + col + 1; img_data_5 = douta; end
                        21: begin addra = 28 * (row + 1) + col + 2; img_data_6 = douta; end
                        24: begin addra = 28 * (row + 1) + col + 3; img_data_7 = douta; end
                        27: begin addra = 28 * (row + 1) + col + 4; img_data_8 = douta; end
                        30: begin addra = 28 * (row + 2) + col; img_data_9 = douta; end
                        33: begin addra = 28 * (row + 2) + col + 1; img_data_10 = douta; end
                        36: begin addra = 28 * (row + 2) + col + 2; img_data_11 = douta; end
                        39: begin addra = 28 * (row + 2) + col + 3; img_data_12 = douta; end
                        42: begin addra = 28 * (row + 2) + col + 4; img_data_13 = douta; end
                        45: begin addra = 28 * (row + 3) + col; img_data_14 = douta; end
                        48: begin addra = 28 * (row + 3) + col + 1; img_data_15 = douta; end
                        51: begin addra = 28 * (row + 3) + col + 2; img_data_16 = douta; end
                        54: begin addra = 28 * (row + 3) + col + 3; img_data_17 = douta; end
                        57: begin addra = 28 * (row + 3) + col + 4; img_data_18 = douta; end
                        60: begin addra = 28 * (row + 4) + col; img_data_19 = douta; end
                        63: begin addra = 28 * (row + 4) + col + 1; img_data_20 = douta; end
                        66: begin addra = 28 * (row + 4) + col + 2; img_data_21 = douta; end
                        69: begin addra = 28 * (row + 4) + col + 3; img_data_22 = douta; end
                        72: begin addra = 28 * (row + 4) + col + 4; img_data_23 = douta; end
                        default:;
                    endcase
                    count = count + 1'd1;
                end
            end
        end
    end

    IMG2  IMG2(
      .clka(clk),
      .addra(addra),
      .douta(douta)
    );

endmodule