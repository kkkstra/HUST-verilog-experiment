`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 11:39:38
// Design Name: 
// Module Name: lab3-1
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


module divider(clk, clk_N, SW);
    input clk;                      // 系统时钟
    input [2:0] SW;         
    output reg clk_N;                   // 分频后的时钟
    integer N = 100_000_00;      // 1Hz的时钟,N=fclk/fclk_N
    reg [31:0] counter;             /* 计数器变量，通过计数实现分频。
                                       当计数器从0计数到(N/2-1)时，
                                       输出时钟翻转，计数器清零 */
    initial
    begin
        counter = 0;
        clk_N = 0;
    end
    
    always @(posedge clk)           // 时钟上升沿 
    begin
        case(SW)
            3'b010: N = 1_000;
            default: N = 100_000_000;
        endcase
        counter <= counter + 1;
        if (counter > N / 2)
        begin
            clk_N <= ~clk_N;
            counter <= 0;
        end
    end
endmodule
