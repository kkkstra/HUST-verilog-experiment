`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/20 20:13:18
// Design Name: 
// Module Name: lab2-1
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


module _7Seg_Driver_Direct(SW, CA, CB, CC, CD, CE, CF, CG, DP, AN, LED);
	input [15:0] SW;                          // 16位拨动开关
	output CA, CB, CC, CD, CE, CF, CG, DP;    // 7段数码管驱动，低电平有效
	output [7:0] AN;                          // 7段数码管片选信号，低电平有效
	output [15:0] LED;                        // 16位LED显示，高电平有效
	
	assign {CA, CB, CC, CD, CE, CF, CG, DP} = SW[7:0];
	assign AN[7:0] = SW[15:8];
	assign LED[15:0] = SW[15:0];
endmodule

