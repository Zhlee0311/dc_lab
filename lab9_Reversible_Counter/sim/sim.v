`timescale 1ns / 1ps

module sim;
  reg ct_, ld_, mode, cp;
  reg  [3:0] D;
  wire [3:0] Q;
  wire Mm, RCO_;
  cnt uut (
      ct_,
      ld_,
      mode,
      cp,
      D,
      Q,
      Mm,
      RCO_
  );
  initial begin
    cp <= 0;
    ld_ <= 0;
    ct_ <= 1;
    mode <= 0;
    D <= 4'b0000;
    #10 ld_ <= 1;
    ct_ <= 0;
    #10 mode = 0;
  end
  initial begin
    #5000 mode = 1;
  end
  always #50 cp <= ~cp;
endmodule
