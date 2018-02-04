/*
 * Final integration 
 * DES algorithm
 * 
 *
 **/
  
module Encryption(cipherData,plainText,key);
   

   input wire [63:0] plainText;
   input wire [63:0] key;
   output wire [63:0] cipherData;

   wire [63:0] 	     wInitialPermOut;
   wire [63:0] 	     wRound1Out;
   wire [63:0] 	     wRound2Out;
   wire [63:0] 	     wRound3Out;
   wire [63:0] 	     wRound4Out;
   wire [63:0] 	     wRound5Out;
   wire [63:0] 	     wRound6Out;
   wire [63:0] 	     wRound7Out;
   wire [63:0] 	     wRound8Out;
   wire [63:0] 	     wRound9Out;
   wire [63:0] 	     wRound10Out;
   wire [63:0] 	     wRound11Out;
   wire [63:0] 	     wRound12Out;
   wire [63:0] 	     wRound13Out;
   wire [63:0] 	     wRound14Out;
   wire [63:0] 	     wRound15Out;
   wire [63:0] 	     wRound16Out;
   wire [47:0] 	     wKey1;
   wire [47:0] 	     wKey2;
   wire [47:0] 	     wKey3;
   wire [47:0] 	     wKey4;
   wire [47:0] 	     wKey5;
   wire [47:0] 	     wKey6;
   wire [47:0] 	     wKey7;
   wire [47:0] 	     wKey8;
   wire [47:0] 	     wKey9;
   wire [47:0] 	     wKey10;
   wire [47:0] 	     wKey11;
   wire [47:0] 	     wKey12;
   wire [47:0] 	     wKey13;
   wire [47:0] 	     wKey14;
   wire [47:0] 	     wKey15;
   wire [47:0] 	     wKey16;
   
   ///always @*
	//begin
   InitialPermutation initial_perm(wInitialPermOut,plainText);
   RoundKeyGenerator rkg(wKey1,
			 wKey2,
			 wKey3,
			 wKey4,
			 wKey5,
			 wKey6,
			 wKey7,
			 wKey8,
			 wKey9,
			 wKey10,
			 wKey11,
			 wKey12,
			 wKey13,
			 wKey14,
			 wKey15,
			 wKey16,
			 key
			 );
   RoundOperation round1( wRound1Out,wInitialPermOut,wKey1);
   RoundOperation round2( wRound2Out,wRound1Out,wKey2);
   RoundOperation round3( wRound3Out,wRound2Out,wKey3);
   RoundOperation round4( wRound4Out,wRound3Out,wKey4);
   RoundOperation round5( wRound5Out,wRound4Out,wKey5);
   RoundOperation round6( wRound6Out,wRound5Out,wKey6);
   RoundOperation round7( wRound7Out,wRound6Out,wKey7);
   RoundOperation round8( wRound8Out,wRound7Out,wKey8);
   RoundOperation round9( wRound9Out,wRound8Out,wKey9);
   RoundOperation round10( wRound10Out,wRound9Out,wKey10);
   RoundOperation round11( wRound11Out,wRound10Out,wKey11);
   RoundOperation round12( wRound12Out,wRound11Out,wKey12);
   RoundOperation round13( wRound13Out,wRound12Out,wKey13);
   RoundOperation round14( wRound14Out,wRound13Out,wKey14);
   RoundOperation round15( wRound15Out,wRound14Out,wKey15);
   RoundOperation round16( wRound16Out,wRound15Out,wKey16);
   FinalPermutation final_perm(cipherData,wRound16Out);
   //end
endmodule // Encryption

