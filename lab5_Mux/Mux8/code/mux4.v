`timescale 1ns / 1ps

module mux4 (
    A,
    B,
    C,
    D,
    S,
    EN_,
    Y
);
  input [3:0] A, B, C, D;
  input [1:0] S;
  input EN_;
  output reg [3:0] Y;
  always @(*) begin
    if (EN_) Y = 4'b0000;
    else
      case (S)
        2'b00: Y <= A;
        2'b01: Y <= B;
        2'b10: Y <= C;
        2'b11: Y <= D;
      endcase
  end
endmodule
