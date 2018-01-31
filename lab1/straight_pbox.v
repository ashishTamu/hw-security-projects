/* 
 * Feistal Function Final Permutation
 * for DES encryption algorithm
 * 
 */

module StraightPBox(wOutputData, wInputData);

   //input is 32 bit
   input wire [31:0] wInputData ;
   //output is 32 bit
   output wire [31:0] wOutputData ;

   assign wOutputData[0]=wInputData[15];
   assign wOutputData[1]=wInputData[6];
   assign wOutputData[2]=wInputData[19];
   assign wOutputData[3]=wInputData[20];
   
   assign wOutputData[4]=wInputData[28];
   assign wOutputData[5]=wInputData[11];
   assign wOutputData[6]=wInputData[27];
   assign wOutputData[7]=wInputData[16];
   
   assign wOutputData[8]=wInputData[0];
   assign wOutputData[9]=wInputData[14];
   assign wOutputData[10]=wInputData[22];
   assign wOutputData[11]=wInputData[25];
   
   assign wOutputData[12]=wInputData[4];
   assign wOutputData[13]=wInputData[17];
   assign wOutputData[14]=wInputData[30];
   assign wOutputData[15]=wInputData[9];
   
   assign wOutputData[16]=wInputData[1];
   assign wOutputData[17]=wInputData[7];
   assign wOutputData[18]=wInputData[23];
   assign wOutputData[19]=wInputData[13];
   
   assign wOutputData[20]=wInputData[31];
   assign wOutputData[21]=wInputData[26];
   assign wOutputData[22]=wInputData[2];
   assign wOutputData[23]=wInputData[8];
   
   assign wOutputData[24]=wInputData[18];
   assign wOutputData[25]=wInputData[12];
   assign wOutputData[26]=wInputData[29];
   assign wOutputData[27]=wInputData[5];
   
   assign wOutputData[28]=wInputData[21];
   assign wOutputData[29]=wInputData[10];
   assign wOutputData[30]=wInputData[3];
   assign wOutputData[31]=wInputData[24];
   
endmodule // StraightPBox

