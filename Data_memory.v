`timescale 1ns / 1ps

module Data_memory(
    input Clk, // ʱ���ź�
    input [31:0] DmemAddr, // �ڴ��ַ
    output [31:0] DmemRdData, // ���ڴ��ж���������
    input DmemWrite,
    input [31:0] DmemWrData
    );
// memory space: 256*32bits
reg[31:0] DataMem[0:255]; 
initial
begin
	$readmemh("Data", DataMem, 10'h0);
end

always @(posedge Clk) 
begin
	if(DmemWrite == 1'b1)
		DataMem[DmemAddr>>2] <= DmemWrData;
end


assign DmemRdData = (DmemWrite == 1'b0)? DataMem[DmemAddr>>2]:0;
endmodule
