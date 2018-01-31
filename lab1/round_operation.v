/* 
 * Feistel Rounding implementation 
 * for DES encryption algorithm
 * 
 */

module RoundOperation(wOutputData,wInputData,wKey);
   
   input wire [47:0] wKey;
   input wire [63:0] wInputData;
   output wire [63:0] wOutputData;
   wire [31:0] 	      wFeistelOut;
   

   assign wOutputData[63:32] = wInputData[31:0];
   FeistelNetwork fn(wFeistelOut, wInputData[31:0]);
   assign wOutputData[31:0] = wFeistelOut^wInputData[63:32];
   
endmodule // RoundOperation

