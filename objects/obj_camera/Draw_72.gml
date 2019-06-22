
var _height = 160;

draw_sprite(spr_mountain_bg, 0, x, y);
draw_sprite(
	spr_mountain_mountain_far, 0, 
	x - wrap(x * .02, 0, width) + width,
	-y * .02 - _height
);
draw_sprite(
	spr_mountain_mountain_far, 0, 
	x - wrap(x * .02, 0, width),
	-y * .02 - _height
);
draw_sprite(
	spr_mountain_mountains, 0, 
	x - wrap(x * .03, 0, width),
	-y * .03 - _height
);
draw_sprite(
	spr_mountain_trees, 0, 
	x - wrap(x * .06, 0, width),
	-y * .06 - _height
);
draw_sprite(
	spr_mountain_foreground_trees, 0, 
	x - wrap(x * .1, 0, width),
	-y * .1 - _height
);