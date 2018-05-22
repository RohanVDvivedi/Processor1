module Imem(input[31:0] Address,output reg[31:0] Instruction);

  reg[31:0] memory[0:(((32'b1)<<10)-1)];

always @ ( * )
begin
	Instruction = memory[Address>>2];
end
  
// The test machine code that I am using
initial
begin
  memory[0] <= 32'b11111100000000000000000000000011;
  memory[1] <= 32'b11111100001000000000000000000101;
  memory[2] <= 32'b11111100010000000000000000000110;
  memory[3] <= 32'b00000000011000000000100000100100;
  memory[4] <= 32'b00000000100000000000100000100101;
  memory[5] <= 32'b00000000101000010001000000100000;
  memory[6] <= 32'b00000000101001010000000001000000;
  memory[7] <= 32'b00000000101001010000000000100000;
end

endmodule

