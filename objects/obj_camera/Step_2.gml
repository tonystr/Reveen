/// @desc follow target

if (instance_exists(target)) {
	x = lerp(x, target.x - width  / 2, .1);
	y = lerp(y, target.y - height / 2, .1);
}

// toggle fullscreen
if (keyboard_check_pressed(vk_f11) ||
	(keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter))) {
	
	fullscreen ^= 1;
	event_user(1);
}

if (drag_enabled) {
	var _ctrl = keyboard_check(vk_control);
	if (mouse_check_button_pressed(mb_middle) ||
		_ctrl && mouse_check_button_pressed(mb_left)) {
			
		drag_x = mouse_x;
		drag_y = mouse_y;
	
		drag = true;
	
	} else if (drag &&
		mouse_check_button(mb_middle) ||
		_ctrl && mouse_check_button(mb_left)) {
			
		x += drag_x - mouse_x;
		y += drag_y - mouse_y;
		
	} else drag = false;
}

camera_set_view_pos(camera, x, y);

