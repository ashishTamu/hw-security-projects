/* 
 * Feistal Function Initial Permutation
 * for DES encryption algorithm 
 */

module ExpansionBox(wOutputData,wInputData);
   //input is 32 bit
   input wire [31:0] wInputData ;
   //output is 48 bit
   output wire [47:0] wOutputData ;


   //Look up table
   integer 	      i=0;
 
   for (i=0;i<6;i++)
     begin
	assign wOutputData[i] = wInputData[(31+i)%32];
	assign wOutputData[i+6] = wInputData[3+i];	
	assign wOutputData[i+12] = wInputData[7+i];
	assign wOutputData[i+18] = wInputData[11+i];
	assign wOutputData[i+24] = wInputData[15+i];
	assign wOutputData[i+30] = wInputData[19+i];
	assign wOutputData[i+36] = wInputData[23+i];
	assign wOutputData[i+42] = wInputData[(27+i)%32];	
     end // for (i=0;i<6;i++)
   
endmodule // ExpansionBox

