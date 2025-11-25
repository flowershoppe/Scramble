function toggle_stats()
{
	//stats
	global.paused = !global.paused;
	var _exists = false;
	with(yui_document)
	{
		if(yui_file == "YUI screens/stats.yui")
		{
			_exists = true;
			instance_destroy()
		}
	}
	
	if(!_exists)
	{
		//audio_play_sound(sdConfirm, 1, false);
		instance_create_layer(0, 0, "Settings", yui_document, global.stStats);
	}
}