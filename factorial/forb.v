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
