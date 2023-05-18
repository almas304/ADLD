 module car_parking(clk,reset,sen_entry,sen_exit)
input [1:0] password;
 parameter idle=3'b000, wait_pass=3'b001, incorrect_pass=3'b010, correct_pass=3'b011, stop=3'b100;
 reg[2:0] cst, nst;
 reg[31:0] counter_wait;
 always @(posedge clk or negedge reset)
 begin
 if(~reset) 
 cst = idle;
 else
 cst= nst;
 end
 always @(posedge clk or negedge reset) 
 begin
 if(~reset) 
 counter_wait <= 0;
 else if(cst==wait_password)
 counter_wait <= counter_wait + 1;
 else 
 counter_wait <= 0;
 end

 always @(*)
 begin
 case(cst)
 idle: begin
         if(sen_entry== 1)
 nst = wait_password;
 else
 nst = idle;
 end
 wait_password: begin
 if(counter_wait <= 3)
 next_state = wait_password;
 else 
 begin
 if(password==3'b010)
 nst = correct_pass;
 else
 nst = incorrect_pass;
 end
 end
incorrect_pass:begin
if(password==3'b010)
nst=correct_pass;
else
nst=incorrect_pass;
end
 correct_pass: begin
 if(sen_entry==1 && sen_exit == 1)
 nst = stop;
 else if(sen_exit == 1)
 nst = idle;
 else
 nst = correct_pass;
 end
 stop: begin



 if(password==3'b010)
 nst = correct_pass;
 else
 nst = stop;
 end
 default: nst = idle;
 endcase
 end
 
end module
