`timescale 1ns / 1ps

module Dis (
    input wire reset,
    input wire start,
    input wire pause,
    input wire waitt,
    input wire clk_1s,
    input wire [1:0] speedup,
    output reg [15:0] distance
);
  reg start_ff;
  initial begin
    distance = 16'd0;
    start_ff = 1'b0;
  end
  always @(posedge reset or posedge clk_1s) begin
    if (reset) begin
      distance <= 16'd0;
      start_ff <= 1'b0;
    end else if ((start || start_ff) && !pause && !waitt) begin
      case (speedup)
        2'b00: distance <= distance + 16'd1;
        2'b01: distance <= distance + 16'd2;
        2'b10: distance <= distance + 16'd4;
        2'b11: distance <= distance + 16'd6;
      endcase
      if (start) start_ff <= start;
    end
  end
endmodule
