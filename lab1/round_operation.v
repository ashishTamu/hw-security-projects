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
   
	FeistelNetwork fn(wFeistelOut, wInputData[1:32],wKey);
always @*
begin
	 wOutputData[33:64] <= wInputData[1:32];
	 wOutputData[1:32] <= wFeistelOut^wInputData[63:32];
  end
   
endmodule // RoundOperation

