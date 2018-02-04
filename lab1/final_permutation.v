/* 
 * Inverse permutation look up table implementation 
 * for DES encryption algorithm
 * output is based on lookup table
 */

module FinalPermutation (rOutputData,wInputData);
   //input is 64 bit
   input wire [64:1] wInputData ;
   //output is 64 bit
   output wire  [64:1] rOutputData ;
   
   //Look up table
assign rOutputData[1] = wInputData[40];
assign rOutputData[2] = wInputData[8];
assign rOutputData[3] = wInputData[48];
assign rOutputData[4] = wInputData[16];
assign rOutputData[5] = wInputData[56];
assign rOutputData[6] = wInputData[24];
assign rOutputData[7] = wInputData[64];
assign rOutputData[8] = wInputData[32];
assign rOutputData[9] = wInputData[39];
assign rOutputData[10] = wInputData[7];
assign rOutputData[11] = wInputData[47];
assign rOutputData[12] = wInputData[15];
assign rOutputData[13] = wInputData[55];
assign rOutputData[14] = wInputData[23];
assign rOutputData[15] = wInputData[63];
assign rOutputData[16] = wInputData[31];
assign rOutputData[17] = wInputData[38];
assign rOutputData[18] = wInputData[6];
assign rOutputData[19] = wInputData[46];
assign rOutputData[20] = wInputData[14];
assign rOutputData[21] = wInputData[54];
assign rOutputData[22] = wInputData[22];
assign rOutputData[23] = wInputData[62];
assign rOutputData[24] = wInputData[30];
assign rOutputData[25] = wInputData[37];
assign rOutputData[26] = wInputData[5];
assign rOutputData[27] = wInputData[45];
assign rOutputData[28] = wInputData[13];
assign rOutputData[29] = wInputData[53];
assign rOutputData[30] = wInputData[21];
assign rOutputData[31] = wInputData[61];
assign rOutputData[32] = wInputData[29];
assign rOutputData[33] = wInputData[36];
assign rOutputData[34] = wInputData[4];
assign rOutputData[35] = wInputData[44];
assign rOutputData[36] = wInputData[12];
assign rOutputData[37] = wInputData[52];
assign rOutputData[38] = wInputData[20];
assign rOutputData[39] = wInputData[60];
assign rOutputData[40] = wInputData[28];
assign rOutputData[41] = wInputData[35];
assign rOutputData[42] = wInputData[3];
assign rOutputData[43] = wInputData[43];
assign rOutputData[44] = wInputData[11];
assign rOutputData[45] = wInputData[51];
assign rOutputData[46] = wInputData[19];
assign rOutputData[47] = wInputData[59];
assign rOutputData[48] = wInputData[27];
assign rOutputData[49] = wInputData[34];
assign rOutputData[50] = wInputData[2];
assign rOutputData[51] = wInputData[42];
assign rOutputData[52] = wInputData[10];
assign rOutputData[53] = wInputData[50];
assign rOutputData[54] = wInputData[18];
assign rOutputData[55] = wInputData[58];
assign rOutputData[56] = wInputData[26];
assign rOutputData[57] = wInputData[33];
assign rOutputData[58] = wInputData[1];
assign rOutputData[59] = wInputData[41];
assign rOutputData[60] = wInputData[9];
assign rOutputData[61] = wInputData[49];
assign rOutputData[62] = wInputData[17];
assign rOutputData[63] = wInputData[57];
assign rOutputData[64] = wInputData[25];
	
endmodule // FinalPermutation

