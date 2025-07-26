`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 14:18:48
// Design Name: 
// Module Name: div_tb
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

//module div(
//input [7:0] A, B,
//input clk, rst_n,
//output [7:0] C
//    );

module div_tb;

reg clk, rst_n;
reg [7:0] A, B;
wire [7:0] ans;

div dut(A, B, clk, rst_n, ans);

initial begin
clk = 1'b0;
forever #5 clk=~clk;
end

initial
begin
A <= 8'd7; B <= 8'd49;rst_n<=1'b1;
#1 rst_n<=1'b0;
#2 rst_n<=1'b1;
#80 $finish;
end

endmodule