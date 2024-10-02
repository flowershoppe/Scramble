switch(room)
{
	case rGame:	
		if(play_dialogue)
		{
			dialogue_open(adialogue, []);
			play_dialogue = false;
		}
	break;
	
	case rResults:
		play_dialogue = true;
	break;
}


