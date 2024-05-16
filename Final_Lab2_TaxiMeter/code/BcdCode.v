`timescale 1ns / 1ps

module BcdCode (
    input  wire [15:0] bin,
    output reg  [15:0] bcd
);
  initial begin
    bcd = 16'd0;
  end
  always @(*) begin
    bcd[3:0]   = bin % 10;
    bcd[7:4]   = bin / 10 % 10;
    bcd[11:8]  = bin / 100 % 10;
    bcd[15:12] = bin / 1000 % 10;
  end
endmodule
