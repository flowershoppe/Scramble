//Default Font
globalvar tile_font_size;
tile_font_size = 50;
globalvar tile_font;
tile_font = font_add("CALADEA-REGULAR.TTF", tile_font_size, 
					false, false, tile_font_size, tile_font_size);
font_enable_sdf(tile_font, true);
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
globalvar maincam;
maincam = view_camera[0];
globalvar board_sprite;
board_sprite = spr_board;

//Sounds
globalvar place_sounds;
place_sounds = [snd_place_1, snd_place_2, snd_place_3, snd_place_4, snd_place_5, snd_place_6];

//create game handlers
instance_create_layer(0, 0, "Meta", obj_player);
instance_create_layer(0, 0, "Meta", obj_scorekeeper);
instance_create_layer(0, 0, "Meta", obj_board);
instance_create_layer(0, 0, "Meta", obj_camera_new);
instance_create_layer(0, 0, "Hand", obj_playerhand);
instance_create_layer(0, 0, "Background", obj_background);