randomize();

//Dictionary
global.dictionary = new CheckWordDictionary(working_directory + "dictionaries/full/full.txt");

//Letters and Default Values
global.letters = ds_map_create();
#region
ds_map_add(global.letters, "A", 1);
ds_map_add(global.letters, "B", 3);
ds_map_add(global.letters, "C", 3);
ds_map_add(global.letters, "D", 2);
ds_map_add(global.letters, "E", 1);
ds_map_add(global.letters, "F", 4);
ds_map_add(global.letters, "G", 2);
ds_map_add(global.letters, "H", 4);
ds_map_add(global.letters, "I", 1);
ds_map_add(global.letters, "J", 8);
ds_map_add(global.letters, "K", 5);
ds_map_add(global.letters, "L", 1);
ds_map_add(global.letters, "M", 3);
ds_map_add(global.letters, "N", 1);
ds_map_add(global.letters, "O", 1);
ds_map_add(global.letters, "P", 3);
ds_map_add(global.letters, "Q", 10);
ds_map_add(global.letters, "R", 1);
ds_map_add(global.letters, "S", 1);
ds_map_add(global.letters, "T", 1);
ds_map_add(global.letters, "U", 1);
ds_map_add(global.letters, "V", 4);
ds_map_add(global.letters, "W", 4);
ds_map_add(global.letters, "X", 8);
ds_map_add(global.letters, "Y", 4);
ds_map_add(global.letters, "Z", 10);
ds_map_add(global.letters, "_", 0);
#endregion

//Default Font
global.tile_font_size = 40;
global.tile_font_color = c_black;
global.tile_font = font_add("CALADEA-REGULAR.TTF", global.tile_font_size, 
					false, false, global.tile_font_size, global.tile_font_size);
font_enable_sdf(global.tile_font, true);
//room_goto(Room1);

global.players = [];
global.active_player = noone;
global.tilebag = instance_create_layer(300, 500, "Tilebag", obj_tilebag);

//Keybinds
global.left_button = vk_left;
global.right_button = vk_right;
global.down_button = vk_down;
global.up_button = vk_up;
global.zoom_in = ev_mouse_wheel_up;
global.zoom_out = ev_mouse_wheel_down;

//Settings
global.hotseat = false;
global.camera_speed = 5.0;
global.zoom_factor = 0.1;
global.display_width = 960;
global.display_height = 540;
global.min_zoom = 540;
global.max_zoom = room_height;
global.maincam = view_camera[0];
global.board_sprite = spr_board;

//Sounds
global.place_sounds = [snd_place_1, snd_place_2, snd_place_3, snd_place_4, snd_place_5, snd_place_6];

//create game handlers

instance_create_layer(0, 0, "Meta", obj_scorekeeper);
instance_create_layer(0, 0, "Board", obj_board);
instance_create_layer(room_width / 2, room_height / 2, "Meta", obj_camera);
instance_create_layer(0, 0, "Background", obj_background);
instance_create_layer(room_width * 0.9, room_height * 0.75, "UI", obj_button);
var _UI = instance_create_layer(0, 0, "UI", ui_players);
var _player = instance_create_layer(0, 0, "Meta", obj_player);
var _cursor = instance_create_layer(0, 0, "Meta", obj_cursor);
_cursor.owner = _player;
_UI.owner = _player;
global.active_player = _player;
global.players = [_player];

