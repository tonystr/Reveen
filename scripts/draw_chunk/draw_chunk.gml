/// @func draw_chunk(chunk, grid_size x, y, x1, y1, x2, y2);
/// @arg chunk
/// @arg size Tilesize
/// @arg x
/// @arg y
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

var _chunk = argument0;
var _size  = argument1;
var _xoff  = argument2 - floor(obj_camera.x);
var _yoff  = argument3 - floor(obj_camera.y);
var _x1    = argument4;
var _y1    = argument5;
var _x2    = argument6;
var _y2    = argument7;

var _grid = _chunk[? "grid"];

// var _width  = ds_grid_width(_grid);
// var _height = ds_grid_height(_grid);
   
// var _maxy = ds_grid_height(_grid);
// var _maxx = ds_grid_width(_grid);

for (var _y = _y1; _y < _y2; _y++) {
	for (var _x = _x1; _x < _x2; _x++) {
		var _cell = _grid[# _x, _y];
		if (_cell >= 0) draw_sprite(
			_cell & $fff, 
			_cell >> 12, 
			_xoff + _x * _size, 
			_yoff + _y * _size
		);
	}	
}