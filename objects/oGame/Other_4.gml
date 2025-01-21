var _main_menu_music = global.music_main_menu;
var _game_music_1 = global.music_game;
var _emitter_MS = global.emitterMS;
var _emitter_SE = global.emitterSE;
var _player = noone;
var _cursor = noone;


switch(room)
{              
	case rGame:
	
		/*
		//-----YUI ELEMENTS-----
		#region
		var _isYUI = false;
		with(yui_document)
		{
			if(yui_file	== "YUI screens/match_stats.yui")
			{
				_isYUI = true;
			}
		}
		//if there is no YUI element
		if(!_isYUI)
		{
			instance_create_layer(0, 96, "UI", yui_document,
			{
				image_xscale: 3,
				image_yscale: 4,
				yui_file: "YUI screens/match_stats.yui",
				data_context: oMatchManager,
				is_full_screen: false
			});
		}
		
		_isYUI = false;
		with(yui_document)
		{
			if(yui_file	== "YUI screens/match_buttons.yui")
			{
				_isYUI = true;
			}
		}
		//if there is no YUI element
		if(!_isYUI)
		{
			instance_create_layer(750, 400, "UI", yui_document,
			{
				image_xscale: 3,
				image_yscale: 4,
				yui_file: "YUI screens/match_buttons.yui",
				data_context: oMatchGUI,
				is_full_screen: false
			}); 	
		}
		#endregion
		*/
		room_persistent = true;
		
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
		YuiCursorManager.is_navigation_active = false
		if(!audio_is_playing(global.music_main_menu))
		{
			audio_play_sound_on(_emitter_MS, _main_menu_music, true, 100);
		}
		
		break;
}