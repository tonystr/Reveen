/// @desc Checks for world collisions
/// @returns bool
/// @arg x
/// @arg y

var _x = x; x = argument0;
var _y = y; y = argument1;
var _size = obj_world.size;

var _out = (
	world_get_cell(floor(bbox_left  / _size), floor(bbox_top    / _size)) >= 0 ||	
	world_get_cell(floor(bbox_left  / _size), floor(bbox_bottom / _size)) >= 0 ||
	world_get_cell(floor(bbox_right / _size), floor(bbox_bottom / _size)) >= 0 ||
	world_get_cell(floor(bbox_right / _size), floor(bbox_top    / _size)) >= 0
);

x =	_x;
y =	_y;

return _out;