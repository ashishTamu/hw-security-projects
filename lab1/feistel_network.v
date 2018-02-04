/* 
 * Feistel Function implementation 
 * for DES encryption algorithm
 * 
 */

module FeistelNetwork(wOutputData,wInputData,wKey);
   
   input wire [47:0] wKey;
   input wire [31:0] wInputData;
   output reg [31:0] wOutputData;

   wire [47:0] 	     wExpansionOut;
   wire [47:0] 	     wSBoxInput;
   wire [31:0] 	     wSBoxOutput;
   
   always @*
   begin
   // First layer: expansion box
   ExpansionBox e_box(wExpansionOut,wInputData);

   // Second Layer: XOR
   //XOR(wSBoxInput,wExpansionOut,wKey);
   wSBoxInput <= wExpansionOut^wKey;
   
   // Third Layer: S box
   SBox s_box(wSBoxOutput,wSBoxInput);

   // 4th Layer: Straight P Box
   StraightPBox straight_p_box(wOutputData,wSBoxOutput);
   end

endmodule // FeistelNetwork


