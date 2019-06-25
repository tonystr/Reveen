
var _gui_size = sprite_get_width(spr_gui_tile) - 1;
var _xoff = obj_camera.width - 32 - (obj_camera.x / (chunk_width * size)) * _gui_size;
var _yoff = 18 - (obj_camera.y / (chunk_width * size)) * _gui_size;

var _lcc = ds_list_size(chunks);
for (var i = 0; i < _lcc; i++) {
	var _chunk = chunks[| i];
	
	draw_sprite(
		spr_gui_tile, _chunk[? "modified"], 
		_xoff + _chunk[? "x"] * _gui_size, 
		_yoff + _chunk[? "y"] * _gui_size
	);
}