module frequency_divider_1_second
#(
	parameter COUNT_25MHZ = 25000000,
	parameter COUNT_12MHZ = 12500000 
)
(
	input Clk_25M, 
	output reg slow_clk
);

    reg [31:0] counter = 32'b0;
	 
    always @(posedge Clk_25M)
    begin
        counter <= (counter>=COUNT_25MHZ) ? 0 : counter + 2'b01;
        slow_clk <= (counter < COUNT_12MHZ) ? 1'b0 : 1'b1;
    end
endmodule