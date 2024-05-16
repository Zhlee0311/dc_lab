`timescale 1ns / 1ps

module Delay (
    input wire clk_50ns,
    output reg [2:0] Bit_Sel
);
  integer cnt = 0;
  initial begin
    Bit_Sel <= 3'b000;
  end
  always @(posedge clk_50ns) begin
    cnt <= cnt + 1;
    if (cnt == 40000) begin
      Bit_Sel <= Bit_Sel + 3'b001;
      cnt <= 0;
    end
  end
endmodule
