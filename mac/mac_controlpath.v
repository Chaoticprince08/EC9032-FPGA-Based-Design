/* 
Developed by : Vecha Sathwik
Date : 17/01/2025
Version : Alpha
Rev : 1.0
*/

`timescale 1ns / 1ps
module mac_controlpath (
    input clk,
    input rst,
    input go,
    input cmp,
    output reg load_a,
    output reg load_b,
    output reg load_m,
    output reg load_acc,
    output reg load_out,
    output reg count_enable
);

//States
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;
parameter S6 = 3'b110;
parameter S7 = 3'b111;

//Internal Signals
reg [2:0] present_state;
reg [2:0] next_state;

//For reset Logic and Present State Logic
always @(posedge rst or posedge clk) begin
    if(rst == 1'b1) begin
        present_state <= S0;
    end
    else begin
        present_state <= next_state;
    end
end

//MAC Control Logic
always @(go or present_state) begin
    if(go == 1'b1 & present_state == S0) begin
        next_state = S1;
    end
    else begin
        case (present_state)
            S1 : begin
                load_a = 1'b1;
                load_b = 1'b1;
                count_enable = 1'b1;
                next_state = S2;
            end

            S2 : begin
                count_enable = 1'b0;
                next_state = S3;
            end

            S3 : begin
                load_m = 1'b1;
                next_state = S4;
            end

            S4 : begin
                next_state = S5;
            end

            S5 : begin
                load_acc = 1'b1;
                next_state = S6;
            end

            S6 : begin
                next_state = (cmp == 1'b1) ? S7 : S1;
            end
            S7 : begin
                load_out = 1'b1;
                next_state = S0;
            end

            default : next_state = S0; 
        endcase
    end
end

endmodule