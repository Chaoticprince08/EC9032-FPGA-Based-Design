`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2025 09:55:48 PM
// Design Name: 
// Module Name: clock_div_eightMhz_to_1Hz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_div_eightMhz_to_1Hz(
    input clk,
    input rst,
    output reg clk_out

    );
    
    reg [32:0] counter;
    
    always @(posedge(clk) or posedge(rst)) begin
        
    end
endmodule
