/*
 * Utils contains all the utility function like XOR etc
 */

module XOR (wOutputData,wInputData1,wInputData2,);

   input wire [63:0] wInputData1;
   input wire [63:0] wInputData2;
   output wire [63:0] wOutputData;
   wOutputData = wInputData1^wInputData2;
endmodule
