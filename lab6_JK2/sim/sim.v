`timescale 1ns / 1ps

module sim;
  reg C1, J1, K1, S1, R1, C2, J2, K2, S2, R2;
  wire Q1, Q1_, Q2, Q2_;
  JK2 uut (
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
  initial begin
    C1 <= 0;
    J1 <= 1;
    K1 <= 0;
    S1 <= 1;
    R1 <= 1;
    C2 <= 0;
    J2 <= 0;
    K2 <= 1;
    S2 <= 1;
    R2 <= 1;
    #10 R1 = 0;
    #10 R1 = 1;
  end
  always begin
    #100{J1, K1} <= 2'b11;
    {J2, K2} <= 2'b10;
    #100{J1, K1} <= 2'b00;
    {J2, K2} <= 2'b11;
    #100{J1, K1} <= 2'b01;
    {J2, K2} <= 2'b00;
  end
  always begin
    #17 C1 <= ~C1;
    C2 <= ~C2;

  end
endmodule
