module counter_4bit (
  input clk, 
  input rst_n,
  input load,
  input [3:0] load_data,
  input enable,
  output reg [3:0] count,
  output counter_is_max
);
  parameter P_COUNT_MAX = 4'd15;
  always @(posedge clk or negedge rst_n)
    if (~rst_n)
      count <= 4'd0;
  else if (load)  //load has higher priority than enable
      count <= load_data;
  else if (enable & (count < P_COUNT_MAX))
      count <= count + 4'd1;
  else if (enable & (count >= P_COUNT_MAX))
      count <= 4'd0;
  else
      count <= count;
  
  //When counter reaches the configured max value, counter_is_max becomes High
  assign counter_is_max = (count == P_COUNT_MAX);
  
endmodule
  