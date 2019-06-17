/// @func draw_grid(x1, y1, x2, y2, size, [color, alpha])
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg size		cell size (square)
/// @arg [color
/// @arg alpha]

var _x1	 = argument[0];
var _y1	 = argument[1]; 
var _x2	 = argument[2];
var _y2	 = argument[3];
var _siz = argument[4];
var _w	 = (_x2 - _x1) / _siz;
var _h	 = (_y2 - _y1) / _siz;
var _col = argument_count > 5 ? argument[5] : c_white;
var _alp = argument_count > 6 ? argument[6] : 1;

for (var i = 1; i < _w; i++) {
	var _lx = _x1 + i * _siz;
	draw_line_pixel(_lx, _y1 + 1, _lx, _y2, _col, _alp);
}
	
for (var i = 1; i < _h; i++) {
	var _ly = _y1 + i * _siz;
	draw_line_pixel(_x1, _ly, _x2 - 1, _ly, _col, _alp);
}