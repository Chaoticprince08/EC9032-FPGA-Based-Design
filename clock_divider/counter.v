module counter (
    input clk,
    input rst,
    output reg [3:0] count
    );

//Internal Signals
reg reset_flag;

always @(posedge(rst)) begin
    if(rst == 1'b1) begin
        reset_flag = 1'b1;
    end
    else begin
        reset_flag = 1'b0;
    end
end

always @(posedge(clk)) begin
    if(reset_flag == 1'b1) begin
        count <= 4'b0000;
    end
    else begin
        count <= count + 1'b1;
    end
end

    
endmodule