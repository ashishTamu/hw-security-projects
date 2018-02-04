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
   
   output wire[47:0] roundKey1;
   output wire[47:0] roundKey2;
   output wire[47:0] roundKey3;
   output wire[47:0] roundKey4;
   output wire[47:0] roundKey5;
   output wire[47:0] roundKey6;
   output wire[47:0] roundKey7;
   output wire[47:0] roundKey8;
   output wire[47:0] roundKey9;
   output wire[47:0] roundKey10;
   output wire[47:0] roundKey11;
   output wire[47:0] roundKey12;
   output wire[47:0] roundKey13;
   output wire[47:0] roundKey14;
   output wire[47:0] roundKey15;
   output wire[47:0] roundKey16;
   input wire [55:0] inputKey;

   wire [55:0] 	     wPC1Key;
   reg [55:0] 	     wShiftedRoundKey1;
   reg [55:0] 	     wShiftedRoundKey2;
   reg [55:0] 	     wShiftedRoundKey3;
   reg [55:0] 	     wShiftedRoundKey4;
   reg [55:0] 	     wShiftedRoundKey5;
   reg [55:0] 	     wShiftedRoundKey6;
   reg [55:0] 	     wShiftedRoundKey7;
   reg [55:0] 	     wShiftedRoundKey8;
   reg [55:0] 	     wShiftedRoundKey9;
   reg [55:0] 	     wShiftedRoundKey10;
   reg [55:0] 	     wShiftedRoundKey11;
   reg [55:0] 	     wShiftedRoundKey12;
   reg [55:0] 	     wShiftedRoundKey13;
   reg [55:0] 	     wShiftedRoundKey14;
   reg [55:0] 	     wShiftedRoundKey15;
   reg [55:0] 	     wShiftedRoundKey16;
   

   //keyexpansion permutation1
   KeyExpansionPermChoice1 key_pc_init(wPC1Key,inputKey);
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc1(roundKey1,wShiftedRoundKey1);
      //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc2(roundKey2,wShiftedRoundKey2);
  //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc3(roundKey3,wShiftedRoundKey3);
 
 //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc4(roundKey4,wShiftedRoundKey4);

  //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc5(roundKey5,wShiftedRoundKey5);

   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc6(roundKey6,wShiftedRoundKey6);
//keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc7(roundKey7,wShiftedRoundKey7);

   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc8(roundKey8,wShiftedRoundKey8);
 //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc9(roundKey9,wShiftedRoundKey9);
  //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc10(roundKey10,wShiftedRoundKey10);
  //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc11(roundKey11,wShiftedRoundKey11);

   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc12(roundKey12,wShiftedRoundKey12);

   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc13(roundKey13,wShiftedRoundKey13);
   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc14(roundKey14,wShiftedRoundKey14);

   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc15(roundKey15,wShiftedRoundKey15);

	   //keyexpansion permutation2
   KeyExpansionPermChoice2 key_pc16(roundKey16,wShiftedRoundKey16);

always @*
begin	
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey1 <= {wPC1Key[54:28],wPC1Key[55],wPC1Key[26:0],wPC1Key[27]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey2 <= {wShiftedRoundKey1[54:28],wShiftedRoundKey1[55],wShiftedRoundKey1[26:0],wShiftedRoundKey1[27]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey3 <= {wShiftedRoundKey2[53:28],wShiftedRoundKey2[55:54],wShiftedRoundKey2[25:0],wShiftedRoundKey2[27:26]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey4 <= {wShiftedRoundKey3[53:28],wShiftedRoundKey3[55:54],wShiftedRoundKey3[25:0],wShiftedRoundKey3[27:26]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey5 <= {wShiftedRoundKey4[53:28],wShiftedRoundKey4[55:54],wShiftedRoundKey4[25:0],wShiftedRoundKey4[27:26]};
    //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey6 <= {wShiftedRoundKey5[53:28],wShiftedRoundKey5[55:54],wShiftedRoundKey5[25:0],wShiftedRoundKey5[27:26]};


   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey7 <= {wShiftedRoundKey6[53:28],wShiftedRoundKey6[55:54],wShiftedRoundKey6[25:0],wShiftedRoundKey6[27:26]};
  
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey8 <= {wShiftedRoundKey7[53:28],wShiftedRoundKey7[55:54],wShiftedRoundKey7[25:0],wShiftedRoundKey7[27:26]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey9 <= {wShiftedRoundKey8[54:28],wShiftedRoundKey8[55],wShiftedRoundKey8[26:0],wShiftedRoundKey8[27]};
  
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey10 <= {wShiftedRoundKey9[53:28],wShiftedRoundKey9[55:54],wShiftedRoundKey9[25:0],wShiftedRoundKey9[27:26]};
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey11 <= {wShiftedRoundKey10[53:28],wShiftedRoundKey10[55:54],wShiftedRoundKey10[25:0],wShiftedRoundKey10[27:26]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey12 <= {wShiftedRoundKey11[53:28],wShiftedRoundKey11[55:54],wShiftedRoundKey11[25:0],wShiftedRoundKey11[27:26]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey13 <= {wShiftedRoundKey12[53:28],wShiftedRoundKey12[55:54],wShiftedRoundKey12[25:0],wShiftedRoundKey12[27:26]};


   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey14 <= {wShiftedRoundKey13[53:28],wShiftedRoundKey13[55:54],wShiftedRoundKey13[25:0],wShiftedRoundKey13[27:26]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey15 <= {wShiftedRoundKey14[53:28],wShiftedRoundKey14[55:54],wShiftedRoundKey14[25:0],wShiftedRoundKey14[27:26]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey16 <= {wShiftedRoundKey15[54:28],wShiftedRoundKey15[55],wShiftedRoundKey15[26:0],wShiftedRoundKey15[27]};
   end
endmodule // RoundKeyGenerator


