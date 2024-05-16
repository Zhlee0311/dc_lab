`timescale 1ns / 1ps

module sim;
  reg [3:0] X, Y;
  wire [3:0] Sum;
  reg Cin;
  wire Cout;
  Adder uut (
      X,
      Y,
      Cin,
      Sum,
      Cout
  );
  initial begin
    X   = 4'b0001;
    Y   = 4'b0010;
    Cin = 0;
    #50 X = 4'b0010;
    Y   = 4'b0011;
    Cin = 1;
    #50 X = 4'b1111;
    Y   = 4'b0001;
    Cin = 0;
    #50 X = 4'b0011;
    Y   = 4'b1101;
    Cin = 1;
  end
endmodule
