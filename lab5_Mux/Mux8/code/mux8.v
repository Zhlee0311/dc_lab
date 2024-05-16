`timescale 1ns / 1ps

module mux8 (
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    S,
    Y
);
  input [3:0] A, B, C, D, E, F, G, H;
  input [2:0] S;
  output [3:0] Y;
  wire [3:0] Y1, Y2;
  mux4 uut1 (
      A,
      B,
      C,
      D,
      S[1:0],
      S[2],
      Y1
  );
  mux4 uut2 (
      E,
      F,
      G,
      H,
      S[1:0],
      ~S[2],
      Y2
  );
  assign Y = {Y1 | Y2};
endmodule
