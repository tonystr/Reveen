/// @func xorshift32(state)
/// @arg state

var _x = argument0;
_x ^= _x << 13;
_x ^= _x >> 17;
_x ^= _x << 5;
return _x;