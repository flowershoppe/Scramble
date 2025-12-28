function next_level()
{
	//activate next level
	for(var _i = 0; _i < array_length(oRun.levels); _i++)
	{
		if(oRun.levels[_i].active)
		{
			oRun.levels[_i].active = false;
			if(_i < array_length(oRun.levels) - 1)
			{
				oRun.levels[_i + 1].active = true;
				exit;
			}
		}
		//if no active levels (reached end of array)
		if(_i == array_length(oRun.levels) - 1)
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
			break;
		}
		
	}			
}