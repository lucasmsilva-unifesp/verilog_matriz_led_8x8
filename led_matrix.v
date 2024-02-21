module led_matrix
(
	input clk_in, button_in,
	output clk_out, button_out,
	output data_out
);

reg [7:0] data = 8'b00101011;
reg data_cap;
reg [3:0] range = 4'b0;
reg cont = 1'b0;
reg out = 1'b0;

wire clk_slow;
wire button_deBounce;

frequency_divider_1_second frequency_divider_1_second(clk_in, clk_slow);

assign clk_out = clk_slow;
assign button_out = out;

DeBounce DeBounce(~button_in, clk_slow, button_deBounce);

always begin @(posedge button_deBounce)
	cont = 1'b1;
end

always begin @(posedge clk_slow) 
	if (cont && range < 4'b1000) begin
		out = 1'b1;
		data_cap = data[range];
		range = range + 1'b1;
	end
	else
		out = 1'b0;
end

assign data_out = data_cap;

endmodule

