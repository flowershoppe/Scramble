if(room == rMap or room == rResults)
{
	save_game();
}

if(room == rResults)
{
	instance_create_layer(0, 0, "YUI", yui_document,
	{
		data_context : oMatchManager,
		yui_file : "YUI screens/results.yui",
		is_full_screen : true
	});		
}
