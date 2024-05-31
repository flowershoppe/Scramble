var _main_menu_music = global.music_main_menu;
var _game_music_1 = global.music_game;
var _emitter_MS = global.emitterMS;
var _emitter_SE = global.emitterSE;




switch(room)
{
	case rGame:
	
		
		audio_stop_sound(_main_menu_music);
		audio_play_sound_on(_emitter_MS, _game_music_1, 100, true);
	
		//create game handlers

		instance_create_layer(0, 0, "Board", oBoard);
		instance_create_layer(room_width / 2, room_height / 2, "Meta", oCamera);
		instance_create_layer(0, 0, "Background", oBackground);
		instance_create_layer(room_width * 0.9, room_height * 0.75, "UI", oButton);
	
		//initialize player
		var _player = instance_create_layer(0, 0, "Meta", oPlayer);
		var _cursor = instance_create_layer(0, 0, "Meta", oCursor);
	
		_cursor.owner = _player;
	
		//initialize tilebag
		global.tilebag = instance_create_layer(room_width / 6, room_height /2 , "Tilebag", oTilebag);
	
	
		break;
		
	case rMainMenu:
	
		audio_play_sound_on(_emitter_MS, _main_menu_music, true, 100);
}