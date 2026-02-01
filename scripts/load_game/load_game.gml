function load_game()
{	
	if(file_exists("gamesave.save"))
	{
		audio_play_sound_on(oGame.emitter_SE, sdSelect, false, 1)
		oGame.loading = true;
		with(oPlayer) instance_destroy();
		with(oMatchManager) instance_destroy();
		with(oTile) instance_destroy();
		with(oTileHolder) instance_destroy();
		with(oPlayerHand) instance_destroy();
		with(oTilebag) instance_destroy();
		with(oCharmManager) instance_destroy();
		with(oCharm) instance_destroy();
		
		var _buffer = buffer_load("gamesave.save");
		var _string = buffer_read(_buffer, buffer_string);
		
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
		
		var _struct = _loadData[0];
		var _variables = _struct.variables; //get struct of an object from data array
		
		screenTransition(_variables.room_name, , ST_CHECKER_DIAG_UL_TO_DR_Y);	
		
		with(oSaverLoader)
		{
			alarm_set(0, 1);	
		}
	}
	else
	{
		audio_play_sound_on(oGame.emitter_SE, sdBack, false, 1);	
		screen_message("No save file", 180);
	}
}