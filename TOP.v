`timescale 1ns / 1ps


module TOP(rst_n,clk,clk_A,clk_B,clk_F,data,leds,which,seg);

input rst_n,clk,clk_A,clk_B,clk_F;//时序信号

input [31:0]data;

output [3:0]leds;

output [3:0]which;

output [7:0]seg;

wire [31:0]A,B,F;


ALU_REG u1(data[3:0],data,data,rst_n,clk_A,clk_B,clk_F,A,B,F,leds);

DISPLAY u2(clk,F,which,seg);


endmodule