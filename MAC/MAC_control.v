`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2025 20:12:31
// Design Name: 
// Module Name: MAC_control
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


module MAC_control(input wire start,clk,
                   input wire [15:0] Zn,
                   output reg [2:0] counter,
                   output wire stop);
assign stop = (counter == 3'd7 | Zn == 16'b0);

always @(posedge clk)
begin
if(!stop)
counter<=counter+1'b1;
end
always @(negedge start)
counter <= 3'b0;
endmodule