module systolic_2
(
	input clk,rst,
	input start,
	input [31:0] x01, x02,
	output wire [31:0] c12, c22,
	output wire s12, s22
);

wire [31:0] c11;
wire [31:0] x12;
wire s11;
wire op_11, op_12, op_22;

boundary_cell_2 pe_11 (
    .clk(clk), 
    .rst(rst),
	 .operation(op_11),
    .x(x01), 
    .c(c11), 
    .s(s11)
    );
    
    
internal_cell_2 pe_12 (
    .clk(clk), 
    .rst(rst),
	 .operation(op_12),	 
    .x_in(x02), 
    .c_in(c11),
    .s_in(s11), 
    .c_out(c12), 
    .s_out(s12),
    .x_out(x12)
    );
 
boundary_cell_2 pe_22 (
    .clk(clk), 
    .rst(rst),
	 .operation(op_22),
    .x(x12), 
    .c(c22), 
    .s(s22)
    );
  
control u_ctrl (
    .clk(clk), 
    .rst(rst), 
    .start(start), 
    .op_11(op_11), 
    .op_12(op_12), 
    .op_22(op_22)
    );
endmodule          
	