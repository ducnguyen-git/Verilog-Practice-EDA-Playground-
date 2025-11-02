module tb_flip_flop;
  reg clk, res;
  reg a, b, c;
  wire Y, W;
  
  flip_flop ff(.clk(clk), .rst(rst), .a(a), .b(b), .c(c), .Y(Y), .W(W));
  
  
  
  initial begin
    $dumpvars(1, tb_flip_flop);
    
    clk = 0;
    forever #5 clk = ~clk;
  end
    
    // Test case 1
    // ...
  end
endmodule