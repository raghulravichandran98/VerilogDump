module datapath;
wire [15:0] out;
wire done; 
reg [15:0] in;
reg clk,ld;

wire [15:0] a,b,inter;


fora a1(a,in,inter,ld,clk);
forb a2(b,in,clk);
multiplerr a3(out,done,inter,a,b,clk);

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
#5 ld=1;
#30 ld=0;
end 


endmodule
