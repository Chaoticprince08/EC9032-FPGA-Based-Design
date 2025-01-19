/*
Developed by : Vecha Sathwik
Date : 19/01/2025
Version : Alpha
Rev : 1.0
*/

`include "clock_divider.v"
`timescale 1ns/1ps
module clock_divider_tb;
    reg rst;
    reg clk;
    wire clk_out;
    
    
    clock_divider_100MHz_to_1Hz uut(
        .rst(rst),
        .clk(clk),
        .clk_out(clk_out)
    );
    
    initial begin
        //$dumpfile("clock_divider_tb.vcd"); Occupies more space due to more data
        //$dumpvars(0, clock_divider_tb);
        
        rst = 1'b1;
        clk = 1'b0;
        #10 rst = 1'b0;
        #2000000000 $finish;
    end
    
    always begin
        #5 clk = ~clk;
    end
    
endmodule