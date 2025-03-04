//click on reward
if(selectable)
{
	if(input_mouse_check_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), reward_type))
	{
		switch(reward_type)
		{
			case oTile:
				var _tile = instance_nearest(oCursor.x, oCursor.y, oTile)
				add_tile_to_bag(_tile.letter, _tile.pointvalue, 1, true);	
			break;
			
			case oCharm:
				var _charm = instance_nearest(oCursor.x, oCursor.y, oCharm).object_index;
				add_charm(_charm);
			break;
		}

		room_goto(rMap);
		rewarding = false;
		selectable = false;
		array_rewards = [];
		reward_type = noone;
		//reset match manager and opponent
		instance_destroy(oMatchManager);
		instance_create_layer(0, 0, "Meta", oMatchManager);
	}	
}