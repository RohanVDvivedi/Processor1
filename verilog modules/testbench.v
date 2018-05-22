module testbench;
  reg clk;
  reg reset;
  
  wire[31:0] register[0:31];
  wire[31:0] myreg0;  assign myreg0 = register[0];
  wire[31:0] myreg1;  assign myreg1 = register[1];
  wire[31:0] myreg2;  assign myreg2 = register[2];
  wire[31:0] myreg3;  assign myreg3 = register[3];
  wire[31:0] myreg4;  assign myreg4 = register[4];
  wire[31:0] myreg5;  assign myreg5 = register[5];

  wire[31:0] programcounter;
  
  processor processorP (clk,reset,register,programcounter);

initial
begin
   // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
  reset=0;clk=0;
	#1;
  reset=1;clk=0;
	#1;
  reset = 0;
    #1;
  repeat(20) 
    begin
    	#1;
      	clk=~clk;
     	#1;
    end
  
	$finish;
end

endmodule
