module led_matrix
#
(
	parameter ROWS = 4,
	parameter COLUMNS = 4,
	parameter PIXELS = 16
)
(
	input clk_in, button_down, button_left, button_up, button_right,
	output clk_out,
	output wire data_x1, data_x2, data_x3, data_x4, data_y1, data_y2, data_y3, data_y4
);

integer row;
integer column;
integer pixelRow;
integer pixelCol;
integer pr;
integer pc;
integer pixel;
integer nextPixel;

wire clk_slow;
wire clk_1Hz;
wire clk_1_second;
wire button_down_deBounce;
wire button_left_deBounce;
wire button_up_deBounce;
wire button_right_deBounce;
wire button_deBounce;

reg first_clk = 1'b1;
reg [0:15] leds_data = 16'b0001000000000000;
reg [0:4] led_act = 5'b00000;
reg data_led;

reg led = 1'b0;

reg [0:4] frame = 5'b00000;

frequency_divider_100_Hz frequency_divider_100_Hz(clk_in, clk_slow);
frequency_divider_1_second frequency_divider_1_second(clk_in, clk_1Hz);

DeBounce DeBounce_down(~button_down, clk_1Hz, button_down_deBounce);
DeBounce DeBounce_left(~button_left, clk_1Hz, button_left_deBounce);
DeBounce DeBounce_up(~button_up, clk_1Hz, button_up_deBounce);
DeBounce DeBounce_right(~button_right, clk_1Hz, button_right_deBounce);

assign button_deBounce = button_down_deBounce | button_left_deBounce | button_up_deBounce | button_right_deBounce;

assign clk_out = led;

always begin @ (posedge button_deBounce)

	for (pixelRow = 0; pixelRow < ROWS; pixelRow = pixelRow + 1)
	begin
		for (pixelCol = 0; pixelCol < COLUMNS; pixelCol = pixelCol + 1)
		begin
			if (leds_data[pixelRow * ROWS + pixelCol])
			begin
				pr = pixelRow;
				pc = pixelCol;
			end
		end
	end
	
	if (~button_down)
	begin
		pixel = pr * ROWS + pc;
		nextPixel = (pr+1) * ROWS + pc;
		
		if (pr == 0)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pr == 1)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pr == 2)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pr == 3)
		begin
			leds_data[pixel] = 0;
			leds_data[pc] = 1;
		end
	end
	else if (~button_left)
	begin
		pixel = pr * ROWS + pc;
		nextPixel = (pr) * ROWS + pc - 1;
		
		if (pc == 0)
		begin
			leds_data[pixel] = 0;
			leds_data[pr * ROWS + COLUMNS - 1] = 1;
		end
		else if (pc == 1)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pc == 2)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pc == 3)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
	end
	else if (~button_up)
	begin
		pixel = pr * ROWS + pc;
		nextPixel = (pr-1) * ROWS + pc;
		
		if (pr == 0)
		begin
			leds_data[pixel] = 0;
			leds_data[(ROWS - 1) * ROWS + pc] = 1;
		end
		else if (pr == 1)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pr == 2)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pr == 3)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
	end
	else if (~button_right)
	begin
		pixel = pr * ROWS + pc;
		nextPixel = pr * ROWS + pc + 1;
		
		if (pc == 0)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pc == 1)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pc == 2)
		begin
			leds_data[pixel] = 0;
			leds_data[nextPixel] = 1;
		end
		else if (pc == 3)
		begin
			leds_data[pixel] = 0;
			leds_data[pr * ROWS] = 1;
		end
	end
end

always begin @ (posedge clk_slow)
	
	data_led = leds_data[led_act];
	led_act = led_act + 5'b00001;
	
	if (led_act > 5'b01111)
	begin
		led_act = 5'b00000;
	end
end

display display(clk_slow, data_led, data_x1, data_x2, data_x3, data_x4, data_y1, data_y2, data_y3, data_y4);

endmodule

