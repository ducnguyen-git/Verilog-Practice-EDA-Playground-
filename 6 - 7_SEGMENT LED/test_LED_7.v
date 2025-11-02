module test_LED_7;
  reg [3:0] dec;
  wire [6:0] abcdefg;
  
  LED_7 dut(.dec(dec), .abcdefg(abcdefg));
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    dec = 4'd2;
    #5 dec = 4'd4;
    #5 dec = 4'd6;
    #5 dec = 4'd1;
    #5 dec = 4'd3;
    #5 dec = 4'd7;
    #5 dec = 4'd9;
    #5 dec = 4'd8;
    #5 dec = 4'd0;
    #5 dec = 4'd5;
  end
endmodule