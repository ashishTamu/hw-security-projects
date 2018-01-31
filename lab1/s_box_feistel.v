/* 
 * Feistel Function SBOX substitution
 * for DES encryption algorithm
 * 
 */

module SBox(wOutputData, wInputData);
   
   //input is 48 bit
   input wire [47:0] wInputData ;
   //output is 32 bit
   output wire [31:0] wOutputData ;

   S1Box(wOutputData[3:0], wInputData[5:0]);
   S2Box(wOutputData[7:4], wInputData[11:6]);
   S3Box(wOutputData[11:8], wInputData[17:12]);
   S4Box(wOutputData[15:12], wInputData[23:18]);
   S5Box(wOutputData[19:16], wInputData[29:24]);
   S6Box(wOutputData[23:20], wInputData[35:30]);
   S7Box(wOutputData[27:24], wInputData[41:36]);
   S8Box(wOutputData[31:28], wInputData[47:42]);
   
endmodule // SBox

