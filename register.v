`timescale 1ns / 1ps

module register(
    input Clk,
    input [4:0] RegARdAddr,
    input [4:0] RegBRdAddr,
    input [4:0] RegWrAddr,  // A3
    input [31:0] RegWrData, // WD3
    input RegWrite,
    output [31:0] RegARdData,
    output [31:0] RegBRdData
    );
	// 32 * 32bit registers
	reg[31:0] regFile[0:31]; 
	initial
	begin	
		$readmemh("register", regFile, 32'h0);
	end
	// write on falling clock edge
	
	always @(posedge Clk)
	begin
		if(RegWrite == 1'b1)	
			regFile[RegWrAddr] <= RegWrData;	
	end
	
	assign RegARdData = (RegARdAddr != 0)? regFile[RegARdAddr]:0;
	assign RegBRdData = (RegBRdAddr != 0)? regFile[RegBRdAddr]:0;

endmodule
