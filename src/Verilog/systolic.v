module systolic
(
	input clk,rst,
	input start,
	input [31:0] x01, x02, x03, x04,
	output wire [31:0] c14, c24,
	output wire s14, s24,
	output wire [31:0] x23, x24
);

wire [31:0] c11,c12,c13,c22,c23;
wire s11,s12,s13;
wire [31:0] x12,x13,x14;

wire op_11,op_12,op_13,op_14,op_22,op_23,op_24;


//T Array 
control u_ctrl (
    .clk(clk), 
    .rst(rst), 
    .start(start), 
    .op_11(op_11), 
    .op_12(op_12), 
    .op_13(op_13),
    .op_14(op_14),
    .op_22(op_22),
    .op_23(op_23),
    .op_24(op_24)
    );

boundary_cell pe_11 (
    .clk(clk), 
    .rst(rst),
	 .operation(op_11),
    .x(x01), 
    .c(c11), 
    .s(s11)
    );
    
    
internal_cell pe_12 (
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
 
boundary_cell pe_22 (
    .clk(clk), 
    .rst(rst),
	  .operation(op_22),
    .x(x12), 
    .c(c22), 
    .s(s22)
    );

//S Array    
internal_cell pe_13 (
    .clk(clk), 
    .rst(rst),
	  .operation(op_13),	 
    .x_in(x03), 
    .c_in(c12),
    .s_in(s12), 
    .c_out(c13), 
    .s_out(s13),
    .x_out(x13)
    );

internal_cell pe_14 (
    .clk(clk), 
    .rst(rst),
	  .operation(op_14),	 
    .x_in(x04),
    .c_in(c13),
    .s_in(s13), 
    .c_out(c14), 
    .s_out(s14),
    .x_out(x14)
    );

internal_cell pe_23 (
    .clk(clk), 
    .rst(rst),
	  .operation(op_23),	 
    .x_in(x13), 
    .c_in(c22),
    .s_in(s22), 
    .c_out(c23), 
    .s_out(s23),
    .x_out(x23)
    );

internal_cell pe_24 (
    .clk(clk), 
    .rst(rst),
	  .operation(op_24),	 
    .x_in(x14), 
    .c_in(c23),
    .s_in(s23), 
    .c_out(c24), 
    .s_out(s24),
    .x_out(x24)
    );            
  

endmodule          
	
