module counter_top_module (
    input clk,
    input rst,
    output [3:0] count

);

//Internal Signals
wire clk_1Hz;

//Instantiate the clock divider module
clock_divider_100MHz_to_1Hz hundMHz_to_oneHz(
    .rst(rst),
    .clk(clk),
    .clk_out(clk_1Hz)
);

//Instantiate the counter module
counter OneHz(
    .clk(clk_1Hz),
    .rst(rst),
    .count(count)
);
    
endmodule