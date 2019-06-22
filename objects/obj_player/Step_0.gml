
var _s = keyboard_check(vk_shift);

x += (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * (_s ? 3 : 1);
y += (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * (_s ? 3 : 1);