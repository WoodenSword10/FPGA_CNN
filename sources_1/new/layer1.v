module layer1(
    clk,        // ʱ��
    sign,       // RAM��ȡ������ʼ��־
    sign2,      // ���ڳػ��������������һ�γػ������λ���趨Ϊ1
    res,        // �ػ����
    addra       //  �ػ�������ַ
);

    input clk;              // ʱ��
        
    wire conv1_start;       // ������㿪ʼ
    wire conv1_over;        // ����������
    wire [13:0] sum;        // ���������
    wire [14:0] poor_addra; // poor_1 RAM д���ַ
    wire poor_dina;         // poor_1 RAM д������
    reg [14 : 0] addrb;     // poor_1 RAM ��ȡ��ַ
    wire doutb;             // poor_1 RAM ��ȡ����
    reg wea = 1'd1;         // poor_1 RAMд��ʹ��
    reg ok = 1'd0;          // һ�γػ����������־
    
    reg poor1_data_0;       // ���ػ�����1
    reg poor1_data_1;       // ���ػ�����2
    reg poor1_data_2;       // ���ػ�����3
    reg poor1_data_3;       // ���ػ�����4
    reg [4:0] row = 5'd0;   // poor_1 RAM ��ȡ������������
    reg [4:0] col = 5'd0;   // poor_1 RAM ��ȡ������������
    reg [4:0] count = 5'd0; // ������
    output reg res;         // �ػ����
    reg [5:0] num = 6'd0;   // poor_1 RAM ��ȡ��������ͼƬ
    output reg [12:0] addra = 13'd0; // �ػ�����λ��
     
    output reg sign = 0;    // RAM��ȡ������ʼ��־
    output reg sign2 = 1;   // ���ڳػ��������������һ�γػ������λ���趨Ϊ1
    // �������ģ��
    conv_1 conv_1(
        .clk(clk),
        .conv1_start(conv1_start),
        .conv1_over(conv1_over),
        .sum(sum),
        .poor_addra(poor_addra),
        .poor_dina(poor_dina)
    );
    // poor_1 RAMģ�飬��ž��������
   poor_1 poor_1(
      .clka(clk),
      .wea(conv1_start),
      .addra(poor_addra),
      .dina(poor_dina),
      .clkb(clk),
      .addrb(addrb),
      .doutb(doutb)
    );
    // ��ȡ�ĸ����ݲ����гػ�����ȡ���ֵ������ȫ0Ϊ0������Ϊ1
    always@(posedge clk)begin
        // ��ȡ�����һ��ͼƬ�󽫶�ȡ�����ر�
        if(num == 6'd32) sign = 1'd0;
        else if(conv1_over) sign = 1'd1;
        // ��������ʼ����ʼ��col/row/num
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
        // ���гػ�����
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
