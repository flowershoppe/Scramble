function new_run()
{
	oStats.run_count++;
	room_goto(rMap);
	instance_create_layer(0, 0, "Meta", oRun);
	with(oRun){alarm_set(0, 1);}
	instance_create_layer(0, 0, "Meta", oRewardsManager);
}