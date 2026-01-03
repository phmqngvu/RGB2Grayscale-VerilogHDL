`include "parameter.v"

module rgb_to_greyscale(
	input [`PIXEL_WIDTH - 1 : 0] r_i,
	input [`PIXEL_WIDTH - 1 : 0] g_i,
	input [`PIXEL_WIDTH - 1 : 0] b_i,
	output [`PIXEL_WIDTH - 1 : 0] grey_o
);

	wire [20 : 0] temp;
	assign temp = (77 * r_i) + (150 * g_i) + (29 * b_i);
	assign grey_o = temp >> 8;

endmodule