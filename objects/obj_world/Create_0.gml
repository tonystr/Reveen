
size = 8;
seed = 3217863871293;

chunks = ds_list_create();
chunk_minload = 2;
chunk_maxload = 6; // 9
chunk_width  = 64;
chunk_height = 64;
chunk_update_interval = room_speed * 5;
alarm[0] = chunk_update_interval;

surface = -1;

save_dir = "chunks";
if (!directory_exists(save_dir)) directory_create(save_dir);
log("save_dir:", working_directory + "/" + save_dir);