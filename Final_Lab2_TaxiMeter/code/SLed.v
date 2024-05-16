`timescale 1ns / 1ps

module SLed (
    input wire [15:0] distance_bcd,
    input wire [15:0] fare_bcd,
    input wire [2:0] Bit_Sel,
    output reg [3:0] AN,  //enable+which
    output reg [7:0] Seg  //num
);
  reg [3:0] digit;
  initial begin
    digit <= 4'd0;
  end
  always @(*) begin
    case (Bit_Sel)
      3'b000: AN <= 4'b1000;
      3'b001: AN <= 4'b1001;
      3'b010: AN <= 4'b1010;
      3'b011: AN <= 4'b1011;
      3'b100: AN <= 4'b1100;
      3'b101: AN <= 4'b1101;
      3'b110: AN <= 4'b1110;
      3'b111: AN <= 4'b1111;
    endcase
  end
  always @(*) begin
    case (Bit_Sel)
      3'b000: digit <= fare_bcd[15:12];
      3'b001: digit <= fare_bcd[11:8];
      3'b010: digit <= fare_bcd[7:4];
      3'b011: digit <= fare_bcd[3:0];
      3'b100: digit <= distance_bcd[15:12];
      3'b101: digit <= distance_bcd[11:8];
      3'b110: digit <= distance_bcd[7:4];
      3'b111: digit <= distance_bcd[3:0];
    endcase
  end
  always @(*) begin
    if (Bit_Sel == 3'b010 || Bit_Sel == 3'b110) begin
      case (digit)
        4'b0000: Seg <= 8'b0000_0010;
        4'b0001: Seg <= 8'b1001_1110;
        4'b0010: Seg <= 8'b0010_0100;
        4'b0011: Seg <= 8'b0000_1100;
        4'b0100: Seg <= 8'b1001_1000;
        4'b0101: Seg <= 8'b0100_1000;
        4'b0110: Seg <= 8'b0100_0000;
        4'b0111: Seg <= 8'b0001_1110;
        4'b1000: Seg <= 8'b0000_0000;
        4'b1001: Seg <= 8'b0000_1000;
      endcase
    end else begin
      case (digit)
        4'b0000: Seg <= 8'b0000_0011;
        4'b0001: Seg <= 8'b1001_1111;
        4'b0010: Seg <= 8'b0010_0101;
        4'b0011: Seg <= 8'b0000_1101;
        4'b0100: Seg <= 8'b1001_1001;
        4'b0101: Seg <= 8'b0100_1001;
        4'b0110: Seg <= 8'b0100_0001;
        4'b0111: Seg <= 8'b0001_1111;
        4'b1000: Seg <= 8'b0000_0001;
        4'b1001: Seg <= 8'b0000_1001;
      endcase
    end
  end
endmodule
