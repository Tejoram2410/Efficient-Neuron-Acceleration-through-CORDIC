`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2025 14:26:12
// Design Name: 
// Module Name: tb
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


module tb();
reg [7:0] X0,Y0,Z0;
reg clk,s1;
wire [7:0] Xn,Yn,Zn;
SerialCordic S(X0,Y0,Z0,clk,s1,Xn,Yn,Zn);
initial 
begin
clk = 1'b0;
forever #5 clk = ~clk;
end
initial
begin
X0 <= 8'b01001101; Y0 <= 8'b00000000; Z0 <= 8'd64;s1<=1'b1;
#5 s1<=1'b0;
end
initial #80 $finish; 
endmodule