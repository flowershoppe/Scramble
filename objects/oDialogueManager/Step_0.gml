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
		//end run if current stage is amount of stages and current level is final level
		if(oRun.stage >= oRun.stage_count and oRun.current_level == oRun.levels[array_length(oRun.levels) - 1])
		{				
			if(!array_equals(victory_dialogue, []))
			{
				
			}
			else
			{
				with(oRun){alarm_set(2, 1)}				
				screenTransition(rGameOver, , ST_CHECKER_DIAG_UL_TO_DR_Y);
			}
		}
		else
		{
			show_results();	
		}
	}
}