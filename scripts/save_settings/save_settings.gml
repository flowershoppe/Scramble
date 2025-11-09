function save_settings()
{
	//save settings
	var _saveData = 
	{
		window_width : window_get_width(),
		window_height : window_get_height(),
		volume_MS : global.volumeMS,
		volume_SE : global.volumeSE,
		volume_Main : global.volumeMain,
		font : oGame.font
	};
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