module controlunit(input[5:0] opcode,input[5:0] functcode,
output reg[2:0] alusel,output reg writesel,output reg writereg);

always @ ( * )
begin
	case (opcode)
		6'b000000:
		begin
			writereg <= 1'b1;
			writesel <= 1'b0;
			case (functcode)
			6'b100000: alusel <= 3'b000;// add
			6'b100010: alusel <= 3'b001;// sub
			6'b100100: alusel <= 3'b010;// and
			6'b100101: alusel <= 3'b011;// or
			6'b000000: alusel <= 3'b100;// sll
			6'b000010: alusel <= 3'b101;// srl
			default:   alusel <= 3'bxxx;
            endcase
		end
		6'b111111:
		begin
			writereg <= 1'b1;
			writesel <= 1'b1;
			alusel   <= 3'bxxx;
		end
		default :
		begin
			writereg <= 1'b0;
			writesel <= 1'bx;
			alusel   <= 3'bxxx;
		end
	endcase
end

endmodule

