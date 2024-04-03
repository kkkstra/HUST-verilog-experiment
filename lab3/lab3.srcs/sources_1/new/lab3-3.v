`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 15:18:44
// Design Name: 
// Module Name: divider_and_counter
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


module divider_and_counter(clk, out, SW);
    input clk;
    input [2:0] SW;
    output [2:0] out;
    wire clk_N;
    
    divider d1(.clk(clk), .clk_N(clk_N), .SW(SW));
    counter c1(.clk(clk_N), .out(out[2:0]), .SW(SW));
endmodule
