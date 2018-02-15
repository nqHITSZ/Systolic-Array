module control
(
    input clk,rst,
    input start,
    output reg op_11,op_12,op_13,op_14,op_22,op_23,op_24
);

//id_mn = m+n
localparam id_11 = 2,
           id_12 = 3,
           id_13 = 4,
           id_14 = 5,
           id_22 = 4,
           id_23 = 5,
           id_24 = 6;
           

reg [3:0] state;

always @(posedge clk, posedge rst)
    if(rst) begin
			state <= 0;
			op_11 <= 0;
			op_12 <= 0;
			op_13 <= 0;
			op_14 <= 0;
			op_22 <= 0;
			op_23 <= 0;
			op_24 <= 0;
	 end
    else begin
        op_11 <= ( id_11-1 <= state) ? 0 : 1;
        op_12 <= ( id_12-1 <= state) ? 0 : 1;
        op_13 <= ( id_13-1 <= state) ? 0 : 1;
        op_14 <= ( id_14-1 <= state) ? 0 : 1;
        op_22 <= ( id_22-1 <= state) ? 0 : 1;
        op_23 <= ( id_23-1 <= state) ? 0 : 1;
        op_24 <= ( id_24-1 <= state) ? 0 : 1;
        case(state)
            0: begin
                if(start==1)
                    state<=1;
            end
            default: begin
                state<=state+1;
            end

        endcase
    end

endmodule
