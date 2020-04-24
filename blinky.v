module top( //top module
	CLK_i,
	LED0_o,
	LED1_o
);

input CLK_i;    //input 12Mhz clock
output LED0_o;  //output signal to LEDs
output LED1_o;

reg [24:0] counter;

assign LED0_o = counter[24];
assign LED1_o = counter[3];

always @ (posedge CLK_i) begin
	counter <= counter + 1;
end

endmodule
