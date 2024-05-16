`timescale 1ns / 1ps

module sim ();
  reg clk = 0;
  reg [1:0] sw;
  wire [2:0] which;
  wire [7:0] seg;
  display UUT (
      clk,
      sw,
      which,
      seg
  );
  always #0.01 clk = ~clk;
  initial begin
    sw = 2'b00;
    #50000;
    sw = 2'b01;
    #50000;
    sw = 2'b11;
    #50000;
    sw = 2'b10;
    #50000;
  end
endmodule
