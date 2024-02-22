module led_matrix
(
	input clk_in, button_in,
	output clk_out,
	output wire data_x1, data_x2, data_x3, data_x4, data_x5, data_x6, data_x7, data_x8
);

wire clk_slow;
wire button_deBounce;

reg [15:0] leds = 16'b1001110000110101;
reg [4:0] led_act = 5'b00000;
reg data_led;

frequency_divider_100_Hz frequency_divider_100_Hz(clk_in, clk_slow);

assign clk_out = clk_slow;

DeBounce DeBounce(~button_in, clk_slow, button_deBounce);

always begin @ (posedge clk_slow)
	data_led = leds[led_act];
	led_act = led_act + 5'b00001;
	
	if (led_act > 5'b01111)
	begin
		led_act = 5'b00000;
	end
end

display display(clk_slow, data_led, data_x1, data_x2, data_x3, data_x4, data_x5, data_x6, data_x7, data_x8);

endmodule

