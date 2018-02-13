module boundary_cell
(
    input clk,rst,
    input [31:0]x,
    output [31:0]c,
	 	output s
);
wire [31:0]p_next,w_3,w_4,w_5;
wire [31:0]x_abs,p_abs;
wire [31:0]p;
wire [31:0]c_next;
wire s_next;

DFF u_p_reg
(
.clk(clk),.rst(rst),
.d(p_next),
.q(p) 
);

//DFF u_x_reg
//(
//.clk(clk),.rst(rst),
//.d(x),
//.q(x_buf) 
//);

DFF u_s_reg
(
.clk(clk),.rst(rst),
.d(s_next),
.q(s) 
);

DFF u_c_reg
(
.clk(clk),.rst(rst),
.d(c_next),
.q(c) 
);

ABS u_x_abs(
  .a(x), // input [31 : 0] a
  .result(x_abs) // output [31 : 0] result
);

ABS u_p_abs(
  .a(p), // input [31 : 0] a
  .result(p_abs) // output [31 : 0] result
);

COMP u_comp (
  .a(x_abs), // input [31 : 0] a
  .b(p_abs), // input [31 : 0] b
  .result(s_next) // output [0 : 0] result
);

MUX u_mux (
  .i_1(p),
  .i_2(x),
  .s(s_next),
  .out(p_next)
);

MUXD u_muxd (
  .i_1(x),
  .i_2(p),
  .s(s_next),
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
  .result(c_next) // output [31 : 0] result
);



endmodule
