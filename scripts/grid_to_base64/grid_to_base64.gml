/// @func grid_to_base64()
/// @arg grid
/// @author Juju adams

enum DATATYPE {
	REAL,
	STRING
}

var _grid = argument0;
 
var _width  = ds_grid_width(_grid);
var _height = ds_grid_height(_grid);
 
var _buffer = buffer_create(_width * _height * 9 + 8, buffer_grow, 1);
 
buffer_write(_buffer, buffer_u32, _width);
buffer_write(_buffer, buffer_u32, _height);
 
for (var _y = 0; _y < _height; _y++) {
    for (var _x = 0; _x < _width; _x++) {
       
        var _value = _grid[# _x, _y];
       
        if (is_real(_value)) {
            buffer_write(_buffer, buffer_u8, DATATYPE.REAL);
            buffer_write(_buffer, buffer_f64, _value);
        } else if (is_string(_value)) {
            buffer_write(_buffer, buffer_u8, DATATYPE.STRING);
            buffer_write(_buffer, buffer_string, _value);
        } else {
            buffer_write(_buffer, buffer_u8, DATATYPE.REAL);
            buffer_write(_buffer, buffer_f64, 0);
        }
    }
}
 
var _string = buffer_base64_encode(_buffer, 0, buffer_tell(_buffer));
buffer_delete(_buffer);
 
return _string;