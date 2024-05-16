`timescale 1ns / 1ps

module sim;
  reg [3:0] A, B, C, D, E, F, G, H;
  reg  [2:0] S;
  wire [3:0] Y;
  mux8 uut (
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
  initial begin
    A = 4'b0001;
    B = 4'b0010;
    C = 4'b0011;
    D = 4'b0100;
    E = 4'b0101;
    F = 4'b0110;
    G = 4'b0111;
    H = 4'b1000;
    S = 3'b000;
  end
  initial begin
    #50 while (S != 3'b111) #50 S = S + 3'b001;
  end
endmodule
