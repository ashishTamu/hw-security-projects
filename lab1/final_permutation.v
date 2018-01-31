/* 
 * Inverse permutation look up table implementation 
 * for DES encryption algorithm
 * output is based on lookup table
 */

`define BUSLEN 63
module FinalPermutation (wOutputData,wInputData);
   //input is 64 bit
   input wire [`BUSLEN:0] wInputData ;
   //output is 64 bit
   output wire  [`BUSLEN:0] wOutputData ;
   
   //Look up table
   integer 		   i=0;
 
   for (i=0;i <(`BUSLEN+1)/8;i++)
     begin
	assign wOutputData[(i*8)+7:(i*8)]=  {wInputData[40-i],wInputData[8-i],wInputData[48-i],wInputData[16-i],wInputData[56-i],wInputData[24-i],wInputData[64-i],wInputData[32-i]};
     end
   
endmodule // FinalPermutation

