if(wait_for_input)
{
	if(ord("A") <= keyboard_key and keyboard_key <= ord("Z"))
	{
		letter = string_upper(keyboard_lastchar);
		
		wait_for_input = false;
	}	
}

