module tb_car_parking;
  reg clk;
  reg reset;
  reg sen_entry;
  reg sen_exit;
  reg [1:0] password;
  car_parking uut (
  clk(clk), 
  reset(reset), 
  sen_entry (sen_entry), 
  sen_exit(sen_exit), 
  password(password), 
   
  
 );
 initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end
 initial begin
 reset = 0;
 sen_entry = 0;
 sen_exit = 0;
 password = 0;
 
 #100;
      reset = 1;
 #20;
 sen_entry = 1;
 #1000;
 sen_entry = 0;
 password = 1;

 #2000;
 sen_exit =1;
 
 end
      
endmodule
