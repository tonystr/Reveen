/// @func world_get_cell(x, y)
/// @arg x
/// @arg y

var _x = argument0;
var _y = argument1;

with (obj_world) {
	var _chunk_x = floor(_x / chunk_width);
	var _chunk_y = floor(_y / chunk_height);
	
	// log("wg_get x:", _chunk_x, _x, "y:", _chunk_y, _y);
	
	var _chunk = world_get_chunk(_chunk_x, _chunk_y);
	var _grid = _chunk[? "grid"];
	
	return _grid[# 
		_x - _chunk_x * chunk_width, 
		_y - _chunk_y * chunk_height
	];
}
