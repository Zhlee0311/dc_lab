`timescale 1ns / 1ps

module top (
    input clk,
    input [1:0] sw,
    output reg enable = 1,
    output [2:0] which,
    output [7:0] seg
);

  display uut (
      clk,
      sw,
      which,
      seg
  );
endmodule
