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
reg [3:0] data_in1;
reg [3:0] data_in2;
wire [11:0] out;
//wire done;

//Instantiate the mac_topmodule
mac_topmodule mac_topmodule_inst1(
    .clk(clk),
    .rst(rst),
    .A(data_in1),
    .B(data_in2),
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
    $dumpfile("dump.vcd");
    $dumpvars;
   data_in1=12;
    data_in2=6;
    go=0;
    rst=1;
    #50; 
    rst=0;

    #50;
    go=1; 
    #35; 
    go=0;

    $display("Applying Test Values:");
    for (i = 0; i < 10; i = i + 1) begin
        data_in1 = i; // Generating values (e.g., 0, 5, 10, 15, ...)
        data_in2 = 2*i+1;
        #76;  // Wait for 10 time units
     
    end
    #1000;
    $finish;
end


    



    
endmodule