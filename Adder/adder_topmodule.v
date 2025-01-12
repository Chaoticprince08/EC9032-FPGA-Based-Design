/*
Author : Vecha Sathwik
Version : 1.0
Date : 10/01/2025
Status : Working
Commit : Dev
*/
`include "adder_controller.v"
`include "adder_datapath.v"

`timescale 1ns / 1ps
module adder_topmodule (
    input clk,
    input rst,
    input go,
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    output [15:0] o_sum
);

wire asel, output_enable;
wire [1:0] bsel;
wire aload, bload, cload, dload;

adder_datapath datapath1(
    .clk(clk),
    .rst(rst),
    .aload(aload),
    .bload(bload),
    .cload(cload),
    .dload(dload),
    .asel(asel),
    .output_enable(output_enable),
    .bsel(bsel),
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .o_sum(o_sum)
);

adder_controller controller1(
    .clk(clk),
    .rst(rst),
    .go(go),
    .aload(aload),
    .bload(bload),
    .cload(cload),
    .dload(dload),
    .asel(asel),
    .bsel(bsel),
    .output_enable(output_enable)
);

endmodule