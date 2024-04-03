`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/03 16:16:13
// Design Name: 
// Module Name: bin_to_bcd
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

module bin_to_bcd(bin, bcd);
    input [3:0] bin;
    output reg [7:0] bcd;
 
    always @(bin)
    begin
        case(bin)
            4'b0000 : bcd[7:0] = 8'b00000000;
            4'b0001 : bcd[7:0] = 8'b00000001;
            4'b0010 : bcd[7:0] = 8'b00000010;
            4'b0011 : bcd[7:0] = 8'b00000011;
            4'b0100 : bcd[7:0] = 8'b00000100;
            4'b0101 : bcd[7:0] = 8'b00000101;
            4'b0110 : bcd[7:0] = 8'b00000110;
            4'b0111 : bcd[7:0] = 8'b00000111;
            4'b1000 : bcd[7:0] = 8'b00001000;
            4'b1001 : bcd[7:0] = 8'b00001001;
            4'b1010 : bcd[7:0] = 8'b00010000;
            4'b1011 : bcd[7:0] = 8'b00010001;
            4'b1100 : bcd[7:0] = 8'b00010010;
            4'b1101 : bcd[7:0] = 8'b00010011;
            4'b1110 : bcd[7:0] = 8'b00010100;
            4'b1111 : bcd[7:0] = 8'b00010101;
            default : bcd[7:0] = 8'b10001110;
        endcase
    end
endmodule

module _7Seg_Driver_BCD(SW, AN, SEG);
    input [15:0] SW;
    inout [7:0] AN;
    output [7:0] SEG;
    wire [7:0] bcd;
    reg [3:0] bcd_display;
    
    bin_to_bcd(.bin(SW[3:0]), .bcd(bcd));
    always @(SW[15])
    begin
        case(SW[15])
            1'b1: bcd_display = bcd[7:4];
            default: bcd_display = bcd[3:0];
        endcase
    end
    decoder_4to16(.in(bcd_display), .out(SEG[7:0]));
    decoder_3to8(.in(SW[14:12]), .out(AN[7:0]));
endmodule
