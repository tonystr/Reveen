/// @func draw_text_col_ext(x, y, string, color, alpha, [xscale, yscale, angle])
/// @arg x
/// @arg y
/// @arg string
/// @arg color
/// @arg alpha
/// @arg [xscale
/// @arg yscale
/// @arg angle]

gml_pragma("forceinline");

draw_text_transformed_color(
	argument[0], argument[1], 
	argument[2],
	argument_count > 5 ? argument[5] : 1, 
	argument_count > 6 ? argument[6] : 1,
	argument_count > 7 ? argument[7] : 0,
	argument[3], argument[3], argument[3], argument[3],
	argument_count > 4 ? argument[4] : 1);