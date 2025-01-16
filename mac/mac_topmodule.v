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
    output [11:0] out,
    output done
);

//Internal Signals
wire load_a;
wire load_b;
wire load_m;
wire load_acc;
wire load_out;
wire cmp;
wire count_enable;

mac_datapath datapath_inst1(
    .A(A),
    .B(B),
    .load_a(load_a),
    .load_b(load_b),
    .load_m(load_m),
    .load_acc(load_acc),
    .load_out(load_out),
    .count_enable(count_enable),
    .out(out),
    .cmp(cmp),
    .done(done)
);

mac_controlpath controlpath_inst1(
    .clk(clk),
    .rst(rst),
    .go(go),
    .cmp(cmp),
    .load_a(load_a),
    .load_b(load_b),
    .load_m(load_m),
    .load_acc(load_acc),
    .load_out(load_out),
    .count_enable(count_enable)
);
    
endmodule