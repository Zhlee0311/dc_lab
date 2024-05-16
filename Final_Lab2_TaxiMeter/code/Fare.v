`timescale 1ns / 1ps

module Fare (
    input wire reset,
    input wire start,
    input wire pause,
    input wire waitt,
    input wire clk_1s,
    input wire addition,
    input wire [15:0] distance,
    output reg [15:0] fare
);
  parameter s_fare = 16'd60;  //QiBuJia
  reg start_ff;
  initial begin
    fare = 16'd0;
    start_ff = 1'b0;
  end
  always @(posedge reset or posedge clk_1s) begin
    if (reset) begin
      fare <= 16'd0;
      start_ff <= 1'b0;
    end else if ((start || start_ff) && !waitt && !pause) begin
      if (distance <= 16'd30) begin
        fare <= s_fare;
      end else if (fare <= 16'd200) begin
        fare <= s_fare + (12 * (distance - 30)) / 10;
      end else begin
        fare <= 16'd204 + (18 * (distance - 150)) / 10;
      end
      if (start) start_ff <= start;
    end else if (addition && waitt && !pause) begin
      fare <= fare + 16'd5;
    end
  end
endmodule
