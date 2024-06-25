function toggle_settings()
{
	with(yui_document)
	{
		if(data_context == oSettings)
		{
			instance_destroy();	
		}
		else
		{
			instance_create_depth(0, 0, -11, yui_document,
			{	
				data_context: oSettings,
				yui_file: "YUI/settings.yui",
			});	
		}
	}
}