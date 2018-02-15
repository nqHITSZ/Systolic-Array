module internal_cell
(
    input clk,rst,
    input operation,//when operation = 1, internal_cell work in neighboring pivoting mode, otherwise in non-pivoting mode
    input [31:0]c_in,x_in,
    input s_in,
    output [31:0]c_out,x_out,
    output s_out
);
wire [31:0] w_1, w_2, w_3;
wire s_w;
wire [31:0] p,p_next, x_next;

DFF u_p_reg
(
.clk(clk),.rst(rst),
.d(p_next),
.q(p) 
);

DFF u_c_reg
(
.clk(clk),.rst(rst),
.d(c_in),
.q(c_out) 
);

DFF #(.width(1)) u_s_reg
(
.clk(clk),.rst(rst),
.d(s_in),
.q(s_out) 
);

DFF u_x_reg
(
.clk(clk),.rst(rst),
.d(x_next),
.q(x_out) 
);

MUX #( .width(1) ) u_mux_0 (
  .i_1(1'b0),
  .i_2(s_in),
  .s(operation),
  .out(s_w)
);

MUX u_mux_1 (
  .i_1(p),
  .i_2(x_in),
  .s(s_w),
  .out(w_1)
);

MUX u_mux_2 (
  .i_1(x_in),
  .i_2(p),
  .s(s_w),
  .out(w_2)
);

MUX u_mux_3 (
  .i_1(p),
  .i_2(x_in),
  .s(s_w),
  .out(p_next)
);

MUL u_mul(
  .a(c_in), // input [31 : 0] a
  .b(w_1), // input [31 : 0] b
  .result(w_3) // output [31 : 0] result
);

ADD u_add(
  .a(w_3), // input [31 : 0] a
  .b(w_2), // input [31 : 0] b
  .result(x_next) // output [31 : 0] result
);

endmodule
