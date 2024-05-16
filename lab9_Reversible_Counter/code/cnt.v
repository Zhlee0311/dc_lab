`timescale 1ns / 1ps

module cnt (
    input ct_,
    input ld_,
    input mode,
    input cp,
    input [3:0] D,
    output reg [3:0] Q,
    output Mm,
    output RCO_
);
  always @(posedge cp or negedge ld_) begin
    if (!ld_) Q <= D;
    else if (ct_) Q <= Q;
    else if (mode) begin
      Q <= Q - 1'b1;
    end else begin
      Q <= Q + 1'b1;
    end
  end

  assign Mm   = mode ? mode & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0] : ~mode & Q[3] & Q[2] & Q[1] & Q[0];
  assign RCO_ = cp | ct_ | ~Mm;
endmodule
