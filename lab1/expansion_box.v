/* 
 * Feistal Function Initial Permutation
 * for DES encryption algorithm 
 */

module ExpansionBox(rOutputData,wInputData);
   //input is 32 bit
   input wire [31:0] wInputData ;
   //output is 48 bit
   output reg [47:0] rOutputData ;


   //Look up table
   integer 	      i=0;

   always @*
     begin
	for (i=0;i<6;i=i+1)
	  begin
	     rOutputData[i] <= wInputData[(31+i)%32];
	     rOutputData[i+6] <= wInputData[3+i];	
	     rOutputData[i+12] <= wInputData[7+i];
	     rOutputData[i+18] <= wInputData[11+i];
	     rOutputData[i+24] <= wInputData[15+i];
	     rOutputData[i+30] <= wInputData[19+i];
	     rOutputData[i+36] <= wInputData[23+i];
	     rOutputData[i+42] <= wInputData[(27+i)%32];	
	  end // for (i=0;i<6;i++)
     end // always @ *
endmodule // ExpansionBox

