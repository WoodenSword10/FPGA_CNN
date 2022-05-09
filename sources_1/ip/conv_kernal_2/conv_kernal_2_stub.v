// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Apr 24 18:01:10 2022
// Host        : WIN-7T820JA8FHG running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top conv_kernal_2 -prefix
//               conv_kernal_2_ conv_kernal_2_stub.v
// Design      : conv_kernal_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module conv_kernal_2(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[14:0],douta[0:0]" */;
  input clka;
  input [14:0]addra;
  output [0:0]douta;
endmodule
