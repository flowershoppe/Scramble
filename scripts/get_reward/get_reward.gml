function get_reward(_id)
{
	if(_id != noone)
	{
		var _ind = _id.object_index;
		var _array = oRewardsManager.array_rewards;
	
		if(_ind == oTile)
		{		
			add_tile_to_bag(_id.letter, _id.pointvalue, 1, true);
			array_delete(_array, array_get_index(_array, _id), 1);
			instance_destroy(_id);
		}
		else if(object_is_ancestor(_ind, oCharm))
		{		
			if(add_charm(_ind))
			{
				array_delete(_array, array_get_index(_array, _ind), 1);
				instance_destroy(_id);	
			}
		}
	}
	
	next_level();	
	
	oRewardsManager.rewarding = false;
	oRun.current_level = noone;
	screenTransition(rMap, , ST_CHECKER_DIAG_UL_TO_DR_Y);
	oRewardsManager.array_rewards = [];
	oRewardsManager.reward_structs = [];
	//reset match manager and opponent
	instance_destroy(oMatchManager);
	instance_create_layer(0, 0, "Meta", oMatchManager);
}