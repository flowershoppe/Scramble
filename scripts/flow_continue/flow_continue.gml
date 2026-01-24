function flow_continue()
{
	with(yui_document)
	{
		if(yui_file == "YUI screens/continue_button.yui")
		{
			instance_destroy();
			break;
		}
	}
	switch(room)
	{
		case rGame:
		if(oMatchManager.victory and !instance_exists(oDialogue))
		{	
			if(oSettings.play_dialogue and oDialogueManager.dialogue_array < array_length(oDialogueManager.dialogues))
			{
				dialogue_open(adialogue, []);
				oDialogueManager.dialogue_array ++;
			}
			else
			{	
				//end run if current stage is amount of stages and current level is final level
				if(oRun.stage >= oRun.stage_count and oRun.current_level == oRun.levels[array_length(oRun.levels) - 1])
				{				
					win_run();
					with(oRun){alarm_set(2, 1)}				
					screenTransition(rGameOver, , ST_CHECKER_DIAG_UL_TO_DR_Y);
					
				}
				else
				{
					audio_play_sound_on(oGame.emitter_SE, sdSelect, false, 1);
					show_results();	
				}
			}
		}
		break;		
	}
	
}