/// @func world_get_chunk
/// @arg x,y

var _x = argument0;
var _y = argument1;
var _lcs = obj_world.chunks;
var _lcc = ds_list_size(_lcs);

for (var i = 0; i < _lcc; i++) {
	var _chunk = _lcs[| i];
	if (_chunk[? "x"] == _x && _chunk[? "y"] == _y) {
		return _chunk;	
	}
}

return chunk_load(_x, _y);