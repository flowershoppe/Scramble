if(input_check_pressed("confirm") and active)
{
	submit_play();
}
if(room == rGame and victory and (input_check_pressed("confirm") or input_mouse_check_released(mb_left))
	and !instance_exists(oDialogue) and wait == false)
{	
	if(array_get_index(oRun.levels, oRun.current_level) == 0)
	{
		dialogue_open(adialogue, []);
	}
	else
	{
		show_results();
	}
}