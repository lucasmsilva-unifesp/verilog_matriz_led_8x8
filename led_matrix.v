module led_matrix
#
(
	parameter ROW = 4,
	parameter COLUMN = 4,
	parameter PIXELS = 16
)
(
	input clk_in, button_in,
	output clk_out,
	output wire data_x1, data_x2, data_x3, data_x4, data_y1, data_y2, data_y3, data_y4
);

wire clk_slow;
wire clk_1Hz;
wire clk_1_second;
wire button_deBounce;

reg first_clk = 1'b1;
reg [0:15] leds_data[0:16];
reg [0:4] led_act = 5'b00000;
reg data_led;

reg led = 1'b0;

reg [0:4] frame = 5'b00000;

frequency_divider_100_Hz frequency_divider_100_Hz(clk_in, clk_slow);
frequency_divider_1_second frequency_divider_1_second(clk_in, clk_1Hz);

DeBounce DeBounce(~button_in, clk_1Hz, button_deBounce);

assign clk_out = led;

always begin @ (posedge button_deBounce)
	frame = frame + 5'b00001;
	
	if (frame > 5'b10000)
	begin
		frame = 5'b00000;
	end
end

always begin @ (posedge clk_slow)
	if (first_clk)
	begin
		leds_data[0] = 16'b0000000000001000;
		leds_data[1] = 16'b0000000000001100;
		leds_data[2] = 16'b0000000000001110;
		leds_data[3] = 16'b0000000000001111;
		leds_data[4] = 16'b0000000010001111;
		leds_data[5] = 16'b0000000011001111;
		leds_data[6] = 16'b0000000011101111;
		leds_data[7] = 16'b0000000011111111;
		leds_data[8] = 16'b0000100011111111;
		leds_data[9] = 16'b0000110011111111;
		leds_data[10] = 16'b0000111011111111;
		leds_data[11] = 16'b0000111111111111;
		leds_data[12] = 16'b1000111111111111;
		leds_data[13] = 16'b1100111111111111;
		leds_data[14] = 16'b1110111111111111;
		leds_data[15] = 16'b1111111111111111;
		leds_data[16] = 16'b0000000000000000;
		
		first_clk = 1'b0;
	end
	data_led = leds_data[frame][led_act];
	led_act = led_act + 5'b00001;
	
	if (led_act > 5'b01111)
	begin
		led_act = 5'b00000;
	end
end

display display(clk_slow, data_led, data_x1, data_x2, data_x3, data_x4, data_y1, data_y2, data_y3, data_y4);

endmodule

