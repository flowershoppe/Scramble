if(room == rMap or room == rResults)
{
	save_game();
}



if(room == rMap)
{
	if(!instance_exists(oLevel))
	{
		instance_create_layer(room_width * 0.25, room_height * 0.75, "YUI", oLevel1);
		instance_create_layer(room_width * 0.6, room_height * 0.3, "YUI", oLevel2);
	}	
}