`timescale 1ns / 1ps


module flag_buf_tb;

	// Inputs
	reg clk;
	reg reset;
	reg clr_flag;
	reg set_flag;
	reg [7:0] din;

	// Outputs
	wire flag;
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	flag_buf uut (
		.clk(clk), 
		.reset(reset), 
		.clr_flag(clr_flag), 
		.set_flag(set_flag), 
		.din(din), 
		.flag(flag), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		clr_flag = 0;
		set_flag = 0;
		din = 8'b0;
		#10;
		
		reset = 0;
		clr_flag = 0;
		set_flag = 1;
		din = 8'b11100010;
		#10;
		#10;
		
		set_flag = 0;
		clr_flag = 1;
		#10;
		
		clr_flag = 0;
		set_flag = 1;
		din = 8'b00110011;
		#10;
		
		$stop;
	end
	
	always
	   begin
			#10 clk = ~clk;
		end
      
endmodule

