/// @desc set fullscreen

window_set_fullscreen(fullscreen);

if (subpixels_enabled) {
	surface_resize(application_surface, window_get_width(), window_get_height());
}