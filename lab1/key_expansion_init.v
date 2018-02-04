module KeyExpansionPermChoice1(wOutputData, InputData);

   //input is 32 bit
   input wire [56:1] InputData ;
   //output is 32 bit
   output reg [56:1] wOutputData ;
   
   wire [64:1] wInputData ;
   
 
    assign wInputData[8:1]   = {InputData[7]^InputData[6]^InputData[5]^InputData[4]^InputData[3]^InputData[2]^InputData[1]^1'b1,InputData[7:1]};
    assign wInputData[16:9]  = {InputData[14]^InputData[13]^InputData[12]^InputData[11]^InputData[10]^InputData[9]^InputData[8]^1'b1,InputData[14:8]};
    assign wInputData[24:17] = {InputData[21]^InputData[20]^InputData[19]^InputData[18]^InputData[17]^InputData[16]^InputData[15]^1'b1,InputData[21:15]};
    assign wInputData[32:25] = {InputData[28]^InputData[27]^InputData[26]^InputData[25]^InputData[24]^InputData[23]^InputData[22]^1'b1,InputData[28:22]};
    assign wInputData[40:33] = {InputData[35]^InputData[34]^InputData[33]^InputData[32]^InputData[31]^InputData[30]^InputData[29]^1'b1,InputData[35:29]};
    assign wInputData[48:41] = {InputData[42]^InputData[41]^InputData[40]^InputData[39]^InputData[38]^InputData[37]^InputData[36]^1'b1,InputData[42:36]};
    assign wInputData[56:49] = {InputData[49]^InputData[48]^InputData[47]^InputData[46]^InputData[45]^InputData[44]^InputData[43]^1'b1,InputData[49:43]};
    assign wInputData[64:57] = {InputData[56]^InputData[55]^InputData[54]^InputData[53]^InputData[52]^InputData[51]^InputData[50]^1'b1,InputData[56:50]};
	 
   always @*
   begin

 wOutputData[1] <= wInputData[57];
 wOutputData[2] <= wInputData[49];
 wOutputData[3] <= wInputData[41];
 wOutputData[4] <= wInputData[33];
 wOutputData[5] <= wInputData[25];
 wOutputData[6] <= wInputData[17];
 wOutputData[7] <= wInputData[9];
 wOutputData[8] <= wInputData[1];

 wOutputData[9] <= wInputData[58];
 wOutputData[10] <= wInputData[50];
 wOutputData[11] <= wInputData[42];
 wOutputData[12] <= wInputData[34];
 wOutputData[13] <= wInputData[26];
 wOutputData[14] <= wInputData[18];
 wOutputData[15] <= wInputData[10];
 wOutputData[16] <= wInputData[2];
 wOutputData[17] <= wInputData[59];
 wOutputData[18] <= wInputData[51];
 wOutputData[19] <= wInputData[43];
 wOutputData[20] <= wInputData[35];
 wOutputData[21] <= wInputData[27];
 wOutputData[22] <= wInputData[19];
 wOutputData[23] <= wInputData[11];
 wOutputData[24] <= wInputData[3];
 
 wOutputData[25] <= wInputData[60];
 wOutputData[26] <= wInputData[52];
 wOutputData[27] <= wInputData[44];
 wOutputData[28] <= wInputData[36];
 wOutputData[29] <= wInputData[63];
 wOutputData[30] <= wInputData[55];
 wOutputData[31] <= wInputData[47];
 wOutputData[32] <= wInputData[39];
 wOutputData[33] <= wInputData[31];
 wOutputData[34] <= wInputData[23];
 wOutputData[35] <= wInputData[15];
 wOutputData[36] <= wInputData[7];
 wOutputData[37] <= wInputData[62];
 wOutputData[38] <= wInputData[54];
 wOutputData[39] <= wInputData[46];
 wOutputData[40] <= wInputData[38];
 
 wOutputData[41] <= wInputData[30];
 wOutputData[42] <= wInputData[22];
 wOutputData[43] <= wInputData[14];
 wOutputData[44] <= wInputData[6];
 wOutputData[45] <= wInputData[61];
 wOutputData[46] <= wInputData[53];
 wOutputData[47] <= wInputData[45];
 wOutputData[48] <= wInputData[37];
 wOutputData[49] <= wInputData[29];
 wOutputData[50] <= wInputData[21];
 wOutputData[51] <= wInputData[13];
 wOutputData[52] <= wInputData[5];
 wOutputData[53] <= wInputData[28];
 wOutputData[54] <= wInputData[20];
 wOutputData[55] <= wInputData[12];
 wOutputData[56] <= wInputData[4];

 end
endmodule // KeyExpansionPermChoice1
