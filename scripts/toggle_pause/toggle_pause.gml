function toggle_pause()
{
	//unpause
	if(global.paused)
	{		
		with(yui_document)
		{
			if(yui_file == "YUI screens/pause_menu.yui")
			{
				instance_destroy();	
			}
			if(yui_file == "YUI screens/settings.yui")
			{
				instance_destroy();	
			}
		}
		global.paused = false
	}	
	//pause
	else
	{	
		instance_create_layer(0, 0, "Pause", yui_document, global.stPauseMenu);
		global.paused = true;
	}
}