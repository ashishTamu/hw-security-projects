/* 
 * Feistel Function SBOX substitution
 * for DES encryption algorithm
 * 
 */

module SBox(wOutputData, wInputData);
   
   //input is 48 bit
   input wire [1:48] wInputData ;
   //output is 32 bit
   output wire[1:32] wOutputData ;
//always @*
//begin
   S1Box s1box (wOutputData[1:4], wInputData[1:6]);
   S2Box s2box (wOutputData[5:8], wInputData[7:12]);
   S3Box s3box (wOutputData[9:12], wInputData[13:18]);
   S4Box s4box (wOutputData[13:16], wInputData[19:24]);
   S5Box s5box (wOutputData[17:20], wInputData[25:30]);
   S6Box s6box (wOutputData[21:24], wInputData[31:36]);
   S7Box s7box (wOutputData[25:28], wInputData[37:42]);
   S8Box s8box (wOutputData[29:32], wInputData[43:48]);
  // end
endmodule // SBox

