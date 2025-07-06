`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2025 13:28:26
// Design Name: 
// Module Name: ROM
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


module r(input wire clk,
           input wire [2:0] A,
           output reg [7:0] D);
reg [7:0] rom [0:7];
initial
begin
rom[0] = 8'd70;  // atan(2^0) ≈ 45°
rom[1] = 8'd32;  // atan(2^-1) ≈ 26.565°
rom[2] = 8'd16;  // atan(2^-2) ≈ 14.036°
rom[3] = 8'd8;   // atan(2^-3) ≈ 7.125°
rom[4] = 8'd4;   // atan(2^-4) ≈ 3.576°
rom[5] = 8'd2;   // atan(2^-5) ≈ 1.790°
rom[6] = 8'd1;   // atan(2^-6) ≈ 0.895°
rom[7] = 8'd1;   // atan(2^-7) ≈ 0.448°
end

always @(*)
D<=rom[A];
endmodule