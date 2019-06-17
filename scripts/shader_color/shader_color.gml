/// @func shader_color(color[, alpha]);
/// @arg color
/// @arg alpha

gml_pragma("forceinline");

if (argument_count > 1) {
	return [color_get_red(argument[0]) / 255, 
			color_get_green(argument[0]) / 255,
			color_get_blue(argument[0]) / 255, 
			argument[1]];
} else {
	return [color_get_red(argument[0]) / 255,  
			color_get_green(argument[0]) / 255,
			color_get_blue(argument[0]) / 255];
}