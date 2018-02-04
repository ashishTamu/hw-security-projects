module KeyExpansionPermChoice1(wOutputData, wInputData);

   //input is 32 bit
   input wire [64:1] wInputData ;
   //output is 32 bit
   output wire [56:1] wOutputData ;
   
   
assign wOutputData[1] = wInputData[57];
assign wOutputData[2] = wInputData[49];
assign wOutputData[3] = wInputData[41];
assign wOutputData[4] = wInputData[33];
assign wOutputData[5] = wInputData[25];
assign wOutputData[6] = wInputData[17];
assign wOutputData[7] = wInputData[9];
assign wOutputData[8] = wInputData[1];

assign wOutputData[9] = wInputData[58];
assign wOutputData[10] = wInputData[50];
assign wOutputData[11] = wInputData[42];
assign wOutputData[12] = wInputData[34];
assign wOutputData[13] = wInputData[26];
assign wOutputData[14] = wInputData[18];
assign wOutputData[15] = wInputData[10];
assign wOutputData[16] = wInputData[2];
assign wOutputData[17] = wInputData[59];
assign wOutputData[18] = wInputData[51];
assign wOutputData[19] = wInputData[43];
assign wOutputData[20] = wInputData[35];
assign wOutputData[21] = wInputData[27];
assign wOutputData[22] = wInputData[19];
assign wOutputData[23] = wInputData[11];
assign wOutputData[24] = wInputData[3];
 
 assign wOutputData[25] = wInputData[60];
assign wOutputData[26] = wInputData[52];
assign wOutputData[27] = wInputData[44];
assign wOutputData[28] = wInputData[36];
assign wOutputData[29] = wInputData[63];
assign wOutputData[30] = wInputData[55];
assign wOutputData[31] = wInputData[47];
assign wOutputData[32] = wInputData[39];
assign wOutputData[33] = wInputData[31];
assign wOutputData[34] = wInputData[23];
assign wOutputData[35] = wInputData[15];
assign wOutputData[36] = wInputData[7];
assign wOutputData[37] = wInputData[62];
assign wOutputData[38] = wInputData[54];
assign wOutputData[39] = wInputData[46];
assign wOutputData[40] = wInputData[38];
 
 assign wOutputData[41] = wInputData[30];
assign wOutputData[42] = wInputData[22];
assign wOutputData[43] = wInputData[14];
assign wOutputData[44] = wInputData[6];
assign wOutputData[45] = wInputData[61];
assign wOutputData[46] = wInputData[53];
assign wOutputData[47] = wInputData[45];
assign wOutputData[48] = wInputData[37];
assign wOutputData[49] = wInputData[29];
assign wOutputData[50] = wInputData[21];
assign wOutputData[51] = wInputData[13];
assign wOutputData[52] = wInputData[5];
assign wOutputData[53] = wInputData[28];
assign wOutputData[54] = wInputData[20];
assign wOutputData[55] = wInputData[12];
assign wOutputData[56] = wInputData[4];

 
endmodule // KeyExpansionPermChoice1
