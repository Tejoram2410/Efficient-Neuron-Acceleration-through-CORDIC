`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2025 13:56:39
// Design Name: 
// Module Name: div
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


module div(
input [7:0] A, B,
input clk, rst_n,
output [7:0] C
    );
    
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    reg [1:0] state, nextstate;
    reg [7:0] Xi, Zi, Xn, Zn;
    reg [15:0] Yi, Yn;
    wire [15:0] val;
    wire d, ans_ready;
    reg [2:0] counter;
    wire [7:0] out_A, out_B;
    
    assign d = Yi[15];
    assign C = Zi[7:0];
    assign ans_ready = (Yi==0);
    assign out_A = (A[7]) ? ((~A)+1) : A;
    assign out_B = (A[7]) ? ((~B)+1) : B;
    
    always @(posedge clk, negedge rst_n)
    if (!rst_n) begin state <= S0; counter <= 0; Xn <= out_A; Yn <= {{8{out_B[7]}}, out_B}; Zn <= 8'b0; end
    else begin
        state <= nextstate; Xi <= Xn; Yi <= Yn; Zi <= Zn;
    end
    
    always @(state, Xi, Yi, Zi) begin
    case(state)
    S0: nextstate = S1;
    S1: begin
    if (counter == 3'b110) nextstate = S2;
    if(!ans_ready) begin
        case (d)
        0: begin Yn = Yn - (Xn << (6-counter)); Zn = Zn + val; end
        1: begin Yn = Yn + (Xn << (6-counter)); Zn = Zn - val; end
        endcase
        counter = counter + 1;
    end
//    else if (counter == 3'b110) nextstate = S2;
    else nextstate = S2;
    end
    S2: nextstate = S2;
    endcase
    end
    
    div_lut lut(val, counter);
endmodule