module flip_flop(
  input clk, rst,
  input a, b, c,
  output Y, W
);
  
  always @(posedge clk or negedge rst) begin
    if(rst) begin
      Y = 0;
      W = 0;
    end
    else begin
      Y = a & b;
      W = ~c;
    end
  end
endmodule