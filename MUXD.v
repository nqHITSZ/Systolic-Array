//select the input datas for shared unit
module MUXD
(
    input [31:0]i_1,i_2,
    input s,
    output [31:0]o_1,o_2
);
assign o_1 = s ? i_2 : i_1;
assign o_2 = s ? i_1 : i_2;
endmodule

