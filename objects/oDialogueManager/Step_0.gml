index = oMatchManager.victory;

if(room == rGame and oMatchManager.victory and (input_check_pressed("confirm") or input_mouse_check_released(mb_left))
	and !instance_exists(oDialogue) and oMatchManager.wait == false)
{	
	if(oSettings.play_dialogue and dialogue_array < array_length(dialogues))
	{
		dialogue_open(adialogue, []);
		dialogue_array ++;
	}
	else
	{
		show_results();	
	}
}