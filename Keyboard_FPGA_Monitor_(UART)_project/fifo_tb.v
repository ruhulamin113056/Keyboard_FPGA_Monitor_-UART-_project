`timescale 1ns / 1ps


module fifo_tb;

	// Inputs
	reg clk;
	reg reset;
	reg rd;
	reg wr;
	reg [7:0] w_data;

	// Outputs
	wire empty;
	wire full;
	wire [7:0] r_data;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.clk(clk), 
		.reset(reset), 
		.rd(rd), 
		.wr(wr), 
		.w_data(w_data), 
		.empty(empty), 
		.full(full), 
		.r_data(r_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rd = 0;
		wr = 0;
		w_data = 0;
		#10;

		reset = 0;
		rd = 0;
		wr = 1;
		w_data = 8'b10101100;
		#10;
		#10;
		
		w_data = 8'b11110000;
		#10;
		#10;

	
		rd = 1;
		wr = 0;
		w_data = 0;
		#10;
		#10;
		
		rd = 0;
		wr = 1;
		w_data = 8'b00001111;
		#10;#10;
        
		reset = 1;
		rd = 0;
		wr = 0;
		w_data = 0;
		#10;#10;

	end
      
	always
		begin
			#10 clk = ~clk;
		end
		
endmodule

