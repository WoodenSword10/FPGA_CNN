`timescale 1ns / 1ns

module layer1_tb;
    
    reg clk;
    wire sign;
    wire sign2;
    wire res;
    wire [12:0] addra;
    
    layer1 layer1(
        .clk(clk),        // ʱ��
        .sign(sign),       // RAM��ȡ������ʼ��־
        .sign2(sign2),      // ���ڳػ��������������һ�γػ������λ���趨Ϊ1
        .res(res),        // �ػ����
        .addra(addra)       //  �ػ�������ַ
    );

    initial clk = 1;
    always#10 clk= !clk;
    
    initial begin
        #35000000;
        $stop;
    end
endmodule
