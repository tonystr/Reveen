/// @desc Generates a UUIDv4. Game must be randomize()d for these to be random
/// @author meseta
/// @format xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx

var _rnd = irandom(4294967295);
var _buff = buffer_create(40, buffer_fixed, 1);
// cheekily generate 40 [0-9a-f] characters
buffer_write(_buff,    buffer_text, sha1_string_unicode(string(_rnd)));
buffer_poke(_buff, 0,  buffer_u8, $34);
buffer_poke(_buff, 19, buffer_u8, choose($38, $39, $61, $62));
buffer_poke(_buff, 8,  buffer_u8, $2d);
buffer_poke(_buff, 13, buffer_u8, $2d);
buffer_poke(_buff, 18, buffer_u8, $2d);
buffer_poke(_buff, 23, buffer_u8, $2d);
// terminate string with NULL character
buffer_poke(_buff, 36, buffer_u8, 0);
// buffer_peek fails with strings
buffer_seek(_buff, buffer_seek_start, 0);
var _out = buffer_read(_buff, buffer_string);
buffer_delete(_buff);
return _out;