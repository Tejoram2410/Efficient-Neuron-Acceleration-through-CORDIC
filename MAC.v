`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 18:08:40
// Design Name: 
// Module Name: MAC
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


module MAC (input wire [7:0] An,Wn,
            input wire [2:0] counter,
            input wire clk,start,stop,
            output reg [15:0] out,
            output wire [15:0] Zn);
wire [15:0] outm;
multiply mul(An,Wn,counter,clk,start,stop,outm,Zn);
initial 
out <= 16'd0;
always@(posedge clk)
begin
if(stop)
out <= out+outm;
end
endmodule
