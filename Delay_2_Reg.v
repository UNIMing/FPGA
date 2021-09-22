
//对于跨时钟域处理，直接进行打2拍处理即可，一般适用于慢时钟域到快时钟域。
module Delay_2_Reg(
   clk_a,
   clk_b,
   rst_n,
   data_in,
   data_out);
   
   input               clk_a;
   input               clk_b;
   input               rst_n;
   input    [15:0]     data_in;
   output   [15:0]     data_out;
   
   reg      [15:0]     data_out_r1;      //第1拍
   reg      [15:0]     data_out_r2;      //第2拍
   always @ (posedge clk_b or negedge rst_n) begin
      if(!rst_n)
         begin
            data_out_r1 <= 16'd0;
            data_out_r1 <= 16'd0;
         end
      else
         begin
            data_out_r1 <= data_in;
            data_out_r2 <= data_out_r1;
         end
   end
   
   assign data_out = data_out_r2;

endmodule


