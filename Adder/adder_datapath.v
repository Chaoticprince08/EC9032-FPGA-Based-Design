module datapath (
    input clk,
    input rst,
    input [3:0] A, B, C, D,
    output reg [15:0] sum
);

always @(posedge clk or posedge rst) begin
    if(rst) begin
        sum <= 16'b0;
    end
    else begin
        
    end
end
    
endmodule