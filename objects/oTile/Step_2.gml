if(wait_for_input and input_keyboard_check_pressed(vk_anykey))
{
	if(ord("A") <= keyboard_key and keyboard_key <= ord("Z"))
	{
		letter = string_upper(keyboard_lastchar);
		
		wait_for_input = false;
	}	
}