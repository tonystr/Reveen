/// @description mod but with negative values also
/// @function wrap(val, min, max)
/// @arg val
/// @arg min
/// @arg max

gml_pragma("forceinline");

return argument0 - floor(argument0 / (argument2 - argument1)) * (argument2 - argument1) + argument1;