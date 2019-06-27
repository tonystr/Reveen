
var _s = keyboard_check(vk_shift);

xvel = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * (_s ? 5 : 3) - xvel * .2;

yvel = yvel * .9 + keyboard_check_pressed(ord("W")) * -7 + .24;

#region Horizontal movement

if (world_meeting(x + xvel, y)) {
	var _sgn = sign(xvel);
	while (!world_meeting(x + _sgn, y)) {
		x += _sgn;
	}
	xvel = 0;
}

x += xvel;

#endregion;

#region Vertical movement

if (world_meeting(x, y + yvel)) {
	var _sgn = sign(yvel);
	while (!world_meeting(x, y + _sgn)) {
		y += _sgn;
	}
	yvel = 0;
}

y += yvel;

#endregion;