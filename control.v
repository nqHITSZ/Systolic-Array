module control
(
    input clk,rst,
    input start,
    output reg op_11, op_12, op_22
);

//id_mn = m+n
localparam id_11 = 2,
           id_12 = 3,
           id_22 = 4;

reg [3:0] state;

always @(posedge clk, posedge rst)
    if(rst) begin
        state <= 0;
		  op_11 <= 0;
        op_12 <= 0;
        op_22 <= 0;
	 end
    else begin
        op_11 <= ( id_11-1 <= state) ? 0 : 1;
        op_12 <= ( id_12-1 <= state) ? 0 : 1;
        op_22 <= ( id_22-1 <= state) ? 0 : 1;
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
