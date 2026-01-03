`include "parameter.v"

module brightness (
    input  [`PIXEL_WIDTH - 1 : 0] grey_i,
    output reg [`PIXEL_WIDTH - 1 : 0] grey_o
);

	wire signed [`PIXEL_WIDTH + 1 : 0] temp;
	assign temp = $signed({1'b0, grey_i}) + $signed(`BRIGHTNESS);
	always @(*) begin
		if (temp < 0) grey_o = 8'd0;
		else if (temp > 8'd255) grey_o = 8'd255;
		else grey_o = temp[`PIXEL_WIDTH - 1 : 0];
	end

endmodule
