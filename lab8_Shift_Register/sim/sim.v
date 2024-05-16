`timescale 1ns / 1ps

module sim;
  reg cr_, cp;
  reg [1:0] s;
  reg Sr, Sl;
  reg  [7:0] D;
  wire [7:0] Q;
  sreg uut (
      cr_,
      cp,
      s,
      Sr,
      Sl,
      D,
      Q
  );
  initial begin
    cp  <= 0;
    cr_ <= 1;
    s   <= 2'b11;
    Sr  <= 1;
    Sl  <= 1;
    D   <= 8'b00001111;
    #100 s <= 2'b01;
    #100 s <= 2'b10;
    #100 s <= 2'b00;
    #100 cr_ = 0;
    #100 cr_ = 1;
  end
  always #25 cp = ~cp;
endmodule
