module regfile(	input[4:0] Rdst,input[4:0] Rsrc1,input[4:0] Rsrc2,
		input[31:0] wdata,output reg [31:0] Rdata1,output reg [31:0] Rdata2,
		input writereg,input clk,
		output reg[31:0] registers[0:31] );

always @ (posedge clk)
begin
  registers[Rdst] <= ( writereg ? wdata : registers[Rdst] );
end

always @ ( * )
begin
	Rdata1 = registers[Rsrc1];
	Rdata2 = registers[Rsrc2];
end
  

// I am Initializing all registers to 0 on startup
  integer i=0;
  initial
  begin
    repeat(32)
      begin
        registers[i] <= 0;
        i=i+1;
      end
  end

endmodule

