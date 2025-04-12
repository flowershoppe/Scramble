randomize();
dialogue_setup();

//Instance
global.previous_room = -1;

//Dictionaries
global.dictionary = new CheckWordDictionary(working_directory + "dictionaries/full/full.txt");
global.dictionary_food = new CheckWordDictionary(working_directory + "dictionaries/food.txt");

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

global.vowels = ["A", "E", "I", "O", "U"];
global.consonants = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"];

//Default Font
global.tile_font_size = 40;
global.tile_font_color = c_black;
global.tile_font = font_add("CALADEA-REGULAR.TTF", global.tile_font_size, 
					false, false, global.tile_font_size, global.tile_font_size);
font_enable_sdf(global.tile_font, true);

//Settings
global.camera_speed = 5.0;
global.zoom_factor = 0.1;
global.display_width = 960;
global.display_height = 540;
global.min_zoom = 540;
global.max_zoom = room_height;
global.maincam = view_camera[0];
global.board_sprite = spBoard;

//Sounds
global.place_sounds = [sdPlace1, sdPlace2, sdPlace3, sdPlace4, sdPlace5, sdPlace6];
global.emitterSE = audio_emitter_create();
global.emitterMS = audio_emitter_create();
global.volumeMain = 1;
global.volumeSE = 1;
global.volumeMS = 1;

audio_emitter_gain(global.emitterSE, global.volumeSE);
audio_emitter_gain(global.emitterMS, global.volumeMS);

global.music_game = msGameMusic1;
global.music_main_menu = msMainMenuMusic;
global.music_victory = msVictory;

//Handlers
instance_create_layer(0, 0, "Meta", oSaverLoader);
instance_create_layer(room_width / 2, room_height / 2, "Meta", oCamera,
{active : false});

global.exchanging = false;

//YUI Structs
#region
global.stMainMenu = 
{
	yui_file: "YUI/main_menu.yui",
	data_context: oMainMenu,
	is_full_screen: false,
	image_xscale: 4,
	image_yscale: 4.5,
	x: 352,
	y: 224
}
global.stPauseMenu =
{
	data_context: oPauseMenu,
	yui_file: "YUI/pause_menu.yui"	
}
global.stMatchStats =
{
	data_context : oMatchManager,
	yui_file : "YUI screens/match_stats.yui",
	is_full_screen : false,
	image_xscale : 3.2,
	image_yscale : 5,
	x : 755,
	y : 64
}
global.stMatchButtons = 
{
	data_context : oMatchGUI,
	yui_file : "YUI screens/match_buttons.yui",
	is_full_screen : false,
	image_xscale : 3.2,
	image_yscale : 2.609,
	x : 755,
	y : 384
}
global.stCharms = 
{
	data_context : oCharmManager,
	yui_file : "YUI screens/charms.yui",
	is_full_screen : false,
	image_xscale : 2.5,
	image_yscale : 4.5,
	x : 0,
	y : 64,
}
#endregion

//Charms
global.charms = [
oTClef,
oSpade];

//Opponents
//multiple tiers
opponents_1 = [oCress];
opponents_2 = [oWiz];


receiver = new Receiver();