module systolic
(
	input clk,rst,
	input [31:0] x01, x02,
	output wire [31:0] c12, c22,
	output wire s12, s22
);

wire [31:0] c11;
wire [31:0] x12;
wire s11;

boundary_cell pe_11 (
    .clk(clk), 
    .rst(rst), 
    .x(x01), 
    .c(c11), 
    .s(s11)
    );
    
    
internal_cell pe_12 (
    .clk(clk), 
    .rst(rst), 
    .x_in(x02), 
    .c_in(c11),
    .s_in(s11), 
    .c_out(c12), 
    .s_out(s12),
    .x_out(x12)
    );
 
boundary_cell pe_22 (
    .clk(clk), 
    .rst(rst), 
    .x(x12), 
    .c(c22), 
    .s(s22)
    );
    
endmodule          
	