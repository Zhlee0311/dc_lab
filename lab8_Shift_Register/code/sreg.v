`timescale 1ns / 1ps

module sreg (
    input cr_,
    input cp,
    input [1:0] s,
    input Sr,
    Sl,
    input [7:0] D,
    output reg [7:0] Q
);
  always @(posedge cp or negedge cr_) begin
    if (!cr_) Q <= 8'b0;
    else begin
      case (s)
        2'b01:   Q <= {Sr, Q[7:1]};
        2'b10:   Q <= {Q[6:0], Sl};
        2'b11:   Q <= D;
        default: Q <= Q;
      endcase
    end
  end
endmodule
