`include "parameter.v"

module rgb_to_greyscale_top (
	input  [`PIXEL_WIDTH-1:0] r_i,
	input  [`PIXEL_WIDTH-1:0] g_i,
	input  [`PIXEL_WIDTH-1:0] b_i,
	output [`PIXEL_WIDTH-1:0] grey_o
);

	wire [`PIXEL_WIDTH-1 : 0] temp;

	rgb_to_greyscale u_gray (
		.r_i(r_i),
		.g_i(g_i),
		.b_i(b_i),
		.grey_o(temp)
	);

	brightness u_bright (
		.grey_i(temp),
		.grey_o(grey_o)
	);

endmodule
