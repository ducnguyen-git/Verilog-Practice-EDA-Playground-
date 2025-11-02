module tb_flip_flop;
  reg clk, rst_n;
  reg penable, psel_reg, pwrite, pready;
  reg [7:0] pwd;
  wire [7:0] reg_A;
  
  flip_flop_8bit ff(.clk(clk), .rst_n(rst_n), .penable(penable), .psel_reg(psel_reg), .pwrite(pwrite), .pready(pready), .pwd(pwd), .reg_A(reg_A));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
    
  initial begin
    $dumpvars(1, tb_flip_flop);
    
    // Test case 1
    rst_n = 0; pwd = 8'd36; penable = 1'b0; psel_reg = 1'b0; pwrite = 1'b0; pready = 1'b0;
    #5 rst_n = 1'b1; penable = 1'b1; psel_reg = 1'b1; pwrite = 1'b1; pready = 1'b1;
    #10 penable = 1'b0;
    // Test case 2
    #20 pwd = 8'd49; penable = 1'b1; psel_reg = 1'b1; pwrite = 1'b1; pready = 1'b1;
   	#10 psel_reg = 1'b0;
    #10 psel_reg = 1'b1;
    // Test case 3
    #20 pwd = 8'd77; penable = 1'b1; psel_reg = 1'b1; pwrite = 1'b1; pready = 1'b1;
   	#10 pwrite = 1'b0;
    #10 pwrite = 1'b1;
    // Test case 4
    #20 pwd = 8'd193; penable = 1'b1; psel_reg = 1'b1; pwrite = 1'b1; pready = 1'b1;
   	#10 pready = 1'b0;
    #10 pready = 1'b1;
    #200 $stop;
  end
endmodule