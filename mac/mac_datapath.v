/* 
Developed by : Vecha Sathwik
Date : 17/01/2025
Version : Beta
Rev : 1.0
Status : Working
Updates : Synchronous flow of data without pipeline
*/

`timescale 1ns / 1ps
module mac_datapath (
    input clk,
    input rst,
    input [3:0] A,
    input [3:0] B,
    input load_a,
    input load_b,
    input load_m,
    input load_acc,
    input load_out,
    input count_enable,
    output reg [11:0] out,
    output reg cmp,
    output reg done
);

//Internal Signals
reg [11:0] Racc;
reg reset_flag;
reg [7:0] temp_min;
reg [7:0] temp_mout;
reg [3:0] count_out;

//For reset Logic
always @(posedge rst or posedge clk) begin
    if(rst == 1'b1) begin
        Racc <= 12'b0;
        done <= 1'b0;
        out <= 12'b0;
        count_out <= 4'b0;
    end
    else begin
        if(load_out == 1'b1) begin
            out <= Racc;
            done <= 1'b1;
        end
        else if (load_a == 1'b1 & load_b == 1'b1) begin
            temp_min <= A*B;            
        end
        else if(load_m == 1'b1) begin
            temp_mout <= temp_min;
        end
        else if(load_acc == 1'b1) begin
            Racc <= Racc + temp_mout;
        end
    end
end


//Logic for counter
//The below logic may not be triggered for clock instead we can provide count_enable in process sensitivity list
always @(posedge(clk)) begin
    if(count_enable == 1'b1 & count_out <= 4'b1010) begin
        count_out <= count_out + 4'b0001;
        cmp <= 1'b0;
    end
    else if(count_out == 4'b1010) begin
        cmp <= 1'b1;
    end
end


endmodule