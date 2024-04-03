`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 15:15:19
// Design Name: 
// Module Name: counter
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


module counter(clk, out, SW);
    input clk;                   // 计数时钟
    input [2:0] SW;
    output reg [2:0] out;       // 计数值
    
    always @(posedge clk)       // 在时钟上升沿计数器加1
    begin
        case (SW)
            3'b100: out <= out + 1;
            3'b001: out <= out - 1;
            3'b000: out <= out;
            default: out <= out + 1;
        endcase
    end                           
endmodule

