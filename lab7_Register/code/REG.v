`timescale 1ns / 1ps

module REG (
    input [8:1] D,
    input OE_,
    input clk,
    input clr,
    output [8:1] Q
);
  reg [8:1] TQ = 8'b0;
  assign Q = OE_ ? 8'bzzzzzzzz : TQ;
  always @(posedge clk or posedge clr) begin
    if (clr) TQ <= 8'b0;
    else TQ <= D;
  end
endmodule
