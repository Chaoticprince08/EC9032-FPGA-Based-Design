/* 
Developed by : Vecha Sathwik
Date : 17/01/2025
Version : Alpha
Rev : 1.0
*/
`include "mac_controlpath.v"
`include "mac_datapath.v"
`timescale 1ns / 1ps
module mac_topmodule (
    input clk,
    input rst,
    input [3:0] A,
    input [3:0] B,
    input go,
    output reg [11:0] out,
    output reg done
);

//Internal Signals
wire load_a;
wire load_b;
wire load_m;
wire load_acc;
wire load_out;
wire cmp;
wire count_enable;
    
endmodule