module left_cube_front_face_bottom_left_location_normal_size(
	output logic [2:0][11:0] normal,
	output logic [2:0][11:0] bottom_left_location,
	output logic [1:0][11:0] size
);

always_comb begin
	bottom_left_location[0] = 2457;
	bottom_left_location[1] = 1475;
	bottom_left_location[2] = 0;
	
	normal[0] = 1;
	normal[1] = 0;
	normal[2] = 0;
	
	size[0] = 250;
	size[1] = 285;
end

endmodule
