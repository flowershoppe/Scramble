if(keyboard_check_pressed(global.pause_button))
{
	with(yui_document)
	{
		if(data_context == oSettings)
		{
			unpause_game();
			exit;
		}
	}

menu = instance_create_layer(0, 0, "Meta", yui_document,
	{	
		data_context: oSettings,
		yui_file: "YUI/settings.yui",
	});

	pause_game();	
}