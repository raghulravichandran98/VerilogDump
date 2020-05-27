module  multiplerr(out,done,inter,a,b,clk);
output reg [15:0] out;
output reg [15:0] inter;
output reg done;
input wire [15:0] a;
input wire [15:0] b;
input clk;

always@(posedge clk) 
begin
#10 out=a*b;
#12 inter=a*b;
if(out==0)
begin
done=1;
end
end 

endmodule  
