/// @func array_max_index(array)
/// @arg array

var _array = argument0;
var _size = array_len(_array);
var _max = -9999999999;
var _maxi = -1;

for (var i = 0; i < _size; i++) {
	if (_array[i] > _max) {
		_max = _array[i];
		_maxi = i;
	}
}

return _maxi;