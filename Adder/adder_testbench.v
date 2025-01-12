/*
Author : Vecha Sathwik
Version : 1.0
Date : 10/01/2025
Status : Working
Commit : Dev
*/

`include "adder_topmodule.v"

`timescale 1ns / 1ps
module adder_testbench;
    reg clk, rst, go;
    reg [3:0] A, B, C, D;
    wire [15:0] o_sum;

    adder_topmodule dut(
        .clk(clk),
        .rst(rst),
        .go(go),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .o_sum(o_sum)
    );

    //Clock Generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    //Stimuli
    initial begin
        $dumpfile("adder_testbench.vcd");
        $dumpvars;
        rst = 1'b1;
        #10 rst = 1'b0;
        go = 1'b0;
        A = 4'b0000;
        B = 4'b0010;
        C = 4'b0100;
        D = 4'b1000;
        #10 go = 1'b1;
        //$display("%d", o_sum);
        #100 $finish;
    end

endmodule