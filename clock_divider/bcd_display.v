module bcd_display (
    input clk,
    input rst,
    input [3:0] count,
    output reg [3:0] anode,
    output reg [6:0] bcd_led1,
    output reg [6:0] bcd_led2,
    output reg [6:0] bcd_led3,
    output reg [6:0] bcd_led4
);

parameter zero = 7'b0000001;
parameter one = 7'b1001111;
parameter two = 7'b0010010;
parameter three = 7'b0000110;
parameter four = 7'b1001100;
parameter five = 7'b0100100;
parameter six = 7'b0100000;
parameter seven = 7'b0001111;
parameter eight = 7'b0000000;
parameter nine = 7'b0000100;

always @(posedge(clk)) begin
    anode = 4'b1100;
    case(count)
        4'b0000: begin
            bcd_led1 = zero;
            bcd_led2 = zero;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b0001: begin
            bcd_led1 = 7'b1111001;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b0010: begin
            bcd_led1 = 7'b0100100;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b0011: begin
            bcd_led1 = 7'b0110000;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b0100: begin
            bcd_led1 = 7'b0011001;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b0101: begin
            bcd_led1 = 7'b0010010;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b0110: begin
            bcd_led1 = 7'b0000010;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b0111: begin
            bcd_led1 = 7'b1111000;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b1000: begin
            bcd_led1 = 7'b0000000;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        4'b1001: begin
            bcd_led1 = 7'b0010000;
            bcd_led2 = 7'b1000000;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
        default: begin
            bcd_led1 = 7'b1111111;
            bcd_led2 = 7'b1111111;
            bcd_led3 = zero;
            bcd_led4 = zero;
        end
    endcase
end

    
endmodule