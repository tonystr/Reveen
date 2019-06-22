// @desc Encodes a chunk
// @arg chunk

var _chunk = argument0;
var _grid  = _chunk[? "grid"];

var _width  = obj_world.chunk_width;
var _height = obj_world.chunk_height;
 
var _buffer = buffer_create(_width * _height * 9 + 8, buffer_grow, 1);
 
buffer_write(_buffer, buffer_u32, _width);
buffer_write(_buffer, buffer_u32, _height);
 
for (var _y = 0; _y < _height; _y++) {
    for (var _x = 0; _x < _width; _x++) {
       
        var _value = _grid[# _x, _y];
       
        buffer_write(_buffer, buffer_u8, DATATYPE.REAL);
        buffer_write(_buffer, buffer_f64, _value >= 0 ? _value & $fff : _value);
    }
}
 
var _string = buffer_base64_encode(_buffer, 0, buffer_tell(_buffer));
buffer_delete(_buffer);

_chunk[? "grid"] = _string;
ds_map_delete(_chunk, "modified");
var _out = json_encode(_chunk);

_chunk[? "grid"] = _grid;
_chunk[? "modified"] = false;

return _out;