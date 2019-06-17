/// @func array_find_index(array, value)
/// @arg array
/// @arg value

var _array = argument0;
var _size = array_len(_array);
var _val = argument1;

for (var i = 0; i < _size; i++) {
	if (_array[i] == _val) {
		return i;
	}
}

return -1;