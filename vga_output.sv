module vga_output(
	input clock,
	output logic red_subpixel_voltage,
	output logic green_subpixel_voltage,
	output logic blue_subpixel_voltage,
	output logic switch_line,
	output logic switch_frame
);

logic [10:0] width_counter = 0;
logic [9:0] height_counter = 0;
logic is_ray_enabled = 0;

logic illustration;

always_ff @ (posedge clock) begin
	if (width_counter == 0) begin
		switch_line <= 1;
		width_counter <= width_counter + 1; 
		height_counter <= height_counter + 1;
	end else 
		width_counter <= width_counter + 1; 
	if (height_counter >= 28 && height_counter <= 795)
		if (width_counter == 159)  // waited for the back porch
			is_ray_enabled <= 1;
		else if (width_counter == 1183)  // waited for the visible area
			is_ray_enabled <= 0;
	if (width_counter == 1207)  // waited for the front porch
		switch_line <= 0;
	else if (width_counter == 1343)  // waited for the switching
		width_counter <= '0;
		
	if (height_counter == 0)
		switch_frame <= 1;
	if (height_counter == 28)  // waited for the back porch
		illustration <= 0;
	else if (height_counter == 796)  // waited for the visible area
		illustration <= 1;
	else if (height_counter == 799)  // waited for the front porch
		switch_frame <= 0;
	else if (height_counter == 805)  // waited for the switching
		height_counter <= '0;
end


always_comb
	if (is_ray_enabled)
		if (width_counter < 341 + 160) begin
			red_subpixel_voltage = 0;
			green_subpixel_voltage = 0;
			blue_subpixel_voltage = 1;
		end else if (width_counter < 683 + 160 && width_counter >= 341 + 160) begin 
			red_subpixel_voltage = 1;
			green_subpixel_voltage = 1;
			blue_subpixel_voltage = 1;
		end else begin 
			red_subpixel_voltage = 1;
			green_subpixel_voltage = 0;
			blue_subpixel_voltage = 0;
		end
	else begin 
		red_subpixel_voltage = 0;
		green_subpixel_voltage = 0;
		blue_subpixel_voltage = 0;
	end

endmodule
