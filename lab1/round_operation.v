/* 
 * Feistel Rounding implementation 
 * for DES encryption algorithm
 * 
 */

module RoundOperation(wOutputData,wInputData,wKey);
   
   input wire [1:48] wKey;
   input wire [1:64] wInputData;
   output reg [1:64] wOutputData;
   wire [1:32] 	      wFeistelOut;
   
	FeistelNetwork fn(wFeistelOut, wInputData[33:64],wKey);
always @*
begin
	 wOutputData[1:32] <= wInputData[33:64];
	 wOutputData[33:64] <= wFeistelOut^wInputData[1:32];
  end
   
endmodule // RoundOperation

