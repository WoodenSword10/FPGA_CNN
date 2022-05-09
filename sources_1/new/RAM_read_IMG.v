module RAM_read_IMG(
    clk,            // ���룬ʱ��
    en,             // ���룬����ʹ��
    row,            // ���룬��ǰ��ʼ��ȡ������������
    col,            // ���룬��ǰ��ʼ��ȡ������������
    restart,        // ���룬���¿�ʼ��ȡ��־
    Stop,           // �������ȡһ�ν�����־
    addra,          // �����MG2 RAM��ַ
    img_data_0,     // �����ͼƬ����0
    img_data_1,     // �����ͼƬ����1
    img_data_2,     // �����ͼƬ����2
    img_data_3,     // �����ͼƬ����3
    img_data_4,     // �����ͼƬ����4
    img_data_5,     // �����ͼƬ����5
    img_data_6,     // �����ͼƬ����6
    img_data_7,     // �����ͼƬ����7
    img_data_8,     // �����ͼƬ����8
    img_data_9,     // �����ͼƬ����9
    img_data_10,    // �����ͼƬ����10
    img_data_11,    // �����ͼƬ����11
    img_data_12,    // �����ͼƬ����12
    img_data_13,    // �����ͼƬ����13
    img_data_14,    // �����ͼƬ����14
    img_data_15,    // �����ͼƬ����15
    img_data_16,    // �����ͼƬ����16
    img_data_17,    // �����ͼƬ����17
    img_data_18,    // �����ͼƬ����18
    img_data_19,    // �����ͼƬ����19
    img_data_20,    // �����ͼƬ����20
    img_data_21,    // �����ͼƬ����21
    img_data_22,    // �����ͼƬ����22
    img_data_23,    // �����ͼƬ����23
    img_data_24     // �����ͼƬ����24
);

    input clk;                      // ʱ��
    input en;                       // ����ʹ��
    input wire [4:0] row;           // ��ǰ��ʼ��ȡ������������
    input wire [4:0] col;           // ��ǰ��ʼ��ȡ������������
    input restart;                  // ���¿�ʼ��ȡ��־
    output Stop;                    // ��ȡһ�ν�����־
    output reg [7:0] img_data_0;   //����0
    output reg [7:0] img_data_1;   //����1
    output reg [7:0] img_data_2;   //����2
    output reg [7:0] img_data_3;   //����3
    output reg [7:0] img_data_4;   //����4
    output reg [7:0] img_data_5;   //����5
    output reg [7:0] img_data_6;   //����6
    output reg [7:0] img_data_7;   //����7
    output reg [7:0] img_data_8;   //����8
    output reg [7:0] img_data_9;   //����9
    output reg [7:0] img_data_10;  //����10
    output reg [7:0] img_data_11;  //����11
    output reg [7:0] img_data_12;  //����12
    output reg [7:0] img_data_13;  //����13
    output reg [7:0] img_data_14;  //����14
    output reg [7:0] img_data_15;  //����15
    output reg [7:0] img_data_16;  //����16
    output reg [7:0] img_data_17;  //����17
    output reg [7:0] img_data_18;  //����18
    output reg [7:0] img_data_19;  //����19
    output reg [7:0] img_data_20;  //����20
    output reg [7:0] img_data_21;  //����21
    output reg [7:0] img_data_22;  //����22
    output reg [7:0] img_data_23;  //����23
    output reg [7:0] img_data_24;  //����24
    
    output reg [9:0] addra = 10'd0;  // IMG2 RAM��ַ
    wire [7:0] douta;                // IMG2 RAM��ȡ���
    reg [7:0] count = 7'd0;         // ��ȡ���ݼ���
    reg Stop = 1'd0;                // ��ȡһ�ν�����־�� 1Ϊ����
    reg img_start = 1'd0;
    
    always@(posedge clk) begin
        // ����ʹ��
        if(en) begin
            // �յ�restart�źſ�ʼ��ȡ5*5������������
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