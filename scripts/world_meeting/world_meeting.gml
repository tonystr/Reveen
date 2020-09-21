/// @desc Checks for world collisions
/// @returns bool
/// @arg x
/// @arg y

var _start_x = x; x = argument0;
var _start_y = y; y = argument1;
var _size = obj_world.size;

var _right	= floor(bbox_right  / _size);
var _top	= floor(bbox_top	/ _size);
var _left	= floor(bbox_left	/ _size);
var _bottom	= floor(bbox_bottom / _size);

var _out = false;

for (var _x = _left; _x <= _right; _x++) {
	if (world_get_cell(_x, _top) || world_get_cell(_x, _bottom)) {
		_out = true;
		break;	
	}
}

if (!_out) {
	for (var _y = _top; _y <= _bottom; _y++) {
		if (world_get_cell(_left,  _y) || world_get_cell(_right, _y)) {
			_out = true;
			break;	
		}
	}
}

x =	_start_x;
y =	_start_y;

return _out;