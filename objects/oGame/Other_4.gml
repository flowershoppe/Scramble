var _main_menu_music = global.music_main_menu;
var _game_music_1 = global.music_game;
var _emitter_MS = global.emitterMS;
var _emitter_SE = global.emitterSE;
var _player = noone;
var _cursor = noone;

if(!instance_exists(oCursor))
{
	instance_create_layer(0, 0, "Meta", oCursor);	
}

switch(room)
{        
	case rMap:
		if(!instance_exists(oLevel))
		{
			instance_create_layer(room_width * 0.25, room_height * 0.75, "UI", oLevel1);
			instance_create_layer(room_width * 0.6, room_height * 0.3, "UI", oLevel2);
		}
		break;
	case rGame:
		#region

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
		*/
		#endregion
		
		audio_stop_sound(_main_menu_music);
		
		if(!audio_is_playing(_game_music_1) and !audio_is_playing(global.music_victory))
		{
			audio_play_sound_on(_emitter_MS, _game_music_1, true, 100);
		}
	
		if(!instance_exists(oBackground))
		{
			instance_create_layer(0, 0, "Background", oBackground, {spr : spBG});
		}	
		
		break;
		
	case rMainMenu:	
		oCamera.active = false;
		YuiCursorManager.is_navigation_active = false
		if(!audio_is_playing(global.music_main_menu))
		{
			audio_stop_all();
			audio_play_sound_on(_emitter_MS, _main_menu_music, true, 100);
		}
		
		break;
}