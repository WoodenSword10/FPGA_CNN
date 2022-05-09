// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Apr 23 23:44:47 2022
// Host        : WIN-7T820JA8FHG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top poor_1 -prefix
//               poor_1_ poor_1_stub.v
// Design      : poor_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module poor_1(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[14:0],dina[0:0],clkb,addrb[14:0],doutb[0:0]" */;
  input clka;
  input [0:0]wea;
  input [14:0]addra;
  input [0:0]dina;
  input clkb;
  input [14:0]addrb;
  output [0:0]doutb;
endmodule
