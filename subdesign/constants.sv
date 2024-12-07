module constants(
	output logic [2:0][11:0] camera_location,
	output logic [2:0][11:0] beginnig_pixel_location,
	output logic [2:0][11:0] pixels_delta_location,
	output logic [2:0][11:0] lantern_location
);

always_comb begin
	camera_location[0] = 4090;
	camera_location[1] = 2000;
	camera_location[2] = 1002;
	
	lantern_location[0] = 3242;
	lantern_location[1] = 1731;
	lantern_location[2] = 761;
	
	beginnig_pixel_location[0] = 2785;
	beginnig_pixel_location[1] = 1541;
	beginnig_pixel_location[2] = 798;
	
	pixels_delta_location[0] = 36;
	pixels_delta_location[1] = 89;
	pixels_delta_location[2] = 82;
end

endmodule
