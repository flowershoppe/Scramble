//click on reward
if(selectable)
{
	if(input_mouse_check_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), reward_type))
	{
		var _choice = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), reward_type).id;
		switch(reward_type)
		{
			case oTile:				
				add_tile_to_bag(_choice.letter, _choice.pointvalue, 1, true);	
			break;
			
			case oCharm:
				add_charm(_choice.object_index);
			break;
		}

		oRun.current_level.active = false;
		oRun.current_level = noone;
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