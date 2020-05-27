# VerilogDump
Dumping up my practice verilog miniprojects

#datapath testbench...

module datapath;
wire [15:0] out;
reg [15:0] in;
reg clk,ld;


fora a1(a,in,inter,ld,clk);
forb a2(b,in,clk);
multiplerr a3(out,inter,a,b,clk);

initial 
begin
clk=0;
forever
begin
#15 clk=~clk;
end
end

initial
begin
#2 in=16'h0008;
#50 ld=1;
#10 ld=0;
end


endmodule

#fora....
module fora(a,in,inter,ld,clk);
output reg [15:0] a;
input [15:0] in,inter;
input clk,ld;

always@(posedge clk)
begin
if(ld==1)
begin
a<=in;
end

else
begin
a<=inter;
end

end


endmodule

#forb...

module forb(b,in,clk);
output reg [15:0] b;
input clk;
input [15:0] in;
reg [15:0] temp;

always@(in)
begin
temp=in;
end

always@(posedge clk)

begin
#25;
if(temp!=0)
begin
b <= temp -1;
temp<= temp-1;
end 
else
b<=16'b0;
end


endmodule

#muliplerr...

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
