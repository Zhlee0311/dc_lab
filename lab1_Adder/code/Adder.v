`timescale 1ns / 1ps

module Adder (
    X,
    Y,
    Cin,
    Sum,
    Cout
);
  input [3:0] X, Y;
  output [3:0] Sum;
  input Cin;
  output Cout;
  wire [3:1] C;
  FA
      FA0 (
          X[0],
          Y[0],
          Cin,
          Sum[0],
          C[1]
      ),
      FA1 (
          X[1],
          Y[1],
          C[1],
          Sum[1],
          C[2]
      ),
      FA2 (
          X[2],
          Y[2],
          C[2],
          Sum[2],
          C[3]
      ),
      FA3 (
          X[3],
          Y[3],
          C[3],
          Sum[3],
          Cout
      );
endmodule
