/// @func base64_to_grid()
/// @arg string
/// @author Juju adams

var _string = argument0;
 
var _buffer = buffer_base64_decode(_string);
 
var _width  = buffer_read(_buffer, buffer_u32);
var _height = buffer_read(_buffer, buffer_u32);
var _grid = ds_grid_create(_width, _height);
 
for (var _y = 0; _y < _height; _y++) {
    for (var _x = 0; _x < _width; _x++) {
       
        var _datatype = buffer_read(_buffer, buffer_u8);
        switch (_datatype) {
            case DATATYPE.REAL:
                _grid[# _x, _y] = buffer_read(_buffer, buffer_f64);
            break;
            case DATATYPE.STRING:
                _grid[# _x, _y] = buffer_read(_buffer, buffer_string);
            break;
            default:
                _grid[# _x, _y] = 0;
            break;
        }
    }
}
 
buffer_delete(_buffer);
 
return _grid;