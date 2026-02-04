function new_run()
{
	audio_play_sound_on(oGame.emitter_SE, sdStartup, false, 1)
	oStats.run_count++;
	
	instance_create_layer(0, 0, "Meta", oPlayer);
	
	screenTransition(rMap, , ST_CHECKER_DIAG_UL_TO_DR_Y);
	
	instance_destroy(oRun);
	instance_create_layer(0, 0, "Meta", oRun);
	with(oRun){alarm_set(0, 1);}
	
	instance_destroy(oRewardsManager);
	instance_create_layer(0, 0, "Meta", oRewardsManager);
	
	if(file_exists("gamesave.save"))
	{
		oStats.losses++;
	}
}