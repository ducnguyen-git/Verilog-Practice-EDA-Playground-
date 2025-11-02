module test_conse_recog;
  reg clk, rst_n, in;
  wire out;
  
  conse_recog dut(.clk(clk), .rst_n(rst_n), .in(in), .out(out));
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk=0; rst_n=0; in=0;
    #20 rst_n=1;
    #60 in=1;
    #60 in=0;
    #20 in=1;
    #20 in=0;
    #100 $stop;
  end
endmodule