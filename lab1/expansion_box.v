/* 
 * Feistal Function Initial Permutation
 * for DES encryption algorithm 
 */

module ExpansionBox(rOutputData,wInputData);
   //input is 32 bit
   input wire [32:1] wInputData ;
   //output is 48 bit
   output reg [48:1] rOutputData ;


   //Look up table
   always @*

	  begin
rOutputData[1] <= wInputData[32];
rOutputData[2] <= wInputData[1];
rOutputData[3] <= wInputData[2];
rOutputData[4] <= wInputData[3];
rOutputData[5] <= wInputData[4];
rOutputData[6] <= wInputData[5];
rOutputData[7] <= wInputData[4];
rOutputData[8] <= wInputData[5];
rOutputData[9] <= wInputData[6];
rOutputData[10] <= wInputData[7];
rOutputData[11] <= wInputData[8];
rOutputData[12] <= wInputData[9];
rOutputData[13] <= wInputData[8];
rOutputData[14] <= wInputData[9];
rOutputData[15] <= wInputData[10];
rOutputData[16] <= wInputData[11];
rOutputData[17] <= wInputData[12];
rOutputData[18] <= wInputData[13];
rOutputData[19] <= wInputData[12];
rOutputData[20] <= wInputData[13];
rOutputData[21] <= wInputData[14];
rOutputData[22] <= wInputData[15];
 
rOutputData[23] <= wInputData[16];
rOutputData[24] <= wInputData[17];
rOutputData[25] <= wInputData[16];
rOutputData[26] <= wInputData[17];
rOutputData[27] <= wInputData[18];
rOutputData[28] <= wInputData[19];
rOutputData[29] <= wInputData[20];
rOutputData[30] <= wInputData[21];
rOutputData[31] <= wInputData[20];
rOutputData[32] <= wInputData[21];
rOutputData[33] <= wInputData[22];
rOutputData[34] <= wInputData[23];
rOutputData[35] <= wInputData[24];
rOutputData[36] <= wInputData[25];
rOutputData[37] <= wInputData[24];
rOutputData[38] <= wInputData[25];
rOutputData[39] <= wInputData[26];
rOutputData[40] <= wInputData[27];
rOutputData[41] <= wInputData[28];
rOutputData[42] <= wInputData[29];
rOutputData[43] <= wInputData[28];
rOutputData[44] <= wInputData[29];
rOutputData[45] <= wInputData[30];
rOutputData[46] <= wInputData[31];
rOutputData[47] <= wInputData[32];
 
rOutputData[48] <= wInputData[1];	

     end // always @ *
endmodule // ExpansionBox

