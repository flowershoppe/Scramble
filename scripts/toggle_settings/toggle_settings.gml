function toggle_settings()
{
	//settings
	var _exists = false;
	with(yui_document)
	{
		if(yui_file == "YUI screens/settings.yui")
		{
			_exists = true;
			instance_destroy();
			if(room == rMainMenu){global.paused = false;}
		}
	}
	
	if(!_exists)
	{
		//audio_play_sound(sdConfirm, 1, false);
		instance_create_layer(0, 0, "Settings", yui_document, global.stSettings);
		global.paused = true;
	}
}