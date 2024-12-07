module look_for_face_vector_intersection(
	input [2:0][11:0] camera_location,
	input [2:0][11:0] directional_vector,
	input [2:0][11:0] normal,
	input [2:0][11:0] bottom_left_location,
	input [1:0][11:0] size,
	output [2:0][11:0] intersection_location,
	output is_intersecting
);

always_comb
	if (normal[0]) begin
		intersection_location[0] <= bottom_left_location[0];
		intersection_location[1] <= camera_location[1] + directional_vector[1] / directional_vector[0] * (intersection_location[0] - camera_location[0]);
		intersection_location[2] <= camera_location[2] + directional_vector[2] / directional_vector[0] * (intersection_location[0] - camera_location[0]);
		if (bottom_left_location[1] <= intersection_location[1] && intersection_location[1] <= (bottom_left_location[1] + size[0]) && bottom_left_location[2] <= intersection_location[2] && intersection_location[2] <= (bottom_left_location[2] + size[1]))
			is_intersecting <= 1;
		else 
			is_intersecting <= 0;
	end else if (normal[1]) begin
		intersection_location[1] <= bottom_left_location[1];
		intersection_location[0] = camera_location[0] + directional_vector[0] / directional_vector[1] * (intersection_location[1] - camera_location[1]);
		intersection_location[2] = camera_location[2] + directional_vector[2] / directional_vector[1] * (intersection_location[1] - camera_location[1]);
		if (bottom_left_location[0] <= intersection_location[0] && intersection_location[0] <= (bottom_left_location[0] + size[0]) && bottom_left_location[2] <= intersection_location[2] && intersection_location[2] <= (bottom_left_location[2] + size[1]))
			is_intersecting <= 1;
		else 
			is_intersecting <= 0;
		end else begin
			intersection_location[2] = bottom_left_location[2];
			intersection_location[0] = camera_location[0] + directional_vector[0] / directional_vector[2] * (intersection_location[2] - camera_location[2]);
			intersection_location[1] = camera_location[1] + directional_vector[1] / directional_vector[2] * (intersection_location[2] - camera_location[2]);
			if (bottom_left_location[1] <= intersection_location[1] && intersection_location[1] <= (bottom_left_location[1] + size[0]) && bottom_left_location[0] <= intersection_location[0] && intersection_location[0] <= (bottom_left_location[0] + size[1]))
				is_intersecting <= 1;
			else 
				is_intersecting <= 0;
		end

endmodule
