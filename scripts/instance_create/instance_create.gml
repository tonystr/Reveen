/// @func instance_create(object, [x, y])
/// @arg object
/// @arg [x
/// @arg y]

gml_pragma("forceinline");

var _y = argument_count > 2 ? argument[2] : 0;
return instance_create_depth(argument_count > 1 ? argument[1] : 0, _y, -_y, argument[0]);