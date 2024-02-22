module display
(
	input clk, data_led,
	output led_x1, led_x2, led_x3, led_x4, led_x5, led_x6, led_x7, led_x8
);

reg [4:0] led_act = 5'b00000;
reg x1 = 1'b0;
reg x2 = 1'b0;
reg x3 = 1'b0;
reg x4 = 1'b0;
/*vale para o Y*/
reg x5 = 1'b0;
reg x6 = 1'b0;
reg x7 = 1'b0;
reg x8 = 1'b0;

always begin @ (posedge clk)
	if (led_act == 5'b00001 & data_led)
	begin
		x1 = 1'b1;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b00010 & data_led)
	begin
		x1 = 1'b1;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b0;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b00011 & data_led)
	begin
		x1 = 1'b1;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b0;
		x8 = 1'b1;
	end
	else if (led_act == 5'b00100 & data_led)
	begin
		x1 = 1'b1;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b0;
	end
	else if (led_act == 5'b00101 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b1;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b00110 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b1;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b0;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b00111 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b1;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b0;
		x8 = 1'b1;
	end
	else if (led_act == 5'b01000 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b1;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b0;
	end
	else if (led_act == 5'b01001 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b1;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b01010 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b1;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b0;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b01011 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b1;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b0;
		x8 = 1'b1;
	end
	else if (led_act == 5'b01100 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b1;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b0;
	end
	else if (led_act == 5'b01101 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b1;
		x5 = 1'b0;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b01110 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b1;
		x5 = 1'b1;
		x6 = 1'b0;
		x7 = 1'b1;
		x8 = 1'b1;
	end
	else if (led_act == 5'b01111 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b1;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b0;
		x8 = 1'b1;
	end
	else if (led_act == 5'b10000 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b1;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b0;
	end
	else
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b1;
		x7 = 1'b1;
		x8 = 1'b1;
		
		if (led_act == 5'b10000)
		begin
			led_act = 5'b00000;
		end
	end
	
	led_act = led_act + 5'b00001;
end

/*
always begin @ (posedge clk)
	if (led_act == 4'b0001 & data_led)
	begin
		x1 = 1'b1;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b0;
		x7 = 1'b0;
		x8 = 1'b0;
	end
	else if (led_act == 4'b0010 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b1;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b0;
		x7 = 1'b0;
		x8 = 1'b0;
	end
	else if (led_act == 4'b0011 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b1;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b0;
		x7 = 1'b0;
		x8 = 1'b0;
	end
	else if (led_act == 4'b0100 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b1;
		x5 = 1'b0;
		x6 = 1'b0;
		x7 = 1'b0;
		x8 = 1'b0;
	end
	else if (led_act == 4'b0101 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b1;
		x6 = 1'b0;
		x7 = 1'b0;
		x8 = 1'b0;
	end
	else if (led_act == 4'b0110 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b1;
		x7 = 1'b0;
		x8 = 1'b0;
	end
	else if (led_act == 4'b0111 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b0;
		x7 = 1'b1;
		x8 = 1'b0;
	end
	else if (led_act == 4'b1000 & data_led)
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b0;
		x7 = 1'b0;
		x8 = 1'b1;
		led_act = 4'b0000;
	end
	else
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b0;
		x4 = 1'b0;
		x5 = 1'b0;
		x6 = 1'b0;
		x7 = 1'b0;
		x8 = 1'b0;
		
		if (led_act == 4'b1000)
		begin
			led_act = 4'b0000;
		end
	end
	
	led_act = led_act + 4'b0001;
end
*/

/*
always begin @ (posedge clk)
	if (led_act == 2'b01)
	begin
		x1 = 1'b1;
		x2 = 1'b0;
		x3 = 1'b0;
	end
	else if (led_act == 2'b10)
	begin
		x1 = 1'b0;
		x2 = 1'b1;
		x3 = 1'b0;
	end
	else 
	begin
		x1 = 1'b0;
		x2 = 1'b0;
		x3 = 1'b1;
		led_act = 2'b00;
	end
	
	led_act = led_act + 2'b01;
end
*/

assign led_x1 = x1;
assign led_x2 = x2;
assign led_x3 = x3;
assign led_x4 = x4;
assign led_x5 = x5;
assign led_x6 = x6;
assign led_x7 = x7;
assign led_x8 = x8;
	
endmodule
