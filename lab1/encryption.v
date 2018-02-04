/*
 * Final integration 
 * DES algorithm
 * 
 *
 **/
  
module Encryption(cipherData,plainText,key);
   

   input wire [1:64] plainText;
   input wire [1:64] key;
   output wire [1:64] cipherData;

   wire [1:64] 	     wInitialPermOut;
   wire [1:64] 	     wRound1Out;
   wire [1:64] 	     wRound2Out;
   wire [1:64] 	     wRound3Out;
   wire [1:64] 	     wRound4Out;
   wire [1:64] 	     wRound5Out;
   wire [1:64] 	     wRound6Out;
   wire [1:64] 	     wRound7Out;
   wire [1:64] 	     wRound8Out;
   wire [1:64] 	     wRound9Out;
   wire [1:64] 	     wRound10Out;
   wire [1:64] 	     wRound11Out;
   wire [1:64] 	     wRound12Out;
   wire [1:64] 	     wRound13Out;
   wire [1:64] 	     wRound14Out;
   wire [1:64] 	     wRound15Out;
   wire [1:64] 	     wRound16Out;
   wire [1:48] 	     wKey1;
   wire [1:48] 	     wKey2;
   wire [1:48] 	     wKey3;
   wire [1:48] 	     wKey4;
   wire [1:48] 	     wKey5;
   wire [1:48] 	     wKey6;
   wire [1:48] 	     wKey7;
   wire [1:48] 	     wKey8;
   wire [1:48] 	     wKey9;
   wire [1:48] 	     wKey10;
   wire [1:48] 	     wKey11;
   wire [1:48] 	     wKey12;
   wire [1:48] 	     wKey13;
   wire [1:48] 	     wKey14;
   wire [1:48] 	     wKey15;
   wire [1:48] 	     wKey16;
   
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

