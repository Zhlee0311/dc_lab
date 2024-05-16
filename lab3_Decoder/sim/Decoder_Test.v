`timescale 1ns / 1ps

module Decoder_Test;
  reg [2:0] A;
  reg E1, E2_low, E3_low;
  wire [7:0] Y_low;
  Decoder simu (
      A,
      E1,
      E2_low,
      E3_low,
      Y_low
  );
  initial begin
    E1 = 0;
    E2_low = 0;
    E3_low = 0;
    A = 3'b000;
    #100 E1 = 1;
    E2_low = 0;
    E3_low = 0;
    forever begin
      #100 A = A + 3'b001;
      if (A == 3'b111) $finish;
    end
  end
endmodule
