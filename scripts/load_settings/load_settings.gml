function load_settings()
{
	var _save = ssave_get(ssave_config_save_file);
	
	audio_master_gain(_save.get("volumeMain", 1));
	audio_emitter_gain(global.emitterSE, _save.get("volumeSE", 1));
	audio_emitter_gain(global.emitterMS, _save.get("volumeMS", 1));
	
	if(file_exists("keybinds.save"))
	{
		var _buffer = buffer_load("keybinds.save");
		var _string = buffer_read(_buffer, buffer_string);
		
		input_player_import(_string);
		
		buffer_delete(_buffer);
		
		show_debug_message("loading keybinds.save");
	}
	
	
}