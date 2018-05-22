module signextend(input[20:0] constantIn,output reg[31:0] constantOut);

always @ ( * )
begin
  constantOut = { {11{constantIn[20]}} , constantIn };
end

endmodule

