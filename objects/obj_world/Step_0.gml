
var _mbp = mouse_check_button(mb_left) + mouse_check_button(mb_right) * 2;

if (_mbp) {
	var _mgx = floor(mouse_x / size);
	var _mgy = floor(mouse_y / size);
	
	world_set_cell(_mgx, _mgy, _mbp == 1 ? spr_tile : -1);
}