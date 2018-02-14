`timescale 1ns/10ps
module systolic_tb_2;
localparam T=10;//100MHz
reg clk,rst;
reg start;
integer i;
reg [31:0] x01,x02;
reg [31:0] rom_x1 [10:0];
reg [31:0] rom_x2 [10:0];

systolic_2 u_systolic_2 (
    .clk(clk), 
    .rst(rst), 
    .start(start),
    .x01(x01), 
    .x02(x02), 
    .c12(), 
    .c22(), 
    .s12(), 
    .s22()
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
        $readmemh ("rom_x1.txt", rom_x1);
        $readmemh ("rom_x2.txt", rom_x2);
        x01 = 0;
        x02 = 0;
        start = 0;
        #(10*T);
        start = 1;
        start <= #(T) 0;
        for(i=0;i<6;i=i+1)
        begin
        	x01 = rom_x1[i];
            x02 = rom_x2[i];
            #(1*T);
        end

        #(30*T) $stop;
	end


endmodule



