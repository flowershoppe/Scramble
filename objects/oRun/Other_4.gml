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

if(room == rMap)
{
	if(!instance_exists(oLevel))
	{
		instance_create_layer(room_width * 0.25, room_height * 0.75, "UI", oLevel1);
		instance_create_layer(room_width * 0.6, room_height * 0.3, "UI", oLevel2);
	}	
}