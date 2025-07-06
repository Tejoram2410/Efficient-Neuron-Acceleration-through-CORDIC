`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 20:29:40
// Design Name: 
// Module Name: SerialCordic
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


module SerialCordic(input wire [7:0] X0,Y0,Z0,
                    input wire clk,s1,
                    output wire [7:0] Xn,Yn,Zn);
reg [7:0] Xi,Yi,Zi;
wire di;
reg s2 = 1'b0;
reg [2:0] i = 3'b001;
reg [2:0] address = 3'b000;
wire [7:0] D;
r mem(clk,address,D);
assign di = Zi[7];
       
assign Xn = (~di)? (Xi+(Yi>>>i)) : (Xi-(Yi>>>i)),
Yn = (~di)? (Yi+(Xi>>>i)) : (Yi-(Xi>>>i)),
Zn = (~di)? (Zi - D) : (Zi + D);

always@(posedge clk)
 begin
 if(s1)
  begin 
  Xi <= X0; Yi <= Y0; Zi <= Z0;
  end
 else
  begin
  Xi <= Xn; Yi <= Yn; Zi <= Zn;
  if(s2 == 1'b1) s2 <= 1'b0;
  else
   begin
   i <= i+1;
   address <= address+1;
   if(i == 3'b011) s2 <= 1'b1;
   end
  end
 end
endmodule
