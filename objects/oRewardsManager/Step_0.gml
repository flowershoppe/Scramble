//delay selectability of rewards
if(rewarding and !selectable and alarm_get(1) == -1)
{
	alarm_set(1, 60);	
}
//failsafe
if(!rewarding){selectable = false;}

//check for collision with info bar
var _yui = noone;
with(yui_document)
{
	if(yui_file == "YUI screens/info_bar.yui")
	{
		_yui = id;
	}
}
if(_yui != noone)
{
	var _bool = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _yui)
}

//click on reward
if(room == rResults and (input_check_pressed("confirm") or input_mouse_check_pressed(mb_left))
	and !rewarding and !_bool and !global.paused)
{	
	instance_destroy(oOpponent);
	
	//go to rewards
	reward(oRun.current_level.reward_amount, oRun.current_level.reward_type);
} 

if(selectable and !global.paused)
{
	if(input_mouse_check_released(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), reward_type))
	{
		var _choice = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), reward_type).id;
		if(_choice.visible == false){exit;}
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

//yui element
if(rewarding)
{
	var _bool = false;
	with(yui_document)
	{
		if(yui_file == "YUI screens/rewards.yui")
		{
			_bool = true;
		}
	}
	if(_bool == false)
	{
		instance_create_layer(0, 0, "YUI", yui_document,
		{
			data_context : oRewardsManager,
			yui_file : "YUI screens/rewards.yui"
		});	
	}
}