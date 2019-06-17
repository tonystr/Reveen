/// @func xorshiftalt(seed, num)
/// @arg seed
/// @arg num

var _seed = argument0;
var _num  = argument1;

// s, t = state[3];
_num ^= _num << 11;
_num ^= _num >> 8;
// state[3] = state[2]; state[2] = state[1]; state[1] = _seed = state[0];
_num ^= _seed;
_num ^= _seed >> 19;	
// state[0] = _num;
return _num;