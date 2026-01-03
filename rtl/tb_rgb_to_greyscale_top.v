`timescale 1ns/1ps
`include "parameter.v"

module tb_rgb_to_greyscale_top;
   reg clk;
   reg [`PIXEL_WIDTH - 1 : 0] r_i, g_i, b_i;
   wire [`PIXEL_WIDTH - 1 : 0] grey_o;
	
   reg [`PIXEL_WIDTH - 1 : 0] mem [0 : (`TOTAL_PIXELS * 3 - 1)];
   reg [`PIXEL_WIDTH - 1 : 0] out_mem [0 : (`TOTAL_PIXELS - 1)];

   integer i;

   rgb_to_greyscale_top uut (
      .r_i(r_i),
      .g_i(g_i),
      .b_i(b_i),
      .grey_o(grey_o)
   );

   initial clk = 0;
   always #5 clk = ~clk;

   initial begin
      $readmemh("D:/02_UniversityOfInformationTechnology/00_CE213_DigitalSystemDesignWithHDL/LAB02B/input.hex", mem);
   end

   initial begin
      r_i = 0;
      g_i = 0;
      b_i = 0;
      i   = 0;
      #20;
   end

   always @(posedge clk) begin
      if (i < `TOTAL_PIXELS) begin
         r_i <= mem[i * 3];
         g_i <= mem[i * 3 + 1];
         b_i <= mem[i * 3 + 2];
         out_mem[i] <= grey_o;
         i <= i + 1;
      end
      else begin
         $writememh("D:/02_UniversityOfInformationTechnology/00_CE213_DigitalSystemDesignWithHDL/LAB02B/verilog.hex", out_mem);
         $finish;
      end
   end

endmodule
