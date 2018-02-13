//select the input datas for shared unit
module MUX
(
    input [31:0]i_1,i_2,
    input s,
    output [31:0]out
);
assign out = s ? i_2 : i_1;
endmodule

