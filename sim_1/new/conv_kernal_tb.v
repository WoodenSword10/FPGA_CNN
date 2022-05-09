`timescale 1ns / 1ns

module conv_kernal_tb;

    reg clk;
    reg en;
    wire ok;
    wire [5:0] count;
    wire [4:0] num;
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

    RAM_read_convkernal RAM_read_convkernal(
        .clk(clk),
        .en(en),
        .ok(ok),
        .count(count),
        .num(num),
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

    initial clk = 1;
    always#10 clk=!clk;
    
    initial begin
        en = 1;
        #100000;
        en = 0;
        $stop;
    end
    
endmodule
