module electron_beam_positioner(
	input clock,
	input reset,
	output logic [1:0][10:0] instantaneous_beam_position,
	output logic beam2left_signal,
	output logic beam2top_signal
);

logic is_ray_enabled = 0;
logic illustration;

always_ff @ (posedge clock or negedge reset) begin
	if (~reset) begin 
		instantaneous_beam_position[0] <= '0;
		instantaneous_beam_position[1] <= '0;
		beam2left_signal <= 0;
		beam2top_signal <= 0;
	end else begin
		if (instantaneous_beam_position[0] == 0) begin
			beam2left_signal <= 1;
			instantaneous_beam_position[0] <= instantaneous_beam_position[0] + 1; 
			instantaneous_beam_position[1] <= instantaneous_beam_position[1] + 1;
		end else 
			instantaneous_beam_position[0] <= instantaneous_beam_position[0] + 1; 
		if (instantaneous_beam_position[1] >= 28 && instantaneous_beam_position[1] <= 795)
			if (instantaneous_beam_position[0] == 159)  // waited for the back porch
				is_ray_enabled <= 1;
			else if (instantaneous_beam_position[0] == 1183)  // waited for the visible area
				is_ray_enabled <= 0;
		if (instantaneous_beam_position[0] == 1207)  // waited for the front porch
			beam2left_signal <= 0;
		else if (instantaneous_beam_position[0] == 1343)  // waited for the switching
			instantaneous_beam_position[0] <= '0;
		
		if (instantaneous_beam_position[1] == 0)
			beam2top_signal <= 1;
		if (instantaneous_beam_position[1] == 28)  // waited for the back porch
			illustration <= 0;
		else if (instantaneous_beam_position[1] == 796)  // waited for the visible area
			illustration <= 1;
		else if (instantaneous_beam_position[1] == 799)  // waited for the front porch
			beam2top_signal <= 0;
		else if (instantaneous_beam_position[1] == 805)  // waited for the switching
			instantaneous_beam_position[1] <= '0;
	end
end

endmodule
