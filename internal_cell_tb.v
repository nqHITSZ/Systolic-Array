`timescale 1ns/10ps
module internal_cell_tb;
localparam T=10;//100MHz
reg clk,rst;
reg [31:0] c_in,x_in;
reg s_in;
wire [31:0]c_out,x_out;
wire s_out;


internal_cell i_c (
    .clk(clk), 
    .rst(rst), 
    .c_in(c_in), 
    .x_in(x_in), 
    .s_in(s_in), 
    .c_out(c_out), 
    .x_out(x_out), 
    .s_out(s_out)
    );


//generate 50MHz clock
initial
	begin
		clk=0;
		forever clk=#(T/2)~clk;
	end
//rst for the first half cycle
initial
	begin
		rst=1;#(T*1.6)
		rst=0;
	end


initial
	begin
        s_in=1;
        c_in=32'H0;//0.0
        x_in=32'h0;//0.0
        #(10*T);
        c_in=32'H40900000;//4.5
        x_in=32'h40000000;//2.0
        #(1*T);
        s_in=0;
        c_in=32'hc0200000;//-2.5
        x_in=32'h41200000;//10.0
        #(1*T);
        c_in=32'h43004ccd;//128.3
        x_in=32'H41280000;//10.0
        #(50*T) $stop;
	end


endmodule



