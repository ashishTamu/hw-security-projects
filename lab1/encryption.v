/*
 * Final integration 
 * DES algorithm
 * 
 *
 **/
  
module Encryption(cipherData,plainText,key);
   

   input wire [63:0] plainText;
   input wire [56:0] key;
   output reg [63:0] cipherData;

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
   
   
   InitialPermutation initial_perm(wInitialPermOut,plainText);
   RoundOperation round1( wRound1Out,wInitialPermOut,wkey1);
   RoundOperation round2( wRound2Out,wRound1Out,wkey2);
   RoundOperation round3( wRound3Out,wRound2Out,wkey3);
   RoundOperation round4( wRound4Out,wRound3Out,wkey4);
   RoundOperation round5( wRound5Out,wRound4Out,wkey5);
   RoundOperation round6( wRound6Out,wRound5Out,wkey6);
   RoundOperation round7( wRound7Out,wRound6Out,wkey7);
   RoundOperation round8( wRound8Out,wRound7Out,wkey8);
   RoundOperation round9( wRound9Out,wRound8Out,wkey9);
   RoundOperation round10( wRound10Out,wRound9Out,wkey10);
   RoundOperation round11( wRound11Out,wRound10Out,wkey11);
   RoundOperation round12( wRound12Out,wRound11Out,wkey12);
   RoundOperation round13( wRound13Out,wRound12Out,wkey13);
   RoundOperation round14( wRound14Out,wRound13Out,wkey14);
   RoundOperation round15( wRound15Out,wRound14Out,wkey15);
   RoundOperation round16( wRound16Out,wRound15Out,wkey16);
   FinalPermutation final_perm(cipherText,wRound16Out);
   
   
  
endmodule // Encryption

