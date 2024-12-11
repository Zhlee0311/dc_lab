`timescale 1ns / 1ps

module display (
    input clk,  //clock
    input [1:0] sw,  //switch
    output reg [2:0] which,  //which led
    output reg [7:0] seg  //which number
);
  reg [32:1] data;
  reg [14:0] count;
  reg [ 3:0] digit;

  initial begin
    count <= 0;
    which <= 0;
  end

  always @(sw) begin
    case (sw)
      2'b00: data <= 32'hz;
      2'b01: data <= 32'h7654_3210;
      2'b11: data <= 32'h0123_4567;
      2'b10: data <= 32'hfedc_ba98;
    endcase
  end
  always @(posedge clk) count <= count + 1'b1;
  always @(negedge clk) begin
    if (&count) begin
      which <= which + 1'b1;
    end
  end

  always @(*) begin
    case (which)
      3'b000: digit <= data[32:29];
      3'b001: digit <= data[28:25];
      3'b010: digit <= data[24:21];
      3'b011: digit <= data[20:17];
      3'b100: digit <= data[16:13];
      3'b101: digit <= data[12:9];
      3'b110: digit <= data[8:5];
      3'b111: digit <= data[4:1];
    endcase
  end

  always @(*) begin
    case (digit)
      4'h0: seg <= 8'b0000_0011;
      4'h1: seg <= 8'b1001_1111;
      4'h2: seg <= 8'b0010_0101;
      4'h3: seg <= 8'b0000_1101;
      4'h4: seg <= 8'b1001_1001;
      4'h5: seg <= 8'b0100_1001;
      4'h6: seg <= 8'b0100_0001;
      4'h7: seg <= 8'b0001_1111;
      4'h8: seg <= 8'b0000_0001;
      4'h9: seg <= 8'b0000_1001;
      4'hA: seg <= 8'b0001_0001;
      4'hB: seg <= 8'b1100_0001;
      4'hC: seg <= 8'b0110_0011;
      4'hD: seg <= 8'b1000_0101;
      4'hE: seg <= 8'b0110_0001;
      4'hF: seg <= 8'b0111_0001;
    endcase
  end

endmodule
