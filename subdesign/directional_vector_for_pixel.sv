module directional_vector_for_pixel(
	input [1:0][10:0] instantaneous_beam_position,
	input [2:0][11:0] camera_location,
	input [2:0][11:0] beginnig_pixel_location,
	input [2:0][11:0] pixels_delta_location,
	output logic [2:0][11:0] vector
);

always_comb begin
	vector[0] = camera_location[0] - beginnig_pixel_location[0] - instantaneous_beam_position[1] * pixels_delta_location[0];
	vector[1] = camera_location[1] - beginnig_pixel_location[1] - instantaneous_beam_position[0] * pixels_delta_location[1];
	vector[2] = camera_location[2] - beginnig_pixel_location[2] + instantaneous_beam_position[1] * pixels_delta_location[2];
end

endmodule
