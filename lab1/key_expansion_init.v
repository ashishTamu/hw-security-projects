module KeyExpansionPermChoice1(wOutputData, InputData);

   //input is 32 bit
   input wire [56:1] InputData ;
   //output is 32 bit
   output wire [56:1] wOutputData ;
   
   wire [64:1] wInputData ;
   
   assign wInputData[8:1]   = {InputData[7:1],InputData[7]^InputData[6]^InputData[5]^InputData[4]^InputData[3]^InputData[2]^InputData[1]^1b'1};
   assign wInputData[16:9]  = {InputData[14:8],InputData[14]^InputData[13]^InputData[12]^InputData[11]^InputData[10]^InputData[9]^InputData[8]^1b'1};
   assign wInputData[24:17] = {InputData[21:15],InputData[21]^InputData[20]^InputData[19]^InputData[18]^InputData[17]^InputData[16]^InputData[15]^1b'1};
   assign wInputData[32:25] = {InputData[28:22],InputData[28]^InputData[27]^InputData[26]^InputData[25]^InputData[24]^InputData[23]^InputData[22]^1b'1};
   assign wInputData[40:33] = {InputData[35:29],InputData[35]^InputData[34]^InputData[33]^InputData[32]^InputData[31]^InputData[30]^InputData[29]^1b'1};
   assign wInputData[48:41] = {InputData[42:36],InputData[42]^InputData[41]^InputData[40]^InputData[39]^InputData[38]^InputData[37]^InputData[36]^1b'1};
   assign wInputData[56:49] = {InputData[49:43],InputData[49]^InputData[48]^InputData[47]^InputData[46]^InputData[45]^InputData[44]^InputData[43]^1b'1};
   assign wInputData[64:57] = {InputData[56:50],InputData[56]^InputData[55]^InputData[54]^InputData[53]^InputData[52]^InputData[51]^InputData[50]^1b'1};
	
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
