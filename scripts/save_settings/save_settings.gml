function save_settings()
{
	var _save = ssave_get(ssave_config_save_file);
	
	_save.set("volumeMain", audio_get_master_gain(0));
	_save.set("volumeSE", audio_emitter_get_gain(global.emitterSE));
	_save.set("volumeMS", audio_emitter_get_gain(global.emitterMS));
	
	_save.save();
	
	show_debug_message("saved to" + game_save_id);
	
	var _string = input_player_export(0, true);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "keybinds.save");
	buffer_delete(_buffer);

}