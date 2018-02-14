module DFF
#(parameter width = 32)
(
input clk,rst,
input signed[width-1:0] d,
output reg signed [width-1:0] q 
);
    
always@ (posedge clk, posedge rst)
    if(rst)
        q<=0;
    else
        q<=d;
endmodule
