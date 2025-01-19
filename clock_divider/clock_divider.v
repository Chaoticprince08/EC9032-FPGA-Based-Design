/*
Developed by : Vecha Sathwik
Date : 19/01/2025
Version : Alpha
Rev : 1.0
*/
`timescale 1ns/1ps
module clock_divider_100MHz_to_1Hz(
    input rst,
    input clk,
    output reg clk_out
    );

    reg [32:0] counter;

    always @(posedge(clk) or posedge(rst)) begin
        //$display("counter = %d", counter); //For debug purpose
        //$display("clk_out = %d", clk_out); //For debug purpose
        if (rst == 1'b1) begin
            clk_out <= 1'b0;
            counter <= 32'b0;
        end
        else begin
            if (counter == 5_000_0000) begin
                counter <= 32'b0;
                clk_out <= ~clk_out;
            end
            else begin
                counter <= counter + 1;
            end
        end        
    end
    
endmodule