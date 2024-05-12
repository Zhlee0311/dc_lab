`timescale 1ns / 1ps
module sim;

reg [3:0]ALU_OP;
reg [31:0]Data_A,Data_B;
reg rst_n,clk_A,clk_B,clk_F;


wire [31:0]A,B,F;
wire [3:0]FR;


ALU_REG uut(
    .ALU_OP(ALU_OP),
    .Data_A(Data_A),
    .Data_B(Data_B),
    .rst_n(rst_n),
    .clk_A(clk_A),
    .clk_B(clk_B),
    .clk_F(clk_F),
    .A(A),
    .B(B),
    .F(F),
    .FR(FR)
);

always #5 clk_A=~clk_A;
always #10 clk_B=~clk_B;
always #1 clk_F=~clk_F;


initial begin
    ALU_OP=4'b0000;
    Data_A=32'h0000_0001;
    Data_A=32'h0000_0002;
    rst_n=1;
    clk_A=0;
    clk_B=0;
    clk_F=0;

    #20;
    //加法
    #5 Data_A = 32'h0000_0003;
    #5 Data_B = 32'h0000_0004;

    #5 ALU_OP = 4'b0000;
    #5 Data_A = 32'hFFFF_FFFF;
    #5 Data_B = 32'h0000_0001;

    #5 ALU_OP = 4'b0000;
    #5 Data_A = 32'h8000_0000;
    #5 Data_B = 32'h8000_0000;


    #5 Data_A = 32'h0000_0001;
    #5 Data_B = 5;
    #5 ALU_OP = 4'b0001;

    #5 Data_A = 32'h0000_0001;
    #5 Data_B = 32'hFFFF_FFFF;
    #5 ALU_OP = 4'b0010;

    #5 Data_A = 32'h0000_0001;
    #5 Data_B = 32'hFFFF_FFFF;
    #5 ALU_OP = 4'b0011;

    #5 Data_A = 32'hAAAA_AAAA;
    #5 Data_B = 32'h5555_5555;
    #5 ALU_OP = 4'b0100;

    #5 Data_A = 32'h8000_0000;
    #5 Data_B = 5;
    #5 ALU_OP = 4'b0101;

    #5 Data_A = 32'hAAAA_AAAA;
    #5 Data_B = 32'h5555_5555;
    #5 ALU_OP = 4'b0110;

    #5 Data_A = 32'hAAAA_AAAA;
    #5 Data_B = 32'h5555_5555;
    #5 ALU_OP = 4'b0111;

    #5 Data_A = 32'h0000_0003;
    #5 Data_B = 32'h0000_0001;
    #5 ALU_OP = 4'b1000;

    #5 Data_A = 32'h8000_0000;
    #5 Data_B = 5;
    #5 ALU_OP = 4'b1101;

    #1000
    $finish;
end


endmodule
