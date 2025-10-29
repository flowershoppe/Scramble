switch(room)
{
	case rGame:
		if(array_get_index(oRun.levels, oRun.current_level) == 0)
		{
			dialogue_open(adialogue, []);
		}
		else
		{
			start_match();	
		}
}