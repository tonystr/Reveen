/// @func array_has(array, value)
/// @arg array
/// @arg value

var _arr = argument0;
var _val = argument1;
var _len = array_len(_arr);

for (var i = 0; i < _len; i++) {
	if (_arr[i] == _val) return true;
}

return false;