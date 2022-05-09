module RAM_r_w_layer1_data(
    clk,                    // ʱ��
    ok,                     // һ�ζ�ȡ�����ź�
    one_read_ok,            // һ�ξ���˶�ȡ�����ź�
    row,                    // ��ȡ������������
    col,                    // ��ȡ������������
    num,                    // ��ȡ��������ͼƬ��
    wea1,                    // д��ʹ��
    layer1_data_0,          // ��ȡlayer1_data����
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
      
    input clk;                                      // ʱ��
    input one_read_ok;                              // һ�ξ���˶�ȡ�����ź�
    input wire [3:0] col;                           // ��ȡ������������
    input wire [3:0] row;                           // ��ȡ������������
    input wire [4:0] num;                           // ��ȡ��������ͼƬ��
    output reg ok = 0;                           // ��ȡ������־
    wire doutb;                                     // layer1_data RAM ��ȡ���ݽ��
    reg wea;                                 // layer1_data RAM д��ʹ��
    output reg wea1;
    wire dina;                               // layer1_data RAM д������
    wire [12:0] addra;                       // layer1_data RAM д���ַ
    reg [12:0] addrb = 13'd0;                // layer1_data RAM ��ȡ��ַ
    output reg layer1_data_0;   //����0
    output reg layer1_data_1;   //����1
    output reg layer1_data_2;   //����2
    output reg layer1_data_3;   //����3
    output reg layer1_data_4;   //����4
    output reg layer1_data_5;   //����5
    output reg layer1_data_6;   //����6
    output reg layer1_data_7;   //����7
    output reg layer1_data_8;   //����8
    output reg layer1_data_9;   //����9
    output reg layer1_data_10;  //����10
    output reg layer1_data_11;  //����11
    output reg layer1_data_12;  //����12
    output reg layer1_data_13;  //����13
    output reg layer1_data_14;  //����14
    output reg layer1_data_15;  //����15
    output reg layer1_data_16;  //����16
    output reg layer1_data_17;  //����17
    output reg layer1_data_18;  //����18
    output reg layer1_data_19;  //����19
    output reg layer1_data_20;  //����20
    output reg layer1_data_21;  //����21
    output reg layer1_data_22;  //����22
    output reg layer1_data_23;  //����23
    output reg layer1_data_24;  //����24
    
    reg [6:0] count = 7'd0;
    wire sign;
    wire sign2;
    reg sign3 = 0;
    // �ػ�ģ��
    layer1 layer1(
        .clk(clk),
        .sign(sign),
        .sign2(sign2),
        .res(dina),
        .addra(addra)
    );
    // layer1_data RAM ģ�� ��ŵ�һ�����ػ�����������
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
    // д��ʹ�ܿ���
    always@(posedge clk) begin
        // ��sign/sign2��һ��ʱ��layer1_data RAMд��ʹ����Ч
        if(sign ^ sign2) wea = 1;
        else wea = 0;
    end
    // ��ȡ����
    always@(posedge clk) begin
        // һ�ξ���˶�ȡ������
        if(one_read_ok) begin
            // ����ȡ������־��0
            ok = 0;
            sign3 = 1;
            // �������
            count = 0;
        end
        else if(sign3) begin
            if(count == 76)begin
                count = 7'd0;
                // ��ȡ����
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
