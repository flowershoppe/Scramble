function save_settings()
{
	//save settings
	var _saveData = 
	{
		window_width : oSettings.window_width,
		window_height : oSettings.window_height,
		volume_MS : audio_emitter_get_gain(global.emitterMS),
		volume_SE : audio_emitter_get_gain(global.emitterSE),
		volume_Main : audio_get_master_gain(0),
		font : oGame.font,
		play_dialogue : oSettings.play_dialogue,
		isfullscreen : oSettings.isfullscreen
	};
	var a = audio_get_master_gain(0);
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);

	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "settings.save");
	buffer_delete(_buffer);
	
	//save keybinds
	var _string = input_player_export(0, true);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "keybinds.save");
	buffer_delete(_buffer);

	show_debug_message("Settings saved");
}