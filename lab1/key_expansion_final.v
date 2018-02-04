module KeyExpansionPermChoice2(wOutputData, wInputData);
   

   input wire [56:1] wInputData ;
   
   output reg [48:1] wOutputData ;

   
always @*
begin
 wOutputData[1] <= wInputData[14];
 wOutputData[2] <= wInputData[17];
 wOutputData[3] <= wInputData[11];
 wOutputData[4] <= wInputData[24];
 wOutputData[5] <= wInputData[1];
 wOutputData[6] <= wInputData[5];
 wOutputData[7] <= wInputData[3];
 wOutputData[8] <= wInputData[28];
 wOutputData[9] <= wInputData[15];
 wOutputData[10] <= wInputData[6];
 wOutputData[11] <= wInputData[21];
 wOutputData[12] <= wInputData[10];
 wOutputData[13] <= wInputData[23];
 wOutputData[14] <= wInputData[19];
 wOutputData[15] <= wInputData[12];
 wOutputData[16] <= wInputData[4];
 wOutputData[17] <= wInputData[26];
 wOutputData[18] <= wInputData[8];
 wOutputData[19] <= wInputData[16];
 wOutputData[20] <= wInputData[7];
 wOutputData[21] <= wInputData[27];
 wOutputData[22] <= wInputData[20];
 wOutputData[23] <= wInputData[13];
 wOutputData[24] <= wInputData[2];
 wOutputData[25] <= wInputData[41];
 wOutputData[26] <= wInputData[52];
 wOutputData[27] <= wInputData[31];
 wOutputData[28] <= wInputData[37];
 wOutputData[29] <= wInputData[47];
 wOutputData[30] <= wInputData[55];
 wOutputData[31] <= wInputData[30];
 wOutputData[32] <= wInputData[40];
 wOutputData[33] <= wInputData[51];
 wOutputData[34] <= wInputData[45];
 wOutputData[35] <= wInputData[33];
 wOutputData[36] <= wInputData[48];
 wOutputData[37] <= wInputData[44];
 wOutputData[38] <= wInputData[49];
 wOutputData[39] <= wInputData[39];
 wOutputData[40] <= wInputData[56];
 wOutputData[41] <= wInputData[34];
 wOutputData[42] <= wInputData[53];
 wOutputData[43] <= wInputData[46];
 wOutputData[44] <= wInputData[42];
 wOutputData[45] <= wInputData[50];
 wOutputData[46] <= wInputData[36];
 wOutputData[47] <= wInputData[29];
 wOutputData[48] <= wInputData[32];
end
endmodule // KeyExpansionPermChoice2
