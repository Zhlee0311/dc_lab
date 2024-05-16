`timescale 1ns / 1ps

module CLA (
    A,
    B,
    Cin,
    Sum,
    Cout
);
  input [3:0] A, B;
  input Cin;
  output [3:0] Sum;
  output Cout;
  wire [3:0] P, G;
  wire [4:1] C;
  FA
      FA0 (
          A[0],
          B[0],
          Cin,
          P[0],
          G[0],
          Sum[0]
      ),
      FA1 (
          A[1],
          B[1],
          C[1],
          P[1],
          G[1],
          Sum[1]
      ),
      FA2 (
          A[2],
          B[2],
          C[2],
          P[2],
          G[2],
          Sum[2]
      ),
      FA3 (
          A[3],
          B[3],
          C[3],
          P[3],
          G[3],
          Sum[3]
      );
  Ahead AH (
      P,
      G,
      Cin,
      C
  );
  assign Cout = C[4];
endmodule
