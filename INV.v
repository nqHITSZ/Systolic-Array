//opposite number of a floating number
module OPPOSITE
(
    input [31:0]a,
    output [31:0]result
);
assign result = {~a[31],a[30:0]};
endmodule
