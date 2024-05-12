`timescale 1ns / 1ps

module DISPLAY(clk,data,which,seg);
input clk;
input [32:1]data;
output reg[3:0]which;
output reg[7:0]seg;

reg[14:0]count;
reg[3:0]digit;
reg [2:0]sel;

initial begin
    count<=0;
    which<=0;
    sel<=0;
end

always@(posedge clk)count<=count+1'b1;
always@(negedge clk)if(&count)sel<=sel+1'b1;

always@(*)
begin
  case(sel)
  3'b000:digit<=data[32:29];
  3'b001:digit<=data[28:25];
  3'b010:digit<=data[24:21];
  3'b011:digit<=data[20:17];
  3'b100:digit<=data[16:13];
  3'b101:digit<=data[12:9];
  3'b110:digit<=data[8:5];
  3'b111:digit<=data[4:1];
  endcase

  case(sel)
  3'b000:which<=4'b1000;
  3'b001:which<=4'b1001;
  3'b010:which<=4'b1010;
  3'b011:which<=4'b1011;
  3'b100:which<=4'b1100;
  3'b101:which<=4'b1101;
  3'b110:which<=4'b1110;
  3'b111:which<=4'b1111;
  endcase

  case(digit)
   4'h0:seg<=8'b0000_0011;
   4'h1:seg<=8'b1001_1111;
   4'h2:seg<=8'b0010_0101;
   4'h3:seg<=8'b0000_1101;
   4'h4:seg<=8'b1001_1001;
   4'h5:seg<=8'b0100_1001;
   4'h6:seg<=8'b0100_0001;
   4'h7:seg<=8'b0001_1111;
   4'h8:seg<=8'b0000_0001;
   4'h9:seg<=8'b0000_1001;
   4'hA:seg<=8'b0001_0001;
   4'hB:seg<=8'b1100_0001;
   4'hC:seg<=8'b0110_0011;
   4'hD:seg<=8'b1000_0101;
   4'hE:seg<=8'b0110_0001;
   4'hF:seg<=8'b0111_0001;
  endcase
end

endmodule