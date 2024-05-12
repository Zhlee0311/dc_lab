`timescale 1ns / 1ps

module REG(clk,rst_n,in,out);
input clk,rst_n;
input [31:0]in;
output reg[31:0]out;
always@(posedge rst_n or posedge clk)begin
    if(rst_n)
        out<=32'h0000_0000;
    else 
        out<=in;
end
endmodule
