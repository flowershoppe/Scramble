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
			else if(_i == array_length(oRun.levels) - 1)
			{
				instance_destroy(oLevel);
				//create new levels if stage is completed
				with(oRun)
				{
					levels = [];
					if(stage < 3)
					{
						stage++;						
						//create levels
						if(room == rMap)
						{
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
							create_levels(3, _lvl);							
						}
					}
				}
				break;
			}
		}
	}			
}