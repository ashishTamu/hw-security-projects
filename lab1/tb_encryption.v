`timescale 1ns / 1ps


`define STRLEN 32


module DESTestBench_v;

		task passTest;
		input [63:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: 0x%x should be 0x%x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed: %d of %d passed", passed, numTests);
	endtask

	// Inputs
	
	reg [63:0] plainText;
	reg [63:0] key;
	reg [7:0] passed;


	// Outputs
	
	wire [63:0] cipherText;

	//book keeping

	initial begin
		plainText=0;
		key=0;
		
	end
	
	// Instantiate the Unit Under Test (UUT)
	Encryption uut1 (
		cipherText, 
		plainText,
		key);

	initial begin
		// Initialize Inputs
		passed = 0;
		
		// Program 1
		#10;
		key=64'h133457799BBCDFF1;
		plainText=64'h0123456789ABCDEF;
		#50
		passTest(cipherText, 64'h85E813540F0AB405, "Results of Program 1", passed);
		
		#50;
		allPassed(passed, 1);
		$finish;
	end
	
	   
endmodule

