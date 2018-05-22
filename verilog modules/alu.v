module alu(input[31:0] operand1,input[31:0] operand2,input[4:0] shamt,input[2:0] select,output reg[31:0] result );

always @ ( * )
begin
	case (select)
	3'b000 :	result = operand1 + operand2;
	3'b001 :	result = operand1 - operand2;
	3'b010 :	result = operand1 & operand2;
	3'b011 :	result = operand1 | operand2;
	3'b100 :	result = operand1 << shamt;
	3'b101 :	result = operand1 >> shamt;
	default:	result = 32'bz;
	endcase	
end

endmodule

