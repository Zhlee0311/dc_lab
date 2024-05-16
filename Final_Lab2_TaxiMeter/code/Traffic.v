`timescale 1ns / 1ps

module Traffic (
    input  wire reset,
    input  wire pause,
    input  wire waitt,
    input  wire clk_1s,
    output reg  addition
);
  reg [3:0] count;
  initial begin
    count = 4'd0;
    addition = 1'b0;
  end
  always @(posedge reset or posedge clk_1s) begin
    if (reset) begin
      count <= 4'd0;
      addition <= 1'b0;
    end else if (count == 4'd10) begin
      count <= 4'd0;
      addition <= 1'b1;
    end else if (!pause && waitt) begin
      count <= count + 4'd1;
      addition <= 1'b0;
    end
  end
endmodule
