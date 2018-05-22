module processor(input clk,input reset,
                
                // port to processor registers
                output wire[31:0] register[0:31],
                 
                // programcounter register
		output reg[31:0] programcounter
                 
                );


  


wire[31:0] Instruction;

// Instruction fields
wire[5:0] opcode;
wire[4:0] Rdst;
wire[4:0] Rsrc1;
wire[4:0] Rsrc2;
wire[4:0] shamt;
wire[5:0] functcode;

// SignExtend module connections
wire[20:0] constantIn;
wire[31:0] constantOut;

// ALU wire connections
wire[31:0] Operand1;
wire[31:0] Operand2;
wire[31:0] result;

wire[31:0] wdata;

// control signals from control unit
wire[2:0] alusel;
wire writereg;
wire writesel;

// Instruction fetch
Imem InstructionMemory (programcounter,Instruction);

// decode instruction in to fields
assign {opcode,Rdst,Rsrc1,Rsrc2,shamt,functcode} = Instruction;
assign constantIn = Instruction[20:0];

// signextend the constant value for li
signextend SignExtend (constantIn,constantOut);

// generate appropriate control signals for ALU and register file
controlunit ControlUnit (opcode,functcode,alusel,writesel,writereg);

// register file to store temporary data and retrieve operands
  regfile RegisterFile  (Rdst,Rsrc1,Rsrc2,wdata,Operand1,Operand2,writereg,clk,register);

// ALU for R type instructions namely, +,-,&,|,<<,>>
alu ALU (Operand1,Operand2,shamt,alusel,result);

// multiplexer to select what data to write back
assign wdata = (writesel ? constantOut : result );

  always @ ( posedge clk or negedge reset )
begin
  if( clk )
	begin
		programcounter <= programcounter + 32'b100;
	end
	else
	begin
		programcounter <= 32'b0;
	end
end

endmodule

