//select the input datas for shared unit
module MUX
#(parameter width = 32)
(
    input [width-1:0]i_1,i_2,
    input s,
    output [width-1:0]out
);
assign out = s ? i_2 : i_1;
endmodule

