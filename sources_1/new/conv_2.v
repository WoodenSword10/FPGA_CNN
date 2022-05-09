module conv_2(
    clk,
    en,
    addra,
    res,
    res_ok
);

    input clk;                  
    output reg en = 0;
    wire ok;
    wire ok2;
    reg stop = 0;
    wire step_stop;
    reg one_read_ok = 0;
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
    wire layer1_data_0;   //数据0
    wire layer1_data_1;   //数据1
    wire layer1_data_2;   //数据2
    wire layer1_data_3;   //数据3
    wire layer1_data_4;   //数据4
    wire layer1_data_5;   //数据5
    wire layer1_data_6;   //数据6
    wire layer1_data_7;   //数据7
    wire layer1_data_8;   //数据8
    wire layer1_data_9;   //数据9
    wire layer1_data_10;  //数据10
    wire layer1_data_11;  //数据11
    wire layer1_data_12;  //数据12
    wire layer1_data_13;  //数据13
    wire layer1_data_14;  //数据14
    wire layer1_data_15;  //数据15
    wire layer1_data_16;  //数据16
    wire layer1_data_17;  //数据17
    wire layer1_data_18;  //数据18
    wire layer1_data_19;  //数据19
    wire layer1_data_20;  //数据20
    wire layer1_data_21;  //数据21
    wire layer1_data_22;  //数据22
    wire layer1_data_23;  //数据23
    wire layer1_data_24;  //数据24
    reg [3:0] col;
    reg [3:0] row;
    reg [5:0] num = 0;
    wire wea;
    reg [5:0] count;
    reg [5:0] sum = 32;
    reg [4:0] channel_change = 0;

    reg poor_en = 0;
    
    output reg [10:0] addra;
    reg [10:0] count_num;
    output reg res = 0;
    output reg res_ok = 0;
    reg [11:0] data_0 = 0;
    reg [11:0] data_1 = 0;
    reg [11:0] data_2 = 0;
    reg [11:0] data_3 = 0;
    reg [11:0] data_4 = 0;
    reg [11:0] data_5 = 0;
    reg [11:0] data_6 = 0;
    reg [11:0] data_7 = 0;
    reg [11:0] data_8 = 0;
    reg [11:0] data_9 = 0;
    reg [11:0] data_10 = 0;
    reg [11:0] data_11 = 0;
    reg [11:0] data_12 = 0;
    reg [11:0] data_13 = 0;
    reg [11:0] data_14 = 0;
    reg [11:0] data_15 = 0;
    reg [11:0] data_16 = 0;
    reg [11:0] data_17 = 0;
    reg [11:0] data_18 = 0;
    reg [11:0] data_19 = 0;
    reg [11:0] data_20 = 0;
    reg [11:0] data_21 = 0;
    reg [11:0] data_22 = 0;
    reg [11:0] data_23 = 0;
    reg [11:0] data_24 = 0;
    reg [11:0] data_25 = 0;
    reg [11:0] data_26 = 0;
    reg [11:0] data_27 = 0;
    reg [11:0] data_28 = 0;
    reg [11:0] data_29 = 0;
    reg [11:0] data_30 = 0;
    reg [11:0] data_31 = 0;
    reg [11:0] data_32 = 0;
    reg [11:0] data_33 = 0;
    reg [11:0] data_34 = 0;
    reg [11:0] data_35 = 0;
    reg [11:0] data_36 = 0;
    reg [11:0] data_37 = 0;
    reg [11:0] data_38 = 0;
    reg [11:0] data_39 = 0;
    reg [11:0] data_40 = 0;
    reg [11:0] data_41 = 0;
    reg [11:0] data_42 = 0;
    reg [11:0] data_43 = 0;
    reg [11:0] data_44 = 0;
    reg [11:0] data_45 = 0;
    reg [11:0] data_46 = 0;
    reg [11:0] data_47 = 0;
    reg [11:0] data_48 = 0;
    reg [11:0] data_49 = 0;
    reg [11:0] data_50 = 0;
    reg [11:0] data_51 = 0;
    reg [11:0] data_52 = 0;
    reg [11:0] data_53 = 0;
    reg [11:0] data_54 = 0;
    reg [11:0] data_55 = 0;
    reg [11:0] data_56 = 0;
    reg [11:0] data_57 = 0;
    reg [11:0] data_58 = 0;
    reg [11:0] data_59 = 0;
    reg [11:0] data_60 = 0;
    reg [11:0] data_61 = 0;
    reg [11:0] data_62 = 0;
    reg [11:0] data_63 = 0;
    
    // 第一层数据读取模块
    RAM_r_w_layer1_data RAM_r_w_layer1_data(
        .clk(clk),
        .ok(ok),
        .one_read_ok(one_read_ok),
        .row(row),
        .col(col),
        .num(num),
        .wea1(wea),
        .layer1_data_0(layer1_data_0),
        .layer1_data_1(layer1_data_1),
        .layer1_data_2(layer1_data_2),
        .layer1_data_3(layer1_data_3),
        .layer1_data_4(layer1_data_4),
        .layer1_data_5(layer1_data_5),
        .layer1_data_6(layer1_data_6),
        .layer1_data_7(layer1_data_7),
        .layer1_data_8(layer1_data_8),
        .layer1_data_9(layer1_data_9),
        .layer1_data_10(layer1_data_10),
        .layer1_data_11(layer1_data_11),
        .layer1_data_12(layer1_data_12),
        .layer1_data_13(layer1_data_13),
        .layer1_data_14(layer1_data_14),
        .layer1_data_15(layer1_data_15),
        .layer1_data_16(layer1_data_16),
        .layer1_data_17(layer1_data_17),
        .layer1_data_18(layer1_data_18),
        .layer1_data_19(layer1_data_19),
        .layer1_data_20(layer1_data_20),
        .layer1_data_21(layer1_data_21),
        .layer1_data_22(layer1_data_22),
        .layer1_data_23(layer1_data_23),
        .layer1_data_24(layer1_data_24)
    );
    // 卷积核读取模块
    RAM_read_convkernal_2 RAM_read_convkernal_2(
        .clk(clk),
        .en(en),
        .ok(ok2),
        .stop(stop),
        .step_stop(step_stop),
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
    
    reg sign = 1;       // 工作使能开关处使仅执行一次              
    reg sign2 = 1;      // 
    reg sign3 = 1;
    reg sign4 = 1;
    reg sign5 = 1;
    reg sign6 = 1;
    reg sign7 = 1;
    reg sign8 = 1;
    reg sign9 = 1;
    reg sign10 = 1;
    reg sign11 = 1;
    
    always@(count)begin
        if(en)begin
            if(num == 0) begin
                if(sign11)begin
                    sign11 = 0;
                    data_0 <=0;
                    data_1 <=0;
                    data_2 <=0;
                    data_3 <=0;
                    data_4 <=0;
                    data_5 <=0;
                    data_6 <=0;
                    data_7 <=0;
                    data_8 <=0;
                    data_9 <=0;
                    data_10 <= 0;
                    data_11 <= 0;
                    data_12 <= 0;
                    data_13 <= 0;
                    data_14 <= 0;
                    data_15 <= 0;
                    data_16 <= 0;
                    data_17 <= 0;
                    data_18 <= 0;
                    data_19 <= 0;
                    data_20 <= 0;
                    data_21 <= 0;
                    data_22 <= 0;
                    data_23 <= 0;
                    data_24 <= 0;
                    data_25 <= 0;
                    data_26 <= 0;
                    data_27 <= 0;
                    data_28 <= 0;
                    data_29 <= 0;
                    data_30 <= 0;
                    data_31 <= 0;
                    data_32 <= 0;
                    data_33 <= 0;
                    data_34 <= 0;
                    data_35 <= 0;
                    data_36 <= 0;
                    data_37 <= 0;
                    data_38 <= 0;
                    data_39 <= 0;
                    data_40 <= 0;
                    data_41 <= 0;
                    data_42 <= 0;
                    data_43 <= 0;
                    data_44 <= 0;
                    data_45 <= 0;
                    data_46 <= 0;
                    data_47 <= 0;
                    data_48 <= 0;
                    data_49 <= 0;
                    data_50 <= 0;
                    data_51 <= 0;
                    data_52 <= 0;
                    data_53 <= 0;
                    data_54 <= 0;
                    data_55 <= 0;
                    data_56 <= 0;
                    data_57 <= 0;
                    data_58 <= 0;
                    data_59 <= 0;
                    data_60 <= 0;
                    data_61 <= 0;
                    data_62 <= 0;
                    data_63 <= 0;
                end
            end
            else if(num == 1) begin
                sign11 = 1;
            end
            else if(num == 31)begin
                if(sign8)begin
                    sign8 = 0;
                    addra = 0;
                end
                else addra = addra + 1;
            end
            count_num = count + 8 * row;
            sum = 32;
            if(kernal_data_0^layer1_data_0) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_1^layer1_data_1) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_2^layer1_data_2) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_3^layer1_data_3) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_4^layer1_data_4) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_5^layer1_data_5) sum = sum - 1; else sum = sum + 1;
            if(kernal_data_6^layer1_data_6) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_7^layer1_data_7) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_8^layer1_data_8) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_9^layer1_data_9) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_10^layer1_data_10) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_11^layer1_data_11) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_12^layer1_data_12) sum = sum - 1; else sum = sum + 1;
            if(kernal_data_13^layer1_data_13) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_14^layer1_data_14) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_15^layer1_data_15) sum = sum - 1; else sum = sum + 1;
            if(kernal_data_16^layer1_data_16) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_17^layer1_data_17) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_18^layer1_data_18) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_19^layer1_data_19) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_20^layer1_data_20) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_21^layer1_data_21) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_22^layer1_data_22) sum = sum - 1; else sum = sum + 1; 
            if(kernal_data_23^layer1_data_23) sum = sum - 1; else sum = sum + 1;
            if(kernal_data_24^layer1_data_24) sum = sum - 1; else sum = sum + 1;
            case(count_num)
                0: begin 
                    data_0 = data_0 + sum;
                    if(num == 31) begin
                        if(data_0 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                1: begin 
                    data_1 = data_1 + sum;
                    if(num == 31) begin
                        if(data_1 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                2: begin 
                    data_2 = data_2 + sum;
                    if(num == 31) begin
                        if(data_2 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                3: begin 
                    data_3 = data_3 + sum;
                    if(num == 31) begin
                        if(data_3 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                4: begin 
                    data_4 = data_4 + sum;
                    if(num == 31) begin
                        if(data_4 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                5: begin 
                    data_5 = data_5 + sum;
                    if(num == 31) begin
                        if(data_5 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                6: begin 
                    data_6 = data_6 + sum;
                    if(num == 31) begin
                        if(data_6 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                7: begin 
                    data_7 = data_7 + sum;
                    if(num == 31) begin
                        if(data_7 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                8: begin 
                    data_8 = data_8 + sum;
                    if(num == 31) begin
                        if(data_8 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                9: begin 
                    data_9 = data_9 + sum;
                    if(num == 31) begin
                        if(data_9 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                10: begin 
                    data_10 = data_10 + sum;
                    if(num == 31) begin
                        if(data_10 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                11: begin 
                    data_11 = data_11 + sum;
                    if(num == 31) begin
                        if(data_11 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                12: begin 
                    data_12 = data_12 + sum;
                    if(num == 31) begin
                        if(data_12 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                13: begin 
                    data_13 = data_13 + sum;
                    if(num == 31) begin
                        if(data_13 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                14: begin 
                    data_14 = data_14 + sum;
                    if(num == 31) begin
                        if(data_14 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                15: begin 
                    data_15 = data_15 + sum;
                    if(num == 31) begin
                        if(data_15 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                16: begin 
                    data_16 = data_16 + sum;
                    if(num == 31) begin
                        if(data_16 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                17: begin 
                    data_17 = data_17 + sum;
                    if(num == 31) begin
                        if(data_17 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                18: begin 
                    data_18 = data_18 + sum;
                    if(num == 31) begin
                        if(data_18 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                19: begin 
                    data_19 = data_19 + sum;
                    if(num == 31) begin
                        if(data_19 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                20: begin 
                    data_20 = data_20 + sum;
                    if(num == 31) begin
                        if(data_20 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                21: begin 
                    data_21 = data_21 + sum;
                    if(num == 31) begin
                        if(data_21 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                22: begin 
                    data_22 = data_22 + sum;
                    if(num == 31) begin
                        if(data_22 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                23: begin 
                    data_23 = data_23 + sum;
                    if(num == 31) begin
                        if(data_23 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                24: begin 
                    data_24 = data_24 + sum;
                    if(num == 31) begin
                        if(data_24 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                25: begin 
                    data_25 = data_25 + sum;
                    if(num == 31) begin
                        if(data_25 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                26: begin 
                    data_26 = data_26 + sum;
                    if(num == 31) begin
                        if(data_26 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                27: begin 
                    data_27 = data_27 + sum;
                    if(num == 31) begin
                        if(data_27 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                28: begin 
                    data_28 = data_28 + sum;
                    if(num == 31) begin
                        if(data_28 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                29: begin 
                    data_29 = data_29 + sum;
                    if(num == 31) begin
                        if(data_29 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                30: begin 
                    data_30 = data_30 + sum;
                    if(num == 31) begin
                        if(data_30 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                31: begin 
                    data_31 = data_31 + sum;
                    if(num == 31) begin
                        if(data_31 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                32: begin 
                    data_32 = data_32 + sum;
                    if(num == 31) begin
                        if(data_32 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                33: begin 
                    data_33 = data_33 + sum;
                    if(num == 31) begin
                        if(data_33 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                34: begin 
                    data_34 = data_34 + sum;
                    if(num == 31) begin
                        if(data_34 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                35: begin 
                    data_35 = data_35 + sum;
                    if(num == 31) begin
                        if(data_35 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                36: begin 
                    data_36 = data_36 + sum;
                    if(num == 31) begin
                        if(data_36 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                37: begin 
                    data_37 = data_37 + sum;
                    if(num == 31) begin
                        if(data_37 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                38: begin 
                    data_38 = data_38 + sum;
                    if(num == 31) begin
                        if(data_38 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                39: begin 
                    data_39 = data_39 + sum;
                    if(num == 31) begin
                        if(data_39 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                40: begin 
                    data_40 = data_40 + sum;
                    if(num == 31) begin
                        if(data_40 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                41: begin 
                    data_41 = data_41 + sum;
                    if(num == 31) begin
                        if(data_41 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                42: begin 
                    data_42 = data_42 + sum;
                    if(num == 31) begin
                        if(data_42 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                43: begin 
                    data_43 = data_43 + sum;
                    if(num == 31) begin
                        if(data_43 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                44: begin 
                    data_44 = data_44 + sum;
                    if(num == 31) begin
                        if(data_44 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                45: begin 
                    data_45 = data_45 + sum;
                    if(num == 31) begin
                        if(data_45 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                46: begin 
                    data_46 = data_46 + sum;
                    if(num == 31) begin
                        if(data_46 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                47: begin 
                    data_47 = data_47 + sum;
                    if(num == 31) begin
                        if(data_47 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                48: begin 
                    data_48 = data_48 + sum;
                    if(num == 31) begin
                        if(data_48 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                49: begin 
                    data_49 = data_49 + sum;
                    if(num == 31) begin
                        if(data_49 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                50: begin 
                    data_50 = data_50 + sum;
                    if(num == 31) begin
                        if(data_50 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                51: begin 
                    data_51 = data_51 + sum;
                    if(num == 31) begin
                        if(data_51 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                52: begin 
                    data_52 = data_52 + sum;
                    if(num == 31) begin
                        if(data_52 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                53: begin 
                    data_53 = data_53 + sum;
                    if(num == 31) begin
                        if(data_53 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                54: begin 
                    data_54 = data_54 + sum;
                    if(num == 31) begin
                        if(data_54 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                55: begin 
                    data_55 = data_55 + sum;
                    if(num == 31) begin
                        if(data_55 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                56: begin 
                    data_56 = data_56 + sum;
                    if(num == 31) begin
                        if(data_56 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                57: begin 
                    data_57 = data_57 + sum;
                    if(num == 31) begin
                        if(data_57 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                58: begin 
                    data_58 = data_58 + sum;
                    if(num == 31) begin
                        if(data_58 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                59: begin 
                    data_59 = data_59 + sum;
                    if(num == 31) begin
                        if(data_59 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                60: begin 
                    data_60 = data_60 + sum;
                    if(num == 31) begin
                        if(data_60 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                61: begin 
                    data_61 = data_61 + sum;
                    if(num == 31) begin
                        if(data_61 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                62: begin 
                    data_62 = data_62 + sum;
                    if(num == 31) begin
                        if(data_62 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                63: begin 
                    data_63 = data_63 + sum;
                    if(num == 31) begin
                        if(data_63 >= 12'H400) res = 1;
                        else res = 0;
                    end
                end
                default:;  
            endcase
        end
    end
    
    always@(posedge clk)begin
        if(wea & sign)begin
            en = 1;
            sign = 0;
        end
        else if(res_ok) en = 0;
    end
    
    always@(posedge clk)begin
        if(en)begin
            if(num == 31) begin
                poor_en = 1;
            end
            else poor_en = 0;
        end
    end
    
    always@(posedge clk)begin
        if(en)begin
            if(step_stop & sign2)begin
                if(sign2) begin
                    col = 0;
                    row = 0;
                    sign2 = 0;
                    one_read_ok = 1;
                end
            end
            else if(ok & sign3) begin
                if(sign3) begin
                    if(sign5) begin
                        sign5 = 0;
                        count = 0;
                    end
                    sign3 = 0;
                    one_read_ok = 1;
                    if(col == 7) begin
                        if(sign6) begin
                            sign6 = 0;
                            col = 7;
                        end
                        else begin
                            col = 0;
                            sign6 = 1;
                            if(row == 7)begin
                                row = 0;
                                stop = 1;
                                if(num == 31) begin
                                    num = 0;
                                    if(channel_change == 31)begin
                                        res_ok = 1;
                                    end
                                    else channel_change = channel_change + 1;
//                                    sign7 = !sign7;
                                end
                                else num = num + 1;
                            end
                            else begin
                                row = row + 1;
                            end
                        end
                    end
                    else col = col + 1;
                    if(col == 1) count = 0;
                    else if(col > 0)count = count + 1;
                end
            end
            else begin
                sign3 = 1;
                stop = 0;
                one_read_ok = 0;
                if(stop) sign2 = 1;
            end
        end
    end

endmodule