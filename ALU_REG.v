`timescale 1ns / 1ps


module ALU_REG(ALU_OP,Data_A,Data_B,rst_n,clk_A,clk_B,clk_F,A,B,F,FR);

input [3:0]ALU_OP;
input [31:0]Data_A,Data_B;
input rst_n,clk_A,clk_B,clk_F;
output[31:0]A,B,F;
output[3:0]FR;

wire [31:0]F_temp;
wire ZF,CF,OF,SF;

REG R_A(clk_A,rst_n,Data_A,A);

REG R_B(clk_B,rst_n,Data_B,B);

ALU alu(ALU_OP,A,B,F_temp,ZF,CF,OF,SF);

REG R_F(clk_F,rst_n,F_temp,F);

REG R_FR(clk_F,rst_n,{28'b0,ZF,CF,OF,SF},FR);

endmodule