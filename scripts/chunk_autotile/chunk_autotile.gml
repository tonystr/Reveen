/// @desc Autotiles all cells of a chunk, and adjacent chunks
/// @arg chunk

var _chunk = argument0;

var _grid	 = _chunk[? "grid"];
var _chunk_x = _chunk[? "x"];
var _chunk_y = _chunk[? "y"];

log("Tiling chunk x:", _chunk_x, "y:", _chunk_y);

with (obj_world) {
	
	#region Find adjacent chunks

	var _cr = -1;
	var _ct = -1;
	var _cl = -1;
	var _cb = -1;

	var _len = ds_list_size(chunks);
	for (var i = 0; i < _len; i++) {
		var _ci  = chunks[| i];
		var _cig = _ci[? "grid"];
		var _cix = _ci[? "x"];
		var _ciy = _ci[? "y"];
		
		if (_ciy == _chunk_y) {
			_cl = _cix == _chunk_x - 1 ? _cig : -1;
			_cr = _cix == _chunk_x + 1 ? _cig : -1;
		} else if (_cix == _chunk_x) {
			_ct = _ciy == _chunk_y - 1 ? _cig : -1;
			_cb = _ciy == _chunk_y + 1 ? _cig : -1;
		}
	}

	#endregion;

	for (var _y = 1; _y < chunk_height - 1; _y++) {
		for (var _x = 1; _x < chunk_width - 1; _x++) {
			if (_grid[# _x, _y] >= 0) _grid[# _x, _y] |= $1000 * (
				(_grid[# _x + 1, _y] < 0) * 1 +
				(_grid[# _x, _y - 1] < 0) * 2 +
				(_grid[# _x - 1, _y] < 0) * 4 +
				(_grid[# _x, _y + 1] < 0) * 8
			);
		}
	}
	
	if (_cl >= 0 || _cr >= 0) {
		for (var _y = 0; _y < chunk_height; _y++) {
			if (_cl >= 0) {
				if (_grid[# 0, _y] >= 0) _grid[# 0, _y] |= $1000 * (
					(						  _grid[# 1,			   _y	 ] < 0) * 1 +
					(_y > 0				   && _grid[# 0,			   _y - 1] < 0) * 2 +
					(						    _cl[# chunk_width - 1, _y	 ] < 0) * 4 +
					(_y < chunk_height - 1 && _grid[# 0,			   _y + 1] < 0) * 8
				);
				
				if (_cl[# chunk_width - 1, _y] >= 0) _cl[# chunk_width - 1, _y] |= $1000 * (
					(						_grid[# 0,			     _y	   ] < 0) * 1 +
					(_y > 0				   && _cl[# chunk_width - 1, _y - 1] < 0) * 2 +
					(						  _cl[# chunk_width - 2, _y	   ] < 0) * 4 +
					(_y < chunk_height - 1 && _cl[# chunk_width - 1, _y + 1] < 0) * 8
				);
			}
			
			if (_cr >= 0) {
				if (_grid[# chunk_width - 1, _y] >= 0) _grid[# chunk_width - 1, _y] |= $1000 * (
					(							_cr[# 0,			   _y	 ] < 0) * 1 +
					(_y > 0				   && _grid[# chunk_width - 1, _y - 1] < 0) * 2 +
					(						  _grid[# chunk_width - 2, _y	 ] < 0) * 4 +
					(_y < chunk_height - 1 && _grid[# chunk_width - 1, _y + 1] < 0) * 8
				);
				
				if (_cr[# 0, _y] >= 0) _cr[# 0, _y] |= $1000 * (
					(						  _cr[# 1,			     _y	   ] < 0) * 1 +
					(_y > 0				   && _cr[# 0,			     _y - 1] < 0) * 2 +
					(					    _grid[# chunk_width - 1, _y	   ] < 0) * 4 +
					(_y < chunk_height - 1 && _cr[# 0,			     _y + 1] < 0) * 8
				);
			}
		}
	}
	
	if (_ct >= 0 || _cb >= 0) {
		for (var _x = 0; _x < chunk_width; _x++) {
			if (_ct >= 0) {
				if (_grid[# _x, 0] >= 0) _grid[# _x, 0] |= $1000 * (
					(_x < chunk_width - 1 && _grid[# _x + 1, 0				 ] < 0) * 1 +
					(						   _ct[# _x,	 chunk_height - 1] < 0) * 2 +
					(_x > 0				  && _grid[# _x - 1, 0				 ] < 0) * 4 +
					(						 _grid[# _x,	 1				 ] < 0) * 8
				);
				
				if (_ct[# _x, chunk_height - 1] != 0) _ct[# _x, chunk_height - 1] |= $1000 * (
					(_x < chunk_width - 1 && _ct[# _x + 1, chunk_height - 1] < 0) * 1 +
					(						 _ct[# _x,	   chunk_height - 2] < 0) * 2 +
					(_x > 0				  && _ct[# _x - 1, chunk_height - 1] < 0) * 4 +
					(					   _grid[# _x,	   0			   ] < 0) * 8
				);
			}
			
			if (_cb >= 0) {
				if (_grid[# _x, chunk_height - 1] != 0) _grid[# _x, chunk_height - 1] |= $1000 * (
					(_x < chunk_width - 1 && _grid[# _x + 1, chunk_height - 1] < 0) * 1 +
					(						 _grid[# _x,	 chunk_height - 2] < 0) * 2 +
					(_x > 0				  && _grid[# _x - 1, chunk_height - 1] < 0) * 4 +
					(						   _cb[# _x,	 0				 ] < 0) * 8
				);
				
				if (_cb[# _x, 0] >= 0) _cb[# _x, 0] |= $1000 * (
					(_x < chunk_width - 1 && _cb[# _x + 1, 0			   ] < 0) * 1 +
					(					   _grid[# _x,	   chunk_height - 1] < 0) * 2 +
					(_x > 0				  && _cb[# _x - 1, 0			   ] < 0) * 4 +
					(						 _cb[# _x,	   1			   ] < 0) * 8
				);
			}
		}
	}
}