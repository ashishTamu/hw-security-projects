module Decryption(plainText,cipherText,key);


   input wire [1:64] cipherText;
   input wire [1:64] key;
   output wire [1:64] plainText;

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
   FinalPermutation inverse_perm(wInitialPermOut,cipherText);
   RoundKeyGenerator rkg(wKey16,
			 wKey15,
			 wKey14,
			 wKey13,
			 wKey12,
			 wKey11,
			 wKey10,
			 wKey9,
			 wKey8,
			 wKey7,
			 wKey6,
			 wKey5,
			 wKey4,
			 wKey3,
			 wKey2,
			 wKey1,			
			 key
			 );
   RoundOperation round16( wRound16Out,wInitialPermOut,wKey16);
   RoundOperation round15( wRound15Out,wRound16Out,wKey15);
   RoundOperation round14( wRound14Out,wRound15Out,wKey14);
   RoundOperation round13( wRound13Out,wRound14Out,wKey13);
   RoundOperation round12( wRound12Out,wRound13Out,wKey12);
   RoundOperation round11( wRound11Out,wRound12Out,wKey11);
   RoundOperation round10( wRound10Out,wRound11Out,wKey10);
   RoundOperation round9( wRound9Out,wRound10Out,wKey9);
   RoundOperation round8( wRound8Out,wRound9Out,wKey8);
   RoundOperation round7( wRound7Out,wRound8Out,wKey7);
   RoundOperation round6( wRound6Out,wRound7Out,wKey6);
   RoundOperation round5( wRound5Out,wRound6Out,wKey5);
   RoundOperation round4( wRound4Out,wRound5Out,wKey4);
   RoundOperation round3( wRound3Out,wRound4Out,wKey3);
   RoundOperation round2( wRound2Out,wRound3Out,wKey2);
   RoundOperation round1( wRound1Out,wRound2Out,wKey1);
   InitialPermutation perm(plainText,wRound1Out);   
endmodule // Decryption

