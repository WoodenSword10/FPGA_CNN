module conv_1(
    clk,                // ���룬ʱ��
    conv1_start,        // ���������˹���ʹ���ź�
    conv1_over,         // �����������˶�ȡ�����ź�
    sum,                // �����һ�ξ������
    poor_addra,         // �����poor_1 RAM д���ַ
    poor_dina           // �����poor_1 RAM д������
);

    parameter initsum = 14'b10_0000_0000_0000;
    
    input clk;                                  // ʱ��
    // ����˶�ȡģ��
    output reg conv1_start = 1;                 // ����˶�ȡģ�鹤��ʹ��
    output wire conv1_over;                     // �����ȫ����ȡ�����ź�
    wire step_stop;                             // �����һ�ζ�ȡ��������
    reg stop = 1;                               // �����һ�ζ�ȡ��ʼ�ź�
    wire [5:0] kernal_num;                      // ����˸���
    // �������ģ��
    reg ok = 0;                                 // ͼƬȫ����ȡ������־����ʼΪ0 
    output reg [13:0] sum = initsum;            // ���������
    output reg [14:0] poor_addra = 0;           // 
    output reg poor_dina;                       // 
    // ͼƬ��ȡģ��
    reg en = 0;                                 // ͼƬ���ݶ�ȡģ�鹤��ʹ��
    reg restart = 0;                            // ͼƬ����һ�ζ�ȡ��ʼ�ź�
    reg [4:0] row = 0;                          // ͼƬ��ȡ����
    reg [4:0] col = 0;                          // ͼƬ��ȡ����
    wire Stop;                                  // ͼƬ����һ�ζ�ȡ�����ź�
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
        .clk(clk),                  // ���룬ʱ��
        .en(en),                    // ���룬ͼƬ���ݶ�ȡģ�鹤��ʹ�ܣ���ʼΪ0
        .row(row),                  // ���룬��ǰ��ȡ����
        .col(col),                  // ���룬��ǰ��ȡ����
        .restart(restart),          // ���룬һ�ζ�ȡ��ʼ�ź�
        .Stop(Stop),                // �������ȡһ�ν����ź�
        .addra(addra),
        .img_data_0(img_data_0),    // �����ͼƬ����
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
        .clk(clk),                      // ���룬ʱ��
        .en(conv1_start),               // ���룬����˶�ȡģ�鹤��ʹ�ܣ���ʼΪ1
        .ok(conv1_over),                // �����ȫ����ȡ�����ź�
        .stop(stop),                    // ���룬һ�ζ�ȡ��ʼ�ź�
        .step_stop(step_stop),          // �����һ�ζ�ȡ�����ź�
        .kernal_num(kernal_num),        // ���������˸���
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

    // ��ʼִ��һ�ξ���Ͷ�ȡ���ȴ�step_stop�ź�

    always@(posedge clk)begin
        // ��������ȫ����ȡ����
        if(conv1_over)begin
            // �رվ����ģ�鹤��ʹ��
            conv1_start = 1'd0;
        end
        else if(stop) begin
            stop = 1'd0;
            ok = 1'd0;
        end
        // һ�ξ����ȡ�������ͼƬ���ݶ�ȡģ�鹤��ʹ��
        else if(step_stop & !en) begin
            en = 1'd1;                  // ͼƬ���ݶ�ȡģ�鹤��ʹ��
            restart = 1'd1;             // һ�ζ�ȡ��ʼ�ź���Ϊ1
        end
        // ͼƬȫ����ȡ������־Ϊ1��
        else if(ok) begin
            sum <= initsum;
            en <= 0;
            col <= 0;
            row <= 0;
            stop <= 1;
        end
        // �ȴ�ͼƬ����һ�ζ�ȡ�����ź�
        else if(Stop) begin
            // ����col/row
            if(col == 5'd23) begin
                col = 5'd0;
                if(row == 5'd23) begin
                    ok=1'd1;
                end
                else row = row + 1'd1;
            end
            else col = col + 1'd1;
            // ����һ�ξ������
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
        // ��һ�ζ�ȡ��ʼ�ź���Ϊ0
        else restart = 1'd0;
    end
    
endmodule