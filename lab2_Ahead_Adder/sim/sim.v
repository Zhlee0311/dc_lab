`timescale 1ns / 1ps

module sim;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;
  CLA uut (
      A,
      B,
      Cin,
      Sum,
      Cout
  );
  initial begin
    A   = 4'b0;
    B   = 4'b0;
    Cin = 1'b0;
    forever begin
      #10{A, B, Cin} = {A, B, Cin} + 1;
      if ({A, B, Cin} == 9'b0) $finish;
    end
  end
endmodule
