`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 15:41:40
// Design Name: 
// Module Name: tb_mul
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


module MAC_tb();
reg [7:0][7:0] W,A;
reg clk,start,stop;
wire [15:0] Zn;
wire [15:0] C;
reg [2:0] count;
wire [2:0] counter;
MAC x(A[count],W[count],counter,clk,start,stop,C,Zn);
MAC_control M1(start,clk,Zn,counter,stop);
initial 
begin
clk = 1'b0;
forever #5 clk = ~clk;
end
initial
begin
A[0] <= 8'd23; W[0] <= 8'd45;
A[1] <= 8'd58; W[1] <= 8'd36;
A[2] <= 8'd25; W[2] <= 8'd15;
A[3] <= 8'd46; W[3] <= 8'd59;
A[4] <= 8'd51; W[4] <= 8'd56;
A[5] <= 8'd76; W[5] <= 8'd109;
A[6] <= 8'd18; W[6] <= 8'd108;
A[7] <= 8'd92; W[7] <= 8'd35;
count<=3'b0;
start <= 1'b1;
#2 start <= 1'b0;
end
always @(posedge clk)
begin
if(stop)
begin
count<=count + 1'b1;
start <= 1'b1;
#2 start <= 1'b0;
end
end

endmodule