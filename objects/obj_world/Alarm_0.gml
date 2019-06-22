/// @desc Unload chunks OOB

var _lcc = ds_list_size(chunks);
if (_lcc >= chunk_minload) {
	var _cam_right	= obj_camera.x + obj_camera.width;
	var _cam_top	= obj_camera.y;
	var _cam_left	= obj_camera.x;
	var _cam_bottom	= obj_camera.y + obj_camera.height;

	_cam_right	=  ceil(_cam_right	/ (chunk_width  * size));
	_cam_top	= floor(_cam_top	/ (chunk_height * size));
	_cam_left	= floor(_cam_left	/ (chunk_width  * size));
	_cam_bottom	=  ceil(_cam_bottom	/ (chunk_height * size));

	for (var i = 0; i < _lcc; i++) {
		var _chunk = chunks[| i];
		var _x = _chunk[? "x"];
		var _y = _chunk[? "y"];
	
		if ((_lcc >= chunk_maxload && (_x < _cam_left || _y < _cam_top || _x > _cam_right || _y > _cam_bottom)) || 
			_x < _cam_left - 1 || _y < _cam_top - 1 || _x > _cam_right + 1 || _y > _cam_bottom + 1) {
			chunk_save(_chunk);
			ds_list_delete(chunks, i--);
			log("Unloaded chunk x:", _x, "y:", _y, "i:", i);
			_lcc--;
		} 
	}
}

alarm[0] = chunk_update_interval;