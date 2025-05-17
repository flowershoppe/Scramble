function toggle_stats()
{
	//stats
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
		instance_create_layer(0, 0, "Settings", yui_document, global.stStats);
	}
}