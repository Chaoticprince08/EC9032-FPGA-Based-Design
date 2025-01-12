/*
Author : Vecha Sathwik
Version : 1.0
Date : 10/01/2025
Status : Working
Commit : Dev
*/

`timescale 1ns/1ps
module adder_datapath (
    input clk,
    input rst,
    input aload, bload, cload, dload,
    input asel,
    input output_enable,
    input [1:0] bsel,
    input [3:0] A, B, C, D,
    output reg [15:0] o_sum
);

reg [3:0] atemp,btemp,ctemp,dtemp;
reg [15:0] sum;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        sum <= 16'b0;
    end
    else begin
        if(output_enable == 1'b1) begin
            o_sum <= sum;
        end
        else if(aload == 1'b1 & bload == 1'b1 & cload == 1'b1 & dload == 1'b1) begin
            atemp <= A;
            btemp <= B;
            ctemp <= C;
            dtemp <= D;
        end
        else if(asel == 1'b1 & bsel == 2'b00) begin
            sum <= atemp + btemp;
        end
        else if(asel == 1'b0 & bsel == 2'b01) begin
            sum <= sum + ctemp;
        end
        else if(asel == 1'b0 & bsel == 2'b10) begin
            sum <= sum + dtemp;
        end

        
    end
end
    
endmodule