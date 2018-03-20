/* 
 * Feistal Function Final Permutation
 * for DES encryption algorithm
 * 
 */

module StraightPBox(wOutputData, wInputData);

   //input is 32 bit
   input wire [0:31] wInputData ;
   //output is 32 bit
   output reg [0:31] wOutputData ;
always @*
begin
    wOutputData[0] <= wInputData[15];
    wOutputData[1] <= wInputData[6];
    wOutputData[2] <= wInputData[19];
    wOutputData[3] <= wInputData[20];
   
    wOutputData[4] <= wInputData[28];
    wOutputData[5] <= wInputData[11];
    wOutputData[6] <= wInputData[27];
    wOutputData[7] <= wInputData[16];
   
    wOutputData[8] <= wInputData[0];
    wOutputData[9] <= wInputData[14];
    wOutputData[10] <= wInputData[22];
    wOutputData[11] <= wInputData[25];
   
    wOutputData[12] <= wInputData[4];
    wOutputData[13] <= wInputData[17];
    wOutputData[14] <= wInputData[30];
    wOutputData[15] <= wInputData[9];
   
    wOutputData[16] <= wInputData[1];
    wOutputData[17] <= wInputData[7];
    wOutputData[18] <= wInputData[23];
    wOutputData[19] <= wInputData[13];
   
    wOutputData[20] <= wInputData[31];
    wOutputData[21] <= wInputData[26];
    wOutputData[22] <= wInputData[2];
    wOutputData[23] <= wInputData[8];
   
    wOutputData[24] <= wInputData[18];
    wOutputData[25] <= wInputData[12];
    wOutputData[26] <= wInputData[29];
    wOutputData[27] <= wInputData[5];
   
    wOutputData[28] <= wInputData[21];
    wOutputData[29] <= wInputData[10];
    wOutputData[30] <= wInputData[3];
    wOutputData[31] <= wInputData[24];
   end
endmodule // StraightPBox

