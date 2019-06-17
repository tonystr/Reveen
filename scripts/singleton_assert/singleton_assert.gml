/// @func singleton_assert([obj])
/// @args [obj]

var _obj = argument_count > 0 ? argument[0] : object_index;
var _num = instance_number(_obj);

if (_num == 0) {
	return instance_create(_obj);
} else {
	while (_num > 1) instance_destroy(instance_find(_obj, --_num));
	return _obj.id;
}