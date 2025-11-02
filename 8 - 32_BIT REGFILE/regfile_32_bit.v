module register_file_32_bit(
  input clk, rst_n, rd_wr,
  input [31:0] w_data,
  input [4:0] addr_1, addr_2, w_addr,
  output reg [31:0] r_data1, r_data2
);
  reg [31:0] reg32_q [0:31];
  integer i;
  
  always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
      for (i=0; i<32; i++) begin
        reg32_q[i] = 32'd0;
      end
    end
    else if (rd_wr)
      reg32_q[w_addr] <= w_data;
  end
  
  always @(*) begin
    r_data1 = ~rd_wr ? reg32_q[addr_1] : 32'hz;
    r_data2 = ~rd_wr ? reg32_q[addr_2] : 32'hz;
  end
endmodule