if(keyboard_check_pressed(global.pause_button) and room == rGame)
{
	with(yui_document)
	{
		if(data_context == oSettings)
		{unpause_game();}
		else{pause_game();}
	}
}