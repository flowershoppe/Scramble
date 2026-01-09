function next_level()
{
	var _ind = array_get_index(oRun.levels, oRun.current_level);
	//activate next level
	if(!(_ind == (array_length(oRun.levels) - 1)))
	{
		oRun.levels[_ind].active = false;
		oRun.levels[_ind + 1].active = true;
		oRun.current_level = oRun.levels[_ind + 1];
	}
	else
	{		
		instance_destroy(oLevel);
		//create new levels if stage is completed (no active levels)
		//new shop			
		oRun.levels = [];
		if(oRun.stage < oRun.stage_count)
		{
			with(oShop){event_user(0);}
			with(oRun)
			{
				stage++;						
				//create levels
				var _lvl = 0;
				switch(stage)
				{
					case 1:
						var _lvl = oLevel1;
					break;
					case 2:
						var _lvl = oLevel2;
					break;
					case 3:
						var _lvl = oLevel3;
					break;
				}
				create_levels(level_count, _lvl);	
			}		
		}		
	}
}