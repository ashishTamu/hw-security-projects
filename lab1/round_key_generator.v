/* 
 * Rounding key generator
 * for DES encryption algorithm
 * 
 */


module RoundKeyGenerator(roundKey1,
			 roundKey2,
			 roundKey3,
			 roundKey4,
			 roundKey5,
			 roundKey6,
			 roundKey7,
			 roundKey8,
			 roundKey9,
			 roundKey10,
			 roundKey11,
			 roundKey12,
			 roundKey13,
			 roundKey14,
			 roundKey15,
			 roundKey16,
			 inputKey
			 );
   
   output wire [47:0] roundKey1;
   output wire [47:0] roundKey2;
   output wire [47:0] roundKey3;
   output wire [47:0] roundKey4;
   output wire [47:0] roundKey5;
   output wire [47:0] roundKey6;
   output wire [47:0] roundKey7;
   output wire [47:0] roundKey8;
   output wire [47:0] roundKey9;
   output wire [47:0] roundKey10;
   output wire [47:0] roundKey11;
   output wire [47:0] roundKey12;
   output wire [47:0] roundKey13;
   output wire [47:0] roundKey14;
   output wire [47:0] roundKey15;
   output wire [47:0] roundKey16;
   input wire [55:0] inputKey;

   wire [55:0] 	     wPC1Key;
   wire [55:0] 	     wShiftedRoundKey1;
   wire [55:0] 	     wShiftedRoundKey2;
   wire [55:0] 	     wShiftedRoundKey3;
   wire [55:0] 	     wShiftedRoundKey4;
   wire [55:0] 	     wShiftedRoundKey5;
   wire [55:0] 	     wShiftedRoundKey6;
   wire [55:0] 	     wShiftedRoundKey7;
   wire [55:0] 	     wShiftedRoundKey8;
   wire [55:0] 	     wShiftedRoundKey9;
   wire [55:0] 	     wShiftedRoundKey10;
   wire [55:0] 	     wShiftedRoundKey11;
   wire [55:0] 	     wShiftedRoundKey12;
   wire [55:0] 	     wShiftedRoundKey13;
   wire [55:0] 	     wShiftedRoundKey14;
   wire [55:0] 	     wShiftedRoundKey15;
   wire [55:0] 	     wShiftedRoundKey16;
   
  
   //keyexpansion permutation1
   KeyExpansionPermChoice1 key_pc_init(wPC1Key,key);
   
   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey1 = {wPC1Key[26:0],wPC1Key[27]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc1(roundKey1,wShiftedRoundKey1);
   
   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey2 = {wShiftedRoundKey1[26:0],wShiftedRoundKey1[27]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc2(roundKey2,wShiftedRoundKey2);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey3 = {wShiftedRoundKey2[25:0],wShiftedRoundKey2[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc3(roundKey3,wShiftedRoundKey3);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey4 = {wShiftedRoundKey3[25:0],wShiftedRoundKey3[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc4(roundKey4,wShiftedRoundKey4);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey5 = {wShiftedRoundKey4[25:0],wShiftedRoundKey4[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc5(roundKey5,wShiftedRoundKey5);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey6 = {wShiftedRoundKey5[25:0],wShiftedRoundKey5[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc6(roundKey6,wShiftedRoundKey6);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey7 = {wShiftedRoundKey6[25:0],wShiftedRoundKey6[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc7(roundKey7,wShiftedRoundKey7);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey8 = {wShiftedRoundKey7[25:0],wShiftedRoundKey7[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc8(roundKey8,wShiftedRoundKey8);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey9 = {wShiftedRoundKey8[26:0],wShiftedRoundKey8[27]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc9(roundKey9,wShiftedRoundKey9);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey10 = {wShiftedRoundKey9[25:0],wShiftedRoundKey9[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc10(roundKey10,wShiftedRoundKey10);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey11 = {wShiftedRoundKey10[25:0],wShiftedRoundKey10[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc11(roundKey11,wShiftedRoundKey11);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey12 = {wShiftedRoundKey11[25:0],wShiftedRoundKey11[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc12(roundKey12,wShiftedRoundKey12);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey13 = {wShiftedRoundKey12[25:0],wShiftedRoundKey12[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc13(roundKey13,wShiftedRoundKey13);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey14 = {wShiftedRoundKey13[25:0],wShiftedRoundKey13[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc14(roundKey14,wShiftedRoundKey14);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey15 = {wShiftedRoundKey14[25:0],wShiftedRoundKey14[27:26]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc15(roundKey15,wShiftedRoundKey15);

   //Shift operations by 1 for 1 2 9 16 else 2 
   assign wShiftedRoundKey16 = {wShiftedRoundKey15[26:0],wShiftedRoundKey15[27]};
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc16(roundKey16,wShiftedRoundKey16);
   
endmodule // RoundKeyGenerator


