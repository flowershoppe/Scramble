function new_run()
{
	instance_create_layer(100, 450, "Tilebag", oTilebag);
	dist_standard(oTilebag);
	instance_create_layer(0, 0, "UI", oRun);
	instance_create_layer(0, 0, "Meta", oCharmManager);
	room_goto(rMap);	
}