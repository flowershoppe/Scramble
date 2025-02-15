if(rewarding)
{
	if(input_mouse_check_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oTile))
	{
		var _tile = instance_nearest(oCursor.x, oCursor.y, oTile)
		add_tile_to_bag(_tile.letter, _tile.pointvalue, 1, true);	
		room_goto(rMap);
		rewarding = false;
		array_rewards = [];
		//reset match manager and opponent
		instance_destroy(oMatchManager);
		instance_create_layer(0, 0, "Meta", oMatchManager);
		alarm_set(0, 1);
	}	
}