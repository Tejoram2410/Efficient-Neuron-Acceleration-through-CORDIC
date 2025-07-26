module mul_lut(input [2:0] address, output [7:0] val);
reg [7:0] lut [0:7];
initial
begin
lut[0] <= 8'd128;
lut[1] <= 8'd64;
lut[2] <= 8'd32;
lut[3] <= 8'd16;
lut[4] <= 8'd8;
lut[5] <= 8'd4;
lut[6] <= 8'd2;
lut[7] <= 8'd1;
end
assign val = lut[address];
endmodule