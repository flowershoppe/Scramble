var _main_menu_music = global.music_main_menu;
var _game_music_1 = global.music_game;
var _emitter_MS = global.emitterMS;
var _emitter_SE = global.emitterSE;
var _player = noone;
var _cursor = noone;



switch(room)
{
	case rGame:
		
		global.opponent = "TheWiz";
		dialogue_open(dWizMatchIntro, []);
		audio_stop_sound(_main_menu_music);
		
		if(!audio_is_playing(_game_music_1) and !audio_is_playing(global.music_victory))
		{
			audio_play_sound_on(_emitter_MS, _game_music_1, true, 100);
		}
	
		//create game handlers
		if(!instance_exists(oCamera))
		{
			instance_create_layer(room_width / 2, room_height / 2, "Meta", oCamera);
		}
		if(!instance_exists(oBackground))
		{
			instance_create_layer(0, 0, "Background", oBackground);
		}
		
		
		

		
		
		break;
		
	case rMainMenu:
		
		if(!audio_is_playing(global.music_main_menu))
		{
			audio_play_sound_on(_emitter_MS, _main_menu_music, true, 100);
		}
		
		break;
}