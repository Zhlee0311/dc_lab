`timescale 1ns / 1ps

module Decoder (
    A,
    E1,
    E2_low,
    E3_low,
    Y_low
);
  input [2:0] A;
  input E1;
  input E2_low;
  input E3_low;
  output [7:0] Y_low;
  reg [7:0] Y_low;
  always @(A or E1 or E2_low or E3_low) begin
    if (E1 && ~E2_low && ~E3_low)
      case (A)
        3'b000:  Y_low = 8'b11111110;
        3'b001:  Y_low = 8'b11111101;
        3'b010:  Y_low = 8'b11111011;
        3'b011:  Y_low = 8'b11110111;
        3'b100:  Y_low = 8'b11101111;
        3'b101:  Y_low = 8'b11011111;
        3'b110:  Y_low = 8'b10111111;
        3'b111:  Y_low = 8'b01111111;
        default: Y_low = 8'b11111111;
      endcase
    else Y_low = 8'b11111111;
  end
endmodule


