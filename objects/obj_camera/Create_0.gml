
singleton_assert();

subpixels_enabled = true;
drag_enabled = false;

width = 480;
height = 270;
zoom = 3;

#region camera setup

camera = camera_create();

view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera;

camera_set_view_size(camera, width, height);
window_set_size(width * zoom, height * zoom);
surface_resize(
	application_surface, 
	subpixels_enabled ? width  * zoom : width, 
	subpixels_enabled ? height * zoom : height
);
display_set_gui_size(width, height);

event_user(0);

#endregion;

target = noone;

drag = false;
drag_x = 0;
drag_y = 0;

fullscreen = false;
