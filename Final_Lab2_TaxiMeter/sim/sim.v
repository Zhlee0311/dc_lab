`timescale 1ns / 1ps

module sim;
  reg reset;
  reg start;
  reg pause;
  reg waitt;
  reg clk_50ns;
  reg [1:0] speedup;
  wire [3:0] AN;
  wire [7:0] Seg;

  Top uut (
      reset,
      start,
      pause,
      waitt,
      clk_50ns,
      speedup,
      AN,
      Seg
  );

  always #10 clk_50ns = ~clk_50ns;

  initial begin
    clk_50ns = 0;
    reset = 0;
    start = 1;
    pause = 0;
    waitt = 0;
    speedup = 2'b00;

    #10 pause = 1;

    #10 pause = 0;

    #10 speedup = 2'b01;

    #10 speedup = 2'b10;

    #10 speedup = 2'b11;


  end
endmodule
