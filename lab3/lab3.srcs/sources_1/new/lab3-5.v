`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 15:38:38
// Design Name: 
// Module Name: lab3-5
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


module decoder3_8(num, sel);
    input [2: 0] num;       // 数码管编号：0~7
    output reg [7:0] sel;       // 7段数码管片选信号，低电平有效
    always@(num)
        case(num)  
            3'b000 : sel[7:0] = 8'b11111110;
            3'b001 : sel[7:0] = 8'b11111101;
            3'b010 : sel[7:0] = 8'b11111011;
            3'b011 : sel[7:0] = 8'b11110111;
            3'b100 : sel[7:0] = 8'b11101111;
            3'b101 : sel[7:0] = 8'b11011111;
            3'b110 : sel[7:0] = 8'b10111111;
            default : sel[7:0] = 8'b01111111;
        endcase
endmodule

module pattern(code, patt);
input [3: 0] code;       // 16进制数字的4位二进制编码
output reg [7:0] patt;       // 7段数码管驱动，低电平有效
    always@(code)
        case(code)
            4'b0000 : patt[7:0] = 8'b11000000;
            4'b0001 : patt[7:0] = 8'b11111001;
            4'b0010 : patt[7:0] = 8'b10100100;
            4'b0011 : patt[7:0] = 8'b10110000;
            4'b0100 : patt[7:0] = 8'b10011001;
            4'b0101 : patt[7:0] = 8'b10010010;
            4'b0110 : patt[7:0] = 8'b10000010;
            4'b0111 : patt[7:0] = 8'b11111000;
            4'b1000 : patt[7:0] = 8'b10000000;
            4'b1001 : patt[7:0] = 8'b10011000;
            4'b1010 : patt[7:0] = 8'b10001000;
            4'b1011 : patt[7:0] = 8'b10000011;
            4'b1100 : patt[7:0] = 8'b11000110;
            4'b1101 : patt[7:0] = 8'b10100001;
            4'b1110 : patt[7:0] = 8'b10000110;
            default : patt[7:0] = 8'b10001110;
        endcase
endmodule
