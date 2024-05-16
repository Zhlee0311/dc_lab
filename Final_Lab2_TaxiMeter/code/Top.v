`timescale 1ns / 1ps

module Top(reset,start,pause,waitt,clk_50ns,speedup,AN,Seg);
  input reset;
  input start;
  input pause;
  input waitt;
  input clk_50ns;
  input [1:0]speedup;
  output [3:0]AN;
  output [7:0]Seg;
  
  wire clk_1s;
  wire addition;
  wire [2:0]Bit_Sel;
  wire [15:0]fare;
  wire [15:0]fare_bcd;
  wire [15:0]distance;
  wire [15:0]distance_bcd;
  
  
  Fdiv u1(reset,clk_50ns,clk_1s);
  Dis  u2(reset,start,pause,waitt,clk_1s,speedup,distance);
  Traffic u3(reset,pause,waitt,clk_1s,addition);
  Fare u4(reset,start,pause,waitt,clk_1s,addition,distance,fare);
  Delay u5(clk_50ns,Bit_Sel);
  BcdCode u6(distance,distance_bcd);
  BcdCode u7(fare,fare_bcd);
  SLed  u8(distance_bcd,fare_bcd,Bit_Sel,AN,Seg);
endmodule
