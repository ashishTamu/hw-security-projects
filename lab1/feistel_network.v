/* 
 * Feistel Function implementation 
 * for DES encryption algorithm
 * 
 */

module FeistelNetwork(wOutputData,wInputData,wKey);
   
   input wire [1:48] wKey;
   input wire [1:32] wInputData;
   output wire [1:32] wOutputData;

   wire [1:48] 	     wExpansionOut;
   reg [1:48] 	     wSBoxInput;
   wire [1:32] 	     wSBoxOutput;
  
 // First layer: expansion box
   ExpansionBox e_box(wExpansionOut,wInputData);
    // Third Layer: S box
   SBox s_box(wSBoxOutput,wSBoxInput);

   // 4th Layer: Straight P Box
   StraightPBox straight_p_box(wOutputData,wSBoxOutput);
	
   always @*
   begin
  
   // Second Layer: XOR
   //XOR(wSBoxInput,wExpansionOut,wKey);
   wSBoxInput <= wExpansionOut^wKey;
   
 
   end

endmodule // FeistelNetwork


