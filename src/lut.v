`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 14:15:03
// Design Name: 
// Module Name: div_lut
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


module div_lut(
output [15:0] val,
input [2:0] addr
    );
    
reg [15:0] lut [0:7];
initial
begin
//lut[0] <= 16'd128;
//lut[1] <= 16'd64;
//lut[2] <= 16'd32;
//lut[3] <= 16'd16;
//lut[4] <= 16'd8;
//lut[5] <= 16'd4;
//lut[6] <= 16'd2;
//lut[7] <= 16'd1;
//lut[0] <= 16'd128;
lut[0] <= 16'd64;
lut[1] <= 16'd32;
lut[2] <= 16'd16;
lut[3] <= 16'd8;
lut[4] <= 16'd4;
lut[5] <= 16'd2;
lut[6] <= 16'd1;
end
assign val = lut[addr];

endmodule