if(!instance_exists(oCursor))
{
	instance_create_layer(0, 0, "Meta", oCursor);	
}

//music
switch(room)
{        		
	case rMainMenu:	
		oCamera.active = false;
		YuiCursorManager.is_navigation_active = false
		if(!audio_is_playing(global.music_main_menu))
		{
			audio_stop_sound(global.music);
			global.music = global.music_main_menu;
			audio_play_sound_on(oGame.emitter_MS, global.music_main_menu, true, 100);
		}
		
		break;
}