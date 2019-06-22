/// @func world_set_cell(x, y, value)
/// @arg x
/// @arg y
/// @arg value

var _ix = argument0;
var _iy = argument1;

with (obj_world) {
	var _chunk_x = floor(_ix / chunk_width);
	var _chunk_y = floor(_iy / chunk_height);
	var _xs = _ix - 1;
	var _ys = _iy - 1;
	
	var _chunk = world_get_chunk(_chunk_x, _chunk_y);
	_chunk[? "modified"] = true;
	
	var _grid = _chunk[? "grid"];
	
	_grid[# 
		_ix - _chunk_x * chunk_width, 
		_iy - _chunk_y * chunk_height
	] = argument2;
	log("set grid val to:", argument2);
	
	for (var i = 0; i < 9; i++) {
		var _x = _xs + i  %  3;
		var _y = _ys + i div 3;
		
		var _cell = world_get_cell(_x, _y);
		if (_cell < 0) continue;
		
		world_set_cell_direct(_x, _y, (_cell & $fff) + (
			(world_get_cell(_x + 1, _y) < 0) * 1 +
			(world_get_cell(_x, _y - 1) < 0) * 2 +
			(world_get_cell(_x - 1, _y) < 0) * 4 +
			(world_get_cell(_x, _y + 1) < 0) * 8
		) * $1000);
	}
}
