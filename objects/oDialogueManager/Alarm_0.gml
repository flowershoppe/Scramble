switch(room)
{
	case rGame:
		if(!array_equals(dialogues, []) and oSettings.play_dialogue)
		{
			if(dialogue_array < array_length(dialogues))
			{
				dialogue_open(adialogue, []);
				break;
			}		
		}
		start_match();
	break;
	case rMainMenu:
		dialogue_array = 0;
		index = 0;
	break;
}