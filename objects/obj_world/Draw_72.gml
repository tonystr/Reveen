var _cam_right	= floor(obj_camera.x + obj_camera.width);
var _cam_top	= floor(obj_camera.y);
var _cam_left	= floor(obj_camera.x);
var _cam_bottom	= floor(obj_camera.y + obj_camera.height);

var _chunk_right	= floor(_cam_right	/ (chunk_width  * size));
var _chunk_top		= floor(_cam_top	/ (chunk_height * size));
var _chunk_left		= floor(_cam_left	/ (chunk_width  * size));
var _chunk_bottom	= floor(_cam_bottom	/ (chunk_height * size));

surface = surface_clear_set(
	surface,
	obj_camera.width  + 1, 
	obj_camera.height + 1,
	c_white, 0
);

for (var _y = _chunk_top; _y <= _chunk_bottom; _y++) {
	for (var _x = _chunk_left; _x <= _chunk_right; _x++) {
		var _chunk = world_get_chunk(_x, _y);
		var _rmx = _x * chunk_width  * size;
		var _rmy = _y * chunk_height * size;
		
		draw_chunk(
			_chunk, size, _rmx, _rmy,
			max(floor((_cam_left   - _rmx) / size),     0), 
			max(floor((_cam_top	   - _rmy) / size),     0), 
			min(floor((_cam_right  - _rmx) / size) + 1, chunk_width), 
			min(floor((_cam_bottom - _rmy) / size) + 1, chunk_height)
		);
	}
}

surface_reset_target();

draw_surface(surface, _cam_left, _cam_top);