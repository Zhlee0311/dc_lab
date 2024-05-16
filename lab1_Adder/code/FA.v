`timescale 1ns / 1ps

module FA (
    input  A,
    input  B,
    input  Cin,
    output Sum,
    output Cout
);
  wire S1, T1, T2, T3;
  xor XU1 (S1, A, B), XU2 (Sum, S1, Cin);
  and AU1 (T1, A, B), AU2 (T2, A, Cin), AU3 (T3, B, Cin);
  or OU1 (Cout, T1, T2, T3);
endmodule
