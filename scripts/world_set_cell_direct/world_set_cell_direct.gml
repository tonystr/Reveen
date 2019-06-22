/// @func world_set_cell_direct(x, y, value)
/// @arg x
/// @arg y
/// @arg value

var _ix = argument0;
var _iy = argument1;

with (obj_world) {
	var _chunk_x = floor(_ix / chunk_width);
	var _chunk_y = floor(_iy / chunk_height);
	
	var _chunk = world_get_chunk(_chunk_x, _chunk_y);
	var _grid = _chunk[? "grid"];
	_grid[# 
		_ix - _chunk_x * chunk_width,
		_iy - _chunk_y * chunk_height
	] = argument2;
}