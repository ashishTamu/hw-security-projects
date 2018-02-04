/* 
 * Feistel Rounding implementation 
 * for DES encryption algorithm
 * 
 */

module RoundOperation(wOutputData,wInputData,wKey);
   
   input wire [47:0] wKey;
   input wire [63:0] wInputData;
   output reg [63:0] wOutputData;
   wire [31:0] 	      wFeistelOut;
   
	FeistelNetwork fn(wFeistelOut, wInputData[31:0],wKey);
always @*
begin
	 wOutputData[63:32] <= wInputData[31:0];
	 wOutputData[31:0] <= wFeistelOut^wInputData[63:32];
  end
   
endmodule // RoundOperation

