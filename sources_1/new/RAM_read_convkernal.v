module RAM_read_convkernal(
    clk,                // ���룬ʱ��
    en,                 // ���룬����ʹ��
    ok,                 // �����ȫ����ȡ����ź�
    stop,               // ���룬 һ�ζ�ȡ��ʼ�ź�
    step_stop,          // �����һ�ζ�ȡ�����ź�
//    count,              // �����������
    kernal_num,         // �������ǰ�ڼ��������
    kernal_data_0,      // ��������������
    kernal_data_1,      // ��������������
    kernal_data_2,      // ��������������
    kernal_data_3,      // ��������������
    kernal_data_4,      // ��������������
    kernal_data_5,      // ��������������
    kernal_data_6,      // ��������������
    kernal_data_7,      // ��������������
    kernal_data_8,      // ��������������
    kernal_data_9,      // ��������������
    kernal_data_10,      // ��������������
    kernal_data_11,      // ��������������
    kernal_data_12,      // ��������������
    kernal_data_13,      // ��������������
    kernal_data_14,      // ��������������
    kernal_data_15,      // ��������������
    kernal_data_16,      // ��������������
    kernal_data_17,      // ��������������
    kernal_data_18,      // ��������������
    kernal_data_19,      // ��������������
    kernal_data_20,      // ��������������
    kernal_data_21,      // ��������������
    kernal_data_22,      // ��������������
    kernal_data_23,      // ��������������
    kernal_data_24      // ��������������
);

    input clk;                  // ʱ��
    input en;                   // ����ʹ��
    input stop;                 // һ�ζ�ȡ��ʼ�ź�
    output reg ok = 1'd0;       // ȫ����ȡ�����ź�
    output reg step_stop = 0;    // һ�ζ�ȡ�����ź�
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
    
    output reg [5:0] kernal_num = 63;      // ����˼���
    reg [9:0] addra;                // kernal RAM��ȡ��ַ
    wire douta;                     // kernal RAM��ȡ����
    reg [5:0] count = 0;            // ������
    reg [5:0] num = 0;              
    reg sign = 1'd1;                // ��һ��������ź�
    
    
    conv_kernal_1 conv_kernal_1(
        .clka(clk),     // ʱ��
        .addra(addra),  // ��ַ
        .douta(douta)   // ����
    );
   
    always@(posedge clk)begin
        // ����ʹ��
        if(en) begin
            // ���յ���ʼ�źſ�ʼ��ȡ25�����������
            if(stop)begin
                addra = 25 * num;
                // һ�ζ�ȡ�����ź���Ϊ0
                if(num == 32) ok = 1;
                else step_stop <= 0;
                // ��������Ϊ0
                count <= 0;
            end
            // stopΪ�����źţ�һʱ�Ӻ��Ϊ0
            // ��ʼstep_stopΪ0,����ȡһ������
            else if(!step_stop)begin
                // �������ﵽ52��һ�ζ�ȡ���̽������жϵ�ǰ�Ѷ�ȡ����˸���
                if(count == 52)begin
                    if(sign) begin
                        sign = 0;
                        kernal_num = 0;
                    end
                    else kernal_num = kernal_num + 1;
                    // �Ѷ�ȡ����˸�������
                    num <= num +1'd1;
                    // �����ȡ��32���������ȫ����ȡ�����ź���1
                    if(num == 32) begin
                        ok <= 1'd1;
                        num = 0;
                    end
                    else step_stop <= 1'd1;
                end
                // ��ʼ����
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