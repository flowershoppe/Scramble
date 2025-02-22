function new_run()
{
	room_goto(rMap);
	instance_create_layer(0, 0, "UI", oRun);
	with(oRun){alarm_set(0, 1);}
}