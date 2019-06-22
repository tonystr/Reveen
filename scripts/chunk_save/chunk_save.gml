/// @func chunk_save(chunk, delete*)
/// @arg chunk

var _chunk  = argument[0];
var _delete = argument[1];

if (!_chunk[? "modified"]) return;

var _file = file_text_open_write(
	obj_world.save_dir    + "/" + 
	string(_chunk[? "x"]) + "_" + 
	string(_chunk[? "y"]) + ".chunk"
);

file_text_write_string(_file, chunk_encode(_chunk));
file_text_close(_file);

if (_delete) {
	ds_grid_destroy(_chunk[? "grid"]);
	ds_map_destroy(_chunk);
}