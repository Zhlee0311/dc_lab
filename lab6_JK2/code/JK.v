`timescale 1ns / 1ps

module JK (
    input clk,
    input J,
    input K,
    input set,
    input reset,
    output reg q,
    output q_
);
  always @(negedge clk, negedge set, negedge reset) begin
    if (~set && ~reset) q <= 1'bz;
    else if (~set) q <= 1'b1;
    else if (~reset) q <= 1'b0;
    else
      case ({
        J, K
      })
        2'b00:   q <= q;
        2'b01:   q <= 1'b0;
        2'b10:   q <= 1'b1;
        2'b11:   q <= ~q;
        default: q <= 1'bx;
      endcase
  end
  assign q_ = ~q;
endmodule
