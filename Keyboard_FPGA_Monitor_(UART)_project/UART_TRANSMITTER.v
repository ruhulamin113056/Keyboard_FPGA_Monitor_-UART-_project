`timescale 1ns / 1ps

module UART_TRANSMITTER
	(
		input [7:0] sw,
		input [0:0] btn,
		input clk, reset,
		output d_out
    );

	wire [7:0] data_bus;
	wire start_line, read_line,tx_empty,tx_empty_not,tick;
	
	//module fifo#(parameter B = 8,W = 2)
	//(input wire clk, reset,input wire rd, wr,input wire [B-1:0] w_data,output wire empty, full,output wire [B-1:0] r_data);
	
   fifo U1
			(
			.clk(clk), 
			.reset(reset),
			.rd(read_line), 
			.wr(btn),
			.w_data(sw),
			.empty(tx_empty), 
			.full(),
			.r_data(data_bus)
			);
			
	//module transmitter#(parameter DBIT = 8,SB_TICK = 16 )
	//(input wire clk, reset,input wire tx_start, s_tick,input wire [7:0] din,output reg tx_done_tick,output wire tx );
	
	transmitter U2
					 (
						.clk(clk), 
						.reset(reset),
						.tx_start(tx_empty_not), 
						.s_tick(tick),
						.din(data_bus),
						.tx_done_tick(read_line),
						.tx(d_out)
					 );
					 
	//module Baud_Rate_Generator #(parameter N = 9, M = 326 )
   //(input wire clk, reset,output wire max_tick,output wire [N-1:0] q);
	
	Baud_Rate_Generator U3
								(
								  .clk(clk), 
								  .reset(reset),
								  .max_tick(tick),
								  .q()
								 );
	
	assign tx_empty_not = ~tx_empty;
	
endmodule
