`timescale 1ns / 1ps


module Baud_Rate_Generator_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire max_tick;
	wire [8:0] q;

	// Instantiate the Unit Under Test (UUT)
	Baud_Rate_Generator uut (
		.clk(clk), 
		.reset(reset), 
		.max_tick(max_tick), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#10;
		reset = 0;
		
		//#10000000; 
		//$stop;
	end
	
	always
		begin
			#10 clk = ~clk;
		end
      
endmodule

