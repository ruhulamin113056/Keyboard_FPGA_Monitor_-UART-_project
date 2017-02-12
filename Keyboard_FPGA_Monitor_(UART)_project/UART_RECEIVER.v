`timescale 1ns / 1ps

module UART_RECEIVER(
							input wire data_rx,
							input wire clk, reset,
							//output wire flag_out,
							output wire [7:0] data_out		
                    );
						  
	wire s_tick;
	wire [7:0] data_bus;
	wire ind_line;
	
	//module Baud_Rate_Generator  #(parameter N = 9, M = 326)
	//(input wire clk, reset,output wire max_tick,output wire [N-1:0] q);
	
   Baud_Rate_Generator  U1
								(
								.clk(clk), 
								.reset(reset),
								.max_tick(s_tick),
								.q()
								);

	//module Receiver #(parameter DBIT = 8,SB_TICK = 16 )
   //(input wire clk, reset,input wire rx, s_tick, output reg rx_done_tick, output wire [7:0] dout);
	
	Receiver U2
				(
				.clk(clk), 
				.reset(reset),
				.rx(data_rx), 
				.s_tick(s_tick), 
				.rx_done_tick(ind_line),
				.dout(data_bus)
				);
				
	//module flag_buf #(parameter W = 8)
	//(input wire clk, reset,input wire clr_flag, set_flag,input wire [W-1:0] din,output wire flag,output wire [W-1:0] dout);
	
	flag_buf U3
				 (
				 .clk(clk), 
				.reset(reset),
				.clr_flag(), 
				.set_flag(ind_line),
				.din(data_bus),
				.flag(),
				.dout(data_out)
				);
endmodule
