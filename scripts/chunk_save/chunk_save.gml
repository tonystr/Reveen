/// @func chunk_save(chunk)
/// @arg chunk

var _chunk = argument0;

if (!_chunk[? "modified"]) return;

var _grid = _chunk[? "grid"];
_chunk[? "grid"] = grid_to_base64(_grid);
ds_map_delete(_chunk, "modified");
var _out = json_encode(_chunk);
_chunk[? "grid"] = _grid;
_chunk[? "modified"] = false;

var _file = file_text_open_write(
	obj_world.save_dir    + "/" + 
	string(_chunk[? "x"]) + "_" + 
	string(_chunk[? "y"]) + ".chunk"
);

file_text_write_string(_file, _out);
file_text_close(_file);
log("Wrote:", _out);