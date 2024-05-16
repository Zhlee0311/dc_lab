`timescale 1ns / 1ps

module Fdiv (
    input  wire reset,
    input  wire clk_50ns,
    output reg  clk_1s
);
  reg [31:0] counter;
  initial begin
    counter = 32'd0;
    clk_1s  = 1'b0;
  end
  always @(posedge reset or posedge clk_50ns) begin
    if (reset) begin
      counter <= 32'd0;
      clk_1s  <= 1'b0;
    end else if (counter == 32'd10_000_000) begin
      counter <= 32'd0;
      clk_1s = ~clk_1s;
    end else counter <= counter + 1'b1;
  end
endmodule
