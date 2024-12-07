module color_determinator(
	input [2:0][11:0] intersection_location,
	input is_intersecting,
	output logic red0,
	output logic red1,
	output logic red2,
	output logic red3,
	output logic green0,
	output logic green1,
	output logic green2,
	output logic green3,
	output logic blue0,
	output logic blue1,
	output logic blue2,
	output logic blue3
);

always_comb
	if (is_intersecting) begin
		{red0, red1, red2, red3} = {1'b1, 1'b1, 1'b1, 1'b1};
	end else begin
		{red0, red1, red2, red3} = {1'b0, 1'b0, 1'b0, 1'b0};
	end
	
endmodule
