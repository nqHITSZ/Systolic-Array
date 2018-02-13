`timescale 1ns/10ps
module test2;
localparam T=10;//100MHz
reg clk,rst;
reg [31:0] x;
wire [31:0]c;
wire s;


boundary_cell instance_name (
    .clk(clk), 
    .rst(rst), 
    .x(x), 
    .c(c), 
    .s(s)
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
        x=32'h00000000;//0.0
        #(10*T);
        
        x=32'H40900000;//4.5
        #(1*T);
        x=32'hc0200000;//-2.5
        #(1*T);
        x=32'h40000000;//2.0
        #(1*T);
        x=32'h41200000;//10.0
        #(50*T) $stop;
	end


endmodule



