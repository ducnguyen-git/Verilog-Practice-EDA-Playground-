module tb_regfile_32;
  reg clk, rst_n, rd_wr;
  reg [31:0] w_data;
  reg [4:0] addr_1, addr_2, w_addr;
  wire [31:0] r_data1, r_data2;
  
  register_file_32_bit dut(.clk(clk), .rst_n(rst_n), .rd_wr(rd_wr), .w_data(w_data), .addr_1(addr_1), .addr_2(addr_2), .w_addr(w_addr), .r_data1(r_data1), .r_data2(r_data2));
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk=0;rst_n=0;
    #20 rst_n=1; rd_wr=1; w_data=32'd69; w_addr=5'd18;
    #20 w_data=32'd36; w_addr=5'd10;
    #50 rd_wr=0; addr_1=5'd10; addr_2=5'd18;
    #100 $stop;
  end
endmodule