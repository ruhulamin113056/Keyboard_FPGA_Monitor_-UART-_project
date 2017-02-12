`timescale 1ns / 1ps


module receiver_tb;

	// Inputs
	reg clk;
	reg reset;
	reg rx;
	reg s_tick;

	// Outputs
	wire rx_done_tick;
	wire [7:0] dout;
	
	integer c =0;
	// Instantiate the Unit Under Test (UUT)
	Receiver uut (
		.clk(clk), 
		.reset(reset), 
		.rx(rx), 
		.s_tick(s_tick), 
		.rx_done_tick(rx_done_tick), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		s_tick = 0;
		reset = 1;
		#10;
		reset = 0;
		
		rx = 0;
		#100;
	end
	
	always
		begin
			#10 clk = ~ clk;
			if(c == 326)
				begin
				s_tick = 1;
				rx = ~rx;
				c=0;
				end
			else
			c = c+ 1;
		end
		

endmodule

