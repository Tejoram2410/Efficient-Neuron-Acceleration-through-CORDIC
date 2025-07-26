`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 12:34:45
// Design Name: 
// Module Name: multiply
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


module multiply(input wire[7:0] A,B,
                input wire [2:0] counter,
                input wire clk,start,stop,
                output wire [15:0] C,
                output wire [15:0] Zn);
reg [7:0] Xi = 8'd0;
reg [15:0] Yi = 16'd0,Zi = 16'd0;
wire [7:0] Xn;
wire [15:0] Yn;
wire [7:0] val;
wire di;
wire [7:0] Ai,Bi;
wire [7:0] As,Bs;

mul_lut l(counter,val);
assign di = Zi[7],Xn = Xi,C = Yn,
Yn = (~di)? (Yi+(Xi<<(7-counter))) : (Yi-(Xi<<(7-counter))),
Zn = (~di)? (Zi - val) : (Zi + val);
assign As = 8'd0-A;
assign Bs = 8'd0-B;
assign {Ai,Bi} = ({A[7],B[7]} == 2'b00 ) ? {A,B} : 
                 ({A[7],B[7]} == 2'b01 ) ? {A,B} :
                 ({A[7],B[7]} == 2'b10 ) ? {B,A} :
                 ({A[7],B[7]} == 2'b11 ) ? {As,Bs} : {16'd0,16'd0} ;
               
always@(posedge clk)
 begin
 if(counter == 3'd0)
  begin 
  Xi <= Ai; Yi <= 8'd0; Zi <= Bi;
  end
 else if(!stop)
  begin
  Xi <= Xn; Yi <= Yn; Zi <= Zn;
  end
 end
endmodule
