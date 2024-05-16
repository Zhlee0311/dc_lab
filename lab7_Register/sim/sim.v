`timescale 1ns / 1ps

module sim;
  reg  [8:1] D;
  wire [8:1] Q;
  reg clk, OE_, clr;
  REG uut (
      D,
      OE_,
      clk,
      clr,
      Q
  );
  initial begin
    clk = 0;
    clr = 0;
    OE_ = 1;
    D   = 8'b00000000;
    #10 OE_ = 0;
    repeat (128) begin
      #17 D = D + 2'b1;
    end
  end
  always #150 clr = ~clr;
  always #50 clk = ~clk;
endmodule
