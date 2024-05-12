`timescale 1ns / 1ps

module ALU(OP,A,B,F,ZF,CF,OF,SF);

input [3:0]OP;
input [31:0]A,B;
output reg[31:0]F;
output ZF,CF,OF,SF;
 
integer i;
reg C;

assign ZF=(F==32'h0000_0000)?1:0;
assign CF=C;
assign OF=A[31]^B[31]^C^F[31];
assign SF=F[31];


always@(*)
begin
    case(OP)
        4'b0000:
            {C,F}={1'b0,A}+{1'b0,B};
        4'b0001:
            F=A<<B;
        4'b0010:
            F=$signed(A) < $signed(B) ? 1 : 0;
        4'b0011:
            F=A<B?1:0;
        4'b0100:
            F=A^B;
        4'b0101:
            F=A>>B;
        4'b0110:
            F=A|B;
        4'b0111:
            F=A&B;
        4'b1000:
            {C,F}={1'b0,A}-{1'b0,B};
        4'b1101:begin
            F=A;
            for(i=0;i<B&&i<32;i=i+1'b1)begin
                F={F[31],F[31:1]};
            end
        end
        default:F=0;
    endcase
end

endmodule