`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 15:44:31
// Design Name: 
// Module Name: lab3-6
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


module dynamic_scan(clk, SEG, AN, SW);
    input clk;              // 系统时钟
    input [2:0] SW;
    output [7:0] SEG;  		// 分别对应CA、CB、CC、CD、CE、CF、CG和DP
    output [7:0] AN;        // 8位数码管片选信号
    wire [2:0] num;
    wire [3:0] code;
    
    divider_and_counter(.clk(clk), .out(num[2:0]), .SW(SW));
    decoder3_8(.num(num[2:0]), .sel(AN[7:0]));
    rom8x4(.addr(num[2:0]), .data(code[3:0]));
    pattern(.code(code[3:0]), .patt(SEG[7:0]));
    
endmodule

