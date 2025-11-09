function new_run()
{
	oStats.run_count++;
	screenTransition(rMap, , ST_CHECKER_DIAG_UL_TO_DR_Y);
	
	instance_destroy(oRun);
	instance_create_layer(0, 0, "Meta", oRun);
	with(oRun){alarm_set(0, 1);}
	
	instance_destroy(oRewardsManager);
	instance_create_layer(0, 0, "Meta", oRewardsManager);
	
	instance_destroy(oShop);
	instance_create_layer(0, 0, "Meta", oShop);
	
	//audio_play_sound(sdConfirm, 1, false);
}