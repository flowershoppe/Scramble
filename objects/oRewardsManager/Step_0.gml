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

//create rewards interface
if(room == rResults and (input_check_pressed("confirm") or input_mouse_check_pressed(mb_left)) 
	and !_bool and !global.paused and !rewarding)
{	
	//reward
	event_user(0);
	rewarding = true;
	save_game();
}

//create rewards interface
if(rewarding)
{
	var _bool = false;
	with(yui_document)
	{
		if(yui_file == "YUI screens/charmrewards.yui" or yui_file == "YUI screens/tilerewards.yui")
		{
			_bool = true;
		}
	}
	if(_bool == false)
	{
		switch(oOpponent.reward_type)
		{
			case oTile:
				instance_create_layer(0, 0, "UI", yui_document,
				{
					data_context : oRewardsManager,
					yui_file : "YUI screens/tilerewards.yui",
					persistent : false
				});			
			break;
			
			case oCharm:
				instance_create_layer(0, 0, "UI", yui_document,
				{
					data_context : oRewardsManager,
					yui_file : "YUI screens/charmrewards.yui",
					persistent : false
				});		
			break;
		}

	}	
}

//on load subroutine
if(array_length(array_rewards) < 1 and room == rResults)
{
	with(oCharm)
	{
		if(!array_contains(oCharmManager.charms, id))
		{
			array_push(oRewardsManager.array_rewards, id);
		}
	}
}