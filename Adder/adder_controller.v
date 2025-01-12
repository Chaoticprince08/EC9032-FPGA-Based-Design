/*
Author : Vecha Sathwik
Version : 1.0
Date : 10/01/2025
Status : Working
Commit : Dev
*/

`timescale 1ns / 1ps
module adder_controller (
    input clk,rst,go,
    output reg aload,bload,cload,dload,
    output reg asel,
    output reg [1:0] bsel,
    output reg output_enable
);

//States
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110;

reg [2:0] present_state, next_state;

always @(posedge clk or posedge rst) begin
    if(rst == 1'b1) begin
        present_state <= S0;
    end
    else begin
        present_state <= next_state;
    end
end

always @(go or present_state) begin
    if(go == 1'b1 & present_state == S0)   begin
        next_state = S1;
        output_enable = 1'b0;        
    end
    else begin
        case (present_state)
            S1 : begin
                next_state = S2;
            end  
            S2 : begin
                aload = 1'b1;
                bload = 1'b1;
                cload = 1'b1;
                dload = 1'b1;
                next_state = S3;
            end
            S3 : begin
                aload = 1'b0;
                bload = 1'b0;
                cload = 1'b0;
                dload = 1'b0;
                asel = 1'b1;
                bsel = 2'b00;
                next_state = S4;
            end
            S4 : begin
                asel = 1'b0;
                bsel = 2'b01;
                next_state = S5;
            end
            S5 : begin
                asel = 1'b0;
                bsel = 2'b10;
                next_state = S6;
            end
            S6 : begin
                output_enable = 1'b1;
                next_state = S0;
            end
            default: begin
                next_state = S0;
            end
        endcase
    end
end 


endmodule