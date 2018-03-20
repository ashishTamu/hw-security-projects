

module InitialPermutation(rOutputData,wInputData);


   //input is 64 bit
   input wire [1:64] wInputData ;

   //output is 64 bit
   output reg  [1:64] rOutputData ;
always @*
begin
rOutputData[1] <= wInputData[58];
rOutputData[2] <= wInputData[50];
rOutputData[3] <= wInputData[42];
rOutputData[4] <= wInputData[34];
rOutputData[5] <= wInputData[26];
rOutputData[6] <= wInputData[18];
rOutputData[7] <= wInputData[10];
rOutputData[8] <= wInputData[2];
rOutputData[9] <= wInputData[60];

rOutputData[10] <= wInputData[52];
rOutputData[11] <= wInputData[44];
rOutputData[12] <= wInputData[36];
rOutputData[13] <= wInputData[28];
rOutputData[14] <= wInputData[20];
rOutputData[15] <= wInputData[12];
rOutputData[16] <= wInputData[4];
rOutputData[17] <= wInputData[62];
rOutputData[18] <= wInputData[54];
rOutputData[19] <= wInputData[46];
rOutputData[20] <= wInputData[38];
rOutputData[21] <= wInputData[30];
rOutputData[22] <= wInputData[22];
rOutputData[23] <= wInputData[14];
rOutputData[24] <= wInputData[6];
rOutputData[25] <= wInputData[64];
rOutputData[26] <= wInputData[56];
rOutputData[27] <= wInputData[48];
rOutputData[28] <= wInputData[40];
rOutputData[29] <= wInputData[32];
rOutputData[30] <= wInputData[24];
rOutputData[31] <= wInputData[16];
rOutputData[32] <= wInputData[8];
rOutputData[33] <= wInputData[57];
rOutputData[34] <= wInputData[49];

rOutputData[35] <= wInputData[41];
rOutputData[36] <= wInputData[33];
rOutputData[37] <= wInputData[25];
rOutputData[38] <= wInputData[17];
rOutputData[39] <= wInputData[9];
rOutputData[40] <= wInputData[1];
rOutputData[41] <= wInputData[59];
rOutputData[42] <= wInputData[51];
rOutputData[43] <= wInputData[43];
rOutputData[44] <= wInputData[35];
rOutputData[45] <= wInputData[27];
rOutputData[46] <= wInputData[19];
rOutputData[47] <= wInputData[11];
rOutputData[48] <= wInputData[3];
rOutputData[49] <= wInputData[61];
rOutputData[50] <= wInputData[53];
rOutputData[51] <= wInputData[45];
rOutputData[52] <= wInputData[37];
rOutputData[53] <= wInputData[29];
rOutputData[54] <= wInputData[21];
rOutputData[55] <= wInputData[13];
rOutputData[56] <= wInputData[5];
rOutputData[57] <= wInputData[63];
rOutputData[58] <= wInputData[55];
rOutputData[59] <= wInputData[47];

rOutputData[60] <= wInputData[39];
rOutputData[61] <= wInputData[31];
rOutputData[62] <= wInputData[23];
rOutputData[63] <= wInputData[15];
rOutputData[64] <= wInputData[7];
end
endmodule // InitialPermutation
