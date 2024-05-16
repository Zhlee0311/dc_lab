`timescale 1ns / 1ps

module sim;
  reg [3:0] A, B, C, D;
  reg [1:0] S;
  reg EN_;
  wire [3:0] Y;
  mux4 uut (
      A,
      B,
      C,
      D,
      S,
      EN_,
      Y
  );
  initial begin
    A   = 4'b0001;
    B   = 4'b0010;
    C   = 4'b0011;
    D   = 4'b0100;
    S   = 2'b00;
    EN_ = 1;
    #20 EN_ = 0;
  end
  always begin
    #50 S = 2'b01;
    #50 S = 2'b10;
    #50;
    S = 2'b11;
    #50 S = 2'b00;
  end
endmodule
