/* 
Developed by : Vecha Sathwik
Date : 17/01/2025
Version : Beta
Rev : 1.0
Status : Working
Updates : Synchronous flow of data without pipeline
*/
`include "mac_topmodule.v"
`timescale 1ns / 1ps
module mac_testbench;

//Input Signals
reg clk;
reg rst;
reg go;
reg [3:0] A;
reg [3:0] B;
wire [11:0] out;
wire done;

//Instantiate the mac_topmodule
mac_topmodule mac_topmodule_inst1(
    .clk(clk),
    .rst(rst),
    .A(A),
    .B(B),
    .go(go),
    .out(out),
    .done(done)
);

//Internal Variable
integer i;

//Clock Generation
initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
end

//Stimuli
initial begin
    $dumpfile("mac_testbench.vcd");
    $dumpvars;
    rst = 1'b1;
    #10;
    rst = 1'b0;
    go = 1'b1;
    #7;
    go =1'b0;
    for(i=0; i<16; i=i+1) begin
        A = $random%16;
        B = $random%16;
        #25;
    end

    #1000;
    $finish;

end
    
endmodule