/// @func instance_place_list_any(x, y, objects[], list, [ordered])
/// @arg x
/// @arg y
/// @arg objects[]
/// @arg list
/// @arg [ordered]

var _x = argument[0];
var _y = argument[1];
var _obj = argument[2];
var _lis = argument[3];
var _ord = argument_count > 4 && argument[4];
var _len = array_len(_obj);

for (var i = 0; i < _len; i++) {
	var _ilist = ds_list_create(); 
	instance_place_list(_x, _y, _obj[i], _ilist, _ord);
	ds_list_merge(_lis, _ilist, true);
}

return _lis;