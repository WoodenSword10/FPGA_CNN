// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Tue Apr 26 12:18:00 2022
// Host        : WIN-7T820JA8FHG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Xilinx_FPGA/Project/CNN_2/CNN_2.srcs/sources_1/ip/poor2/poor2_stub.v
// Design      : poor2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module poor2(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[10:0],dina[0:0],clkb,addrb[10:0],doutb[0:0]" */;
  input clka;
  input [0:0]wea;
  input [10:0]addra;
  input [0:0]dina;
  input clkb;
  input [10:0]addrb;
  output [0:0]doutb;
endmodule
