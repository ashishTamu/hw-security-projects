/* 
 * Feistel Function S6BOX substitution
 * for DES encryption algorithm
 * 
 */

module S6Box(wOutputData, wInputData);
   
   input wire [5:0] wInputData ;
   output wire [3:0] wOutputData ;


   case ({wInputData[5],wInputData[0]})
     2'b00 :
       begin
	  case (wInputData[4:1])
	    4'h0: assign wOutputData = 4'hC;
	    4'h1: assign wOutputData = 4'h1;
	    4'h2: assign wOutputData = 4'hA;
	    4'h3: assign wOutputData = 4'hF;
	    4'h4: assign wOutputData = 4'h9;
	    4'h5: assign wOutputData = 4'h2;
	    4'h6: assign wOutputData = 4'h6;
	    4'h7: assign wOutputData = 4'h8;
	    4'h8: assign wOutputData = 4'h0;
	    4'h9: assign wOutputData = 4'hD;
	    4'hA: assign wOutputData = 4'h3;
	    4'hB: assign wOutputData = 4'h4;
	    4'hC: assign wOutputData = 4'hE;
	    4'hD: assign wOutputData = 4'h7;
	    4'hE: assign wOutputData = 4'h5;
	    4'hF: assign wOutputData = 4'hB;
	    default: assign wOutputData = 4'hx;//x
	  endcase // case (wInputData[4:1])
       end // case: 2'b00

     2'b01 :
       begin
	  case (wInputData[4:1])
	    4'h0: assign wOutputData = 4'hA;
	    4'h1: assign wOutputData = 4'hF;
	    4'h2: assign wOutputData = 4'h4;
	    4'h3: assign wOutputData = 4'h2;
	    4'h4: assign wOutputData = 4'h7;
	    4'h5: assign wOutputData = 4'hC;
	    4'h6: assign wOutputData = 4'h9;  
	    4'h7: assign wOutputData = 4'h5;
	    4'h8: assign wOutputData = 4'h6;
	    4'h9: assign wOutputData = 4'h1;
	    4'hA: assign wOutputData = 4'hD;
	    4'hB: assign wOutputData = 4'hE;
	    4'hC: assign wOutputData = 4'h0;
	    4'hD: assign wOutputData = 4'hB;
	    4'hE: assign wOutputData = 4'h3;
	    4'hF: assign wOutputData = 4'h8;
	    default: assign wOutputData = 4'hx;//x
	  endcase // case (wInputData[4:1])	  
       end // case: 2'b01
     
     2'b10 :
       begin
	  case (wInputData[4:1])
	    4'h0: assign wOutputData = 4'h9;
	    4'h1: assign wOutputData = 4'hE;
	    4'h2: assign wOutputData = 4'hF;
	    4'h3: assign wOutputData = 4'h5;
	    4'h4: assign wOutputData = 4'h2;
	    4'h5: assign wOutputData = 4'h8;
	    4'h6: assign wOutputData = 4'hC;
	    4'h7: assign wOutputData = 4'h3;
	    4'h8: assign wOutputData = 4'h7;
	    4'h9: assign wOutputData = 4'h0;
	    4'hA: assign wOutputData = 4'h4;
	    4'hB: assign wOutputData = 4'hA;
	    4'hC: assign wOutputData = 4'h1;
	    4'hD: assign wOutputData = 4'hD;
	    4'hE: assign wOutputData = 4'hB;
	    4'hF: assign wOutputData = 4'h6;	    
	    default: assign wOutputData = 4'hx;//x
	  endcase // case (wInputData[4:1])	  
       end // case: 2'b10

     2'b11 :
       begin
	  case (wInputData[4:1])
	    4'h0: assign wOutputData = 4'h4;
	    4'h1: assign wOutputData = 4'h3;
	    4'h2: assign wOutputData = 4'h2;
	    4'h3: assign wOutputData = 4'hC;
	    4'h4: assign wOutputData = 4'h9;
	    4'h5: assign wOutputData = 4'h5;
	    4'h6: assign wOutputData = 4'hF;
	    4'h7: assign wOutputData = 4'hA;
	    4'h8: assign wOutputData = 4'hB;
	    4'h9: assign wOutputData = 4'hE;
	    4'hA: assign wOutputData = 4'h1;
	    4'hB: assign wOutputData = 4'h7;
	    4'hC: assign wOutputData = 4'h6;
	    4'hD: assign wOutputData = 4'h0;
	    4'hE: assign wOutputData = 4'h8;
	    4'hF: assign wOutputData = 4'hD;
	    default: assign wOutputData = 4'hx;//x
	  endcase // case (wInputData[4:1])
       end // case: 2'b11
   endcase // case ({wInputData[5],wInputData[0]})
endmodule // S6Box


