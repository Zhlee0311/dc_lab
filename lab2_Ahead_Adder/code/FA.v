`timescale 1ns / 1ps

module FA (
    input  A,
    B,
    Cin,
    output P,
    G,
    Sum
);
  wire S1, T1, T2, T3;
  xor XU1 (S1, A, B), XU2 (Sum, S1, Cin);
  or OU (P, A, B);
  and AU (G, A, B);
endmodule
