`timescale 1ns/1ps

module tb_top();
  reg clk;
  reg rst_n;
  reg load;
  reg [3:0] load_data;
  reg enable;
  wire [3:0] count;
  wire counter_is_max;
  
  counter_4bit #(.P_COUNT_MAX(4'd10)) counter_inst (clk, rst_n, load, load_data, enable, count, counter_is_max);
  
  initial begin
    clk = 0;
    load = 0;
    load_data = 4'd0;
    enable = 1;
    
    //Do reset and then count from 0
    rst_n = 1;
    #25;
    rst_n = 0;
    #15;
    rst_n = 1;
    
    #200;
    //load 4 to count
    load = 1;
    load_data = 4'd4;
    
    #50;
    //Count from 4
    load = 0;
    
    #100;
    //pause counting
    enable = 0;
    
    #100;
    //enable counting
    enable = 1;
    
    #200;
    
    $finish();
  end
  
  always #5 clk = ~clk;  //clk frequency is 1Ghz
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
endmodule
  