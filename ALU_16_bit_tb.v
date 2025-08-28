`timescale 1us/1ns
module ALU_16_bit_tb();

reg [15:0] A_tb;
reg [15:0] B_tb;
reg [3:0] ALU_FUN_tb;
reg clk_tb;
wire [15:0] ALU_OUT_tb;
wire Carry_Flag_tb;
wire Arith_Flag_tb;
wire Logic_Flag_tb;
wire CMP_Flag_tb;
wire Shift_Flag_tb;

initial
 begin
  $dumpfile("ALU_16_bit_tb.vcd");
  $dumpvars;                                   //to save waveforms
  A_tb = 16'b1000;
  B_tb = 16'b100;
  ALU_FUN_tb = 4'b0000;
  clk_tb = 1'b0;
 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  $display ("test 1");                 //testing addition
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0000;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b1100 && Carry_Flag_tb == 1'b0 && Arith_Flag_tb == 1'b1 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 1 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 1 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 2");                 //testing subtraction
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0001;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b100 && Carry_Flag_tb == 1'b0 && Arith_Flag_tb == 1'b1 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 2 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 2 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 3");                 //testing multiplication
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0010;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b100000 && Arith_Flag_tb == 1'b1 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 3 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 3 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end   
 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
  $display ("test 4");                 //testing division
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0011;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b10 && Arith_Flag_tb == 1'b1 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 4 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 4 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end    
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
  $display ("test 5");                 //testing division by zero
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0011;
  A_tb = 16'b1000;
  B_tb = 16'b0;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b0 && Arith_Flag_tb == 1'b1 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 5 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 5 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end    
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
  $display ("test 6");                 //testing bitwise ANDing
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0100;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b0 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b1 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 6 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 6 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end    

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 7");                 //testing bitwise ORing
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0101;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b1100 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b1 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 7 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 7 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end   

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 8");                 //testing bitwise NANDing
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0110;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b1111111111111111 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b1 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 8 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 8 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end  

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 9");                 //testing bitwise NORing
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b0111;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b1111111111110011 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b1 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 9 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 9 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end  

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 10");                 //testing bitwise XORing
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1000;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b1100 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b1 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 10 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 10 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end   
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
  $display ("test 11");                 //testing bitwise XNORing
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1001;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b1111111111110011 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b1 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 11 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 11 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);  
   end
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 12");                 //testing equality
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1010;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b0 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b1 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 12 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 12 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end
   
///////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
   
  $display ("test 13");                 //testing equality
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1010;
  A_tb = 16'b1000;
  B_tb = 16'b1000;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b1 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b1 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 13 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 13 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 14");                 //testing A greater that B
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1011;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b10 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b1 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 14 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 14 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 15");                 //testing A greater that B
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1011;
  A_tb = 16'b100;
  B_tb = 16'b1000;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b0 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b1 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 15 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 15 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 16");                 //testing A smaller that B
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1100;
  A_tb = 16'b100;
  B_tb = 16'b1000;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b11 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b1 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 16 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 16 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 17");                 //testing A smaller that B
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1100;
  A_tb = 16'b1000;
  B_tb = 16'b100;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b0 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b1 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 17 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 17 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
  $display ("test 18");                 //testing shifting A right by 1
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1101;
  A_tb = 16'b1000;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b100 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b1)
   begin
    $display ("test 18 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 18 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 19");                 //testing shifting A left by 1
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1110;
  A_tb = 16'b1000;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b10000 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b1)
   begin
    $display ("test 19 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 19 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  $display ("test 20");                 //testing unused case
  @(negedge clk_tb);
  ALU_FUN_tb = 4'b1111;
  @(negedge clk_tb);
  if (ALU_OUT_tb == 16'b0 && Arith_Flag_tb == 1'b0 && Logic_Flag_tb == 1'b0 && CMP_Flag_tb == 1'b0 && Shift_Flag_tb == 1'b0)
   begin
    $display ("test 20 passed with value = %0b at simulation time %0t", ALU_OUT_tb, $time);
   end
  else
   begin
    $display ("test 20 failed with value = %0b at simulation time %0t", ALU_OUT_tb, $time); 	
   end
   
  $stop;
 end
 
always #5 clk_tb = ~ clk_tb;
 
 ALU_16_bit DUT (
.A(A_tb),
.B(B_tb),
.ALU_FUN(ALU_FUN_tb),            
.clk(clk_tb), 
.ALU_OUT(ALU_OUT_tb),   
.Carry_Flag(Carry_Flag_tb), 
.Arith_Flag(Arith_Flag_tb),
.Logic_Flag(Logic_Flag_tb),
.CMP_Flag(CMP_Flag_tb),
.Shift_Flag(Shift_Flag_tb)
);

endmodule