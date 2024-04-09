//Default Font
globalvar tile_font_size;
tile_font_size = 50;
globalvar tile_font;
tile_font = font_add("CALADEA-REGULAR.TTF", tile_font_size, 
					false, false, tile_font_size, tile_font_size);
//room_goto(Room1);

//Keybinds
globalvar left_button;
left_button = vk_left;
globalvar right_button;
right_button = vk_right;
globalvar down_button;
down_button = vk_down;
globalvar up_button;
up_button = vk_up;
globalvar zoom_in;
zoom_in = ev_mouse_wheel_up;
globalvar zoom_out;
zoom_out = ev_mouse_wheel_down;

//Settings
globalvar camera_speed;
camera_speed = 5.0;
globalvar zoom_factor;
zoom_factor = 0.1;
globalvar display_width;
display_width = 960;
globalvar display_height;
display_height = 540;
globalvar min_zoom;
min_zoom = 256;
globalvar max_zoom;
max_zoom = room_height;