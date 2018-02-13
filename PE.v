//process element
module pe(clk, reset, coeff, in_x, in_y, out_x, out_y);
parameter size = 8;
input clk, reset;
input [size-1:0] in_x, coeff;
input [size+size-1:0] in_y;
output [size-1:0] out_x;
output [size+size-1:0] out_y;
reg [size+size-1:0] out_y;
reg [size-1:0] out_x;

always@(posedge clk)
 begin
   if(reset) begin
     out_x = 0;
     out_y = 0;
     end 
   else begin
     out_y = in_y + (in_x * coeff);
     out_x = in_x;
     end
 end
endmodule
