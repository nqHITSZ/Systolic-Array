module boundary_cell
(
    input clk,rst,
    input [31:0]x,
    output [31:0]c,
	 output s
);
wire [31:0]w_1,w_3,w_4,w_5;
wire [31:0]x_abs,p_abs;
wire [31:0]x_buf;
wire [31:0]p;

DFF u_p_reg
(
.clk(clk),.rst(rst),
.d(w_1),
.q(p) 
);

DFF u_x_reg
(
.clk(clk),.rst(rst),
.d(x),
.q(x_buf) 
);

ABS u_x_abs(
  .a(x_buf), // input [31 : 0] a
  .result(x_abs) // output [31 : 0] result
);

ABS u_p_abs(
  .a(p), // input [31 : 0] a
  .result(p_abs) // output [31 : 0] result
);

COMP u_comp (
  .a(x_abs), // input [31 : 0] a
  .b(p_abs), // input [31 : 0] b
  .result(s) // output [0 : 0] result
);

MUX u_mux (
  .i_1(p),
  .i_2(x_buf),
  .s(s),
  .out(w_1)
);

MUXD u_muxd (
  .i_1(x_buf),
  .i_2(p),
  .s(s),
  .o_1(w_3),
  .o_2(w_4)
);

DIV u_DIV (
  .a(w_3), // input [31 : 0] a
  .b(w_4), // input [31 : 0] b
  .result(w_5) // output [31 : 0] result
);

OPPOSITE u_OPPOSITE (
  .a(w_5), // input [31 : 0] a
  .result(c) // output [31 : 0] result
);



endmodule
