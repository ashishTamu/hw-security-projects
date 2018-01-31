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
	for (i=0;i<6;i++)
	  begin
	     assign rOutputData[i] = wInputData[(31+i)%32];
	     assign rOutputData[i+6] = wInputData[3+i];	
	     assign rOutputData[i+12] = wInputData[7+i];
	     assign rOutputData[i+18] = wInputData[11+i];
	     assign rOutputData[i+24] = wInputData[15+i];
	     assign rOutputData[i+30] = wInputData[19+i];
	     assign rOutputData[i+36] = wInputData[23+i];
	     assign rOutputData[i+42] = wInputData[(27+i)%32];	
	  end // for (i=0;i<6;i++)
     end // always @ *
endmodule // ExpansionBox

