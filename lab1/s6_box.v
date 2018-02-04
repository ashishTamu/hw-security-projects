/* 
 * Feistel Function S6BOX substitution
 * for DES encryption algorithm
 * 
 */

module S6Box(wOutputData, wInputData);
   
   input wire [0:5] wInputData ;
   output reg [0:3] wOutputData ;
   always @*
     begin
	
	
	case ({wInputData[0],wInputData[5]})
	  2'b00 :
	    begin
	       case (wInputData[1:4])
		 4'h0: wOutputData <= 4'hC;
		 4'h1: wOutputData <= 4'h1;
		 4'h2: wOutputData <= 4'hA;
		 4'h3: wOutputData <= 4'hF;
		 4'h4: wOutputData <= 4'h9;
		 4'h5: wOutputData <= 4'h2;
		 4'h6: wOutputData <= 4'h6;
		 4'h7: wOutputData <= 4'h8;
		 4'h8: wOutputData <= 4'h0;
		 4'h9: wOutputData <= 4'hD;
		 4'hA: wOutputData <= 4'h3;
		 4'hB: wOutputData <= 4'h4;
		 4'hC: wOutputData <= 4'hE;
		 4'hD: wOutputData <= 4'h7;
		 4'hE: wOutputData <= 4'h5;
		 4'hF: wOutputData <= 4'hB;
		 default: wOutputData <= 4'hx;//x
	       endcase // case (wInputData[1:4])
	    end // case: 2'b00

	  2'b01 :
	    begin
	       case (wInputData[1:4])
		 4'h0: wOutputData <= 4'hA;
		 4'h1: wOutputData <= 4'hF;
		 4'h2: wOutputData <= 4'h4;
		 4'h3: wOutputData <= 4'h2;
		 4'h4: wOutputData <= 4'h7;
		 4'h5: wOutputData <= 4'hC;
		 4'h6: wOutputData <= 4'h9;  
		 4'h7: wOutputData <= 4'h5;
		 4'h8: wOutputData <= 4'h6;
		 4'h9: wOutputData <= 4'h1;
		 4'hA: wOutputData <= 4'hD;
		 4'hB: wOutputData <= 4'hE;
		 4'hC: wOutputData <= 4'h0;
		 4'hD: wOutputData <= 4'hB;
		 4'hE: wOutputData <= 4'h3;
		 4'hF: wOutputData <= 4'h8;
		 default: wOutputData <= 4'hx;//x
	       endcase // case (wInputData[1:4])	  
	    end // case: 2'b01
	  
	  2'b10 :
	    begin
	       case (wInputData[1:4])
		 4'h0: wOutputData <= 4'h9;
		 4'h1: wOutputData <= 4'hE;
		 4'h2: wOutputData <= 4'hF;
		 4'h3: wOutputData <= 4'h5;
		 4'h4: wOutputData <= 4'h2;
		 4'h5: wOutputData <= 4'h8;
		 4'h6: wOutputData <= 4'hC;
		 4'h7: wOutputData <= 4'h3;
		 4'h8: wOutputData <= 4'h7;
		 4'h9: wOutputData <= 4'h0;
		 4'hA: wOutputData <= 4'h4;
		 4'hB: wOutputData <= 4'hA;
		 4'hC: wOutputData <= 4'h1;
		 4'hD: wOutputData <= 4'hD;
		 4'hE: wOutputData <= 4'hB;
		 4'hF: wOutputData <= 4'h6;	    
		 default: wOutputData <= 4'hx;//x
	       endcase // case (wInputData[1:4])	  
	    end // case: 2'b10

	  2'b11 :
	    begin
	       case (wInputData[1:4])
		 4'h0: wOutputData <= 4'h4;
		 4'h1: wOutputData <= 4'h3;
		 4'h2: wOutputData <= 4'h2;
		 4'h3: wOutputData <= 4'hC;
		 4'h4: wOutputData <= 4'h9;
		 4'h5: wOutputData <= 4'h5;
		 4'h6: wOutputData <= 4'hF;
		 4'h7: wOutputData <= 4'hA;
		 4'h8: wOutputData <= 4'hB;
		 4'h9: wOutputData <= 4'hE;
		 4'hA: wOutputData <= 4'h1;
		 4'hB: wOutputData <= 4'h7;
		 4'hC: wOutputData <= 4'h6;
		 4'hD: wOutputData <= 4'h0;
		 4'hE: wOutputData <= 4'h8;
		 4'hF: wOutputData <= 4'hD;
		 default: wOutputData <= 4'hx;//x
	       endcase // case (wInputData[1:4])
	    end // case: 2'b11
	endcase // case ({wInputData[5],wInputData[0]})
     end // always @ *
endmodule // S6Box


