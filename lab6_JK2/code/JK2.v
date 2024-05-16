`timescale 1ns / 1ps

module JK2 (
    C1,
    J1,
    K1,
    S1,
    R1,
    Q1,
    Q1_,
    C2,
    J2,
    K2,
    S2,
    R2,
    Q2,
    Q2_
);
  input C1, J1, K1, S1, R1, C2, J2, K2, S2, R2;
  output Q1, Q1_, Q2, Q2_;
  JK uut1 (
      C1,
      J1,
      K1,
      S1,
      R1,
      Q1,
      Q1_
  );
  JK uut2 (
      C2,
      J2,
      K2,
      S2,
      R2,
      Q2,
      Q2_
  );
endmodule
