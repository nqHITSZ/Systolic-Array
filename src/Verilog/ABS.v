//absolute value of a floating number
module ABS
(
    input [31:0]a,
    output [31:0]result
);
assign result = {1'b0,a[30:0]};
endmodule
