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
   
   output wire[1:48] roundKey1;
   output wire[1:48] roundKey2;
   output wire[1:48] roundKey3;
   output wire[1:48] roundKey4;
   output wire[1:48] roundKey5;
   output wire[1:48] roundKey6;
   output wire[1:48] roundKey7;
   output wire[1:48] roundKey8;
   output wire[1:48] roundKey9;
   output wire[1:48] roundKey10;
   output wire[1:48] roundKey11;
   output wire[1:48] roundKey12;
   output wire[1:48] roundKey13;
   output wire[1:48] roundKey14;
   output wire[1:48] roundKey15;
   output wire[1:48] roundKey16;
   input wire [1:64] inputKey;

   wire [1:56] 	     wPC1Key;
   reg [1:56] 	     wShiftedRoundKey1;
   reg [1:56] 	     wShiftedRoundKey2;
   reg [1:56] 	     wShiftedRoundKey3;
   reg [1:56] 	     wShiftedRoundKey4;
   reg [1:56] 	     wShiftedRoundKey5;
   reg [1:56] 	     wShiftedRoundKey6;
   reg [1:56] 	     wShiftedRoundKey7;
   reg [1:56] 	     wShiftedRoundKey8;
   reg [1:56] 	     wShiftedRoundKey9;
   reg [1:56] 	     wShiftedRoundKey10;
   reg [1:56] 	     wShiftedRoundKey11;
   reg [1:56] 	     wShiftedRoundKey12;
   reg [1:56] 	     wShiftedRoundKey13;
   reg [1:56] 	     wShiftedRoundKey14;
   reg [1:56] 	     wShiftedRoundKey15;
   reg [1:56] 	     wShiftedRoundKey16;
   

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
    wShiftedRoundKey1 <= {wPC1Key[30:56],wPC1Key[29],wPC1Key[2:28],wPC1Key[1]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey2 <= {wShiftedRoundKey1[30:56],wShiftedRoundKey1[29],wShiftedRoundKey1[2:28],wShiftedRoundKey1[1]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey3 <= {wShiftedRoundKey2[31:56],wShiftedRoundKey2[29:30],wShiftedRoundKey2[3:28],wShiftedRoundKey2[1:2]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey4 <= {wShiftedRoundKey3[31:56],wShiftedRoundKey3[29:30],wShiftedRoundKey3[3:28],wShiftedRoundKey3[1:2]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey5 <= {wShiftedRoundKey4[31:56],wShiftedRoundKey4[29:30],wShiftedRoundKey4[3:28],wShiftedRoundKey4[1:2]};
    //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey6 <= {wShiftedRoundKey5[31:56],wShiftedRoundKey5[29:30],wShiftedRoundKey5[3:28],wShiftedRoundKey5[1:2]};


   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey7 <= {wShiftedRoundKey6[31:56],wShiftedRoundKey6[29:30],wShiftedRoundKey6[3:28],wShiftedRoundKey6[1:2]};
  
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey8 <= {wShiftedRoundKey7[31:56],wShiftedRoundKey7[29:30],wShiftedRoundKey7[3:28],wShiftedRoundKey7[1:2]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey9 <= {wShiftedRoundKey8[30:56],wShiftedRoundKey8[29],wShiftedRoundKey8[2:28],wShiftedRoundKey8[1]};
  
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey10 <= {wShiftedRoundKey9[31:56],wShiftedRoundKey9[29:30],wShiftedRoundKey9[3:28],wShiftedRoundKey9[1:2]};
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey11 <= {wShiftedRoundKey10[31:56],wShiftedRoundKey10[29:30],wShiftedRoundKey10[3:28],wShiftedRoundKey10[1:2]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey12 <= {wShiftedRoundKey11[31:56],wShiftedRoundKey11[29:30],wShiftedRoundKey11[3:28],wShiftedRoundKey11[1:2]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey13 <= {wShiftedRoundKey12[31:56],wShiftedRoundKey12[29:30],wShiftedRoundKey12[3:28],wShiftedRoundKey12[1:2]};


   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey14 <= {wShiftedRoundKey13[31:56],wShiftedRoundKey13[29:30],wShiftedRoundKey13[3:28],wShiftedRoundKey13[1:2]};

   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey15 <= {wShiftedRoundKey14[31:56],wShiftedRoundKey14[29:30],wShiftedRoundKey14[3:28],wShiftedRoundKey14[1:2]};
 
   //Shift operations by 1 for 1 2 9 16 else 2 
    wShiftedRoundKey16 <= {wShiftedRoundKey15[30:56],wShiftedRoundKey15[29],wShiftedRoundKey15[2:28],wShiftedRoundKey15[1]};
   end
endmodule // RoundKeyGenerator


