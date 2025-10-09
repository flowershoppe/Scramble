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
	if(oMatchManager.exchange_count < 1){event_user(0);}
	rewarding = true;
	save_game();
}

//create rewards interface
if(rewarding)
{
	var _bool = false;
	with(yui_document)
	{
		if(yui_file == "YUI screens/charmrewards.yui" or yui_file == "YUI screens/tilerewards.yui"
			or yui_file == "YUI screens/norewards.yui")
		{
			_bool = true;
		}
	}
	if(_bool == false)
	{
		if(oMatchManager.exchange_count > 0)
		{
			instance_create_layer(0, 0, "UI", yui_document,
			{
				data_context : oRewardsManager,
				yui_file : "YUI screens/norewards.yui",
				persistent : false
			});		
		}
		else
		{
			reward_money();
			//give reward based on current level in stage
			//if not last level of stage...
			if(!oRun.levels[array_length(oRun.levels) - 1].active)
			{
				instance_create_layer(0, 0, "UI", yui_document,
				{
					data_context : oRewardsManager,
					yui_file : "YUI screens/tilerewards.yui",
					persistent : false
				});			
			}
			else
			{
				instance_create_layer(0, 0, "UI", yui_document,
				{
					data_context : oRewardsManager,
					yui_file : "YUI screens/charmrewards.yui",
					persistent : false
				});	
			}
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