function load_settings()
{
	if(file_exists("settings.save"))
	{		
		var _buffer = buffer_load("settings.save");
		var _string = buffer_read(_buffer, buffer_string);
		var _loadData = json_parse(_string);
		
		global.volumeMain = _loadData.volume_Main;
		global.volumeMS = _loadData.volume_MS;
		global.volumeSE = _loadData.volume_SE;	
		audio_emitter_gain(global.emitterSE, global.volumeSE);
		audio_emitter_gain(global.emitterMS, global.volumeMS);
		audio_emitter_gain(global.emitterMain, global.volumeMain);
		
		oSettings.window_width = _loadData.window_width;
		oSettings.window_height = _loadData.window_height;		
		window_set_size(_loadData.window_width, _loadData.window_height);
		window_set_fullscreen(_loadData.isfullscreen);
		oSettings.isfullscreen = _loadData.isfullscreen;
		window_center();
		
		set_tile_font(_loadData.font);
		
		buffer_delete(_buffer);
		
		show_debug_message("loaded settings.save");
	}
	else
	{
		save_settings();
		show_debug_message("successfully initialized settings");
	}
	
	if(file_exists("keybinds.save"))
	{
		var _buffer = buffer_load("keybinds.save");
		var _string = buffer_read(_buffer, buffer_string);
		
		input_player_import(_string);
		
		buffer_delete(_buffer);
		
		show_debug_message("loaded keybinds.save");
	}	
}