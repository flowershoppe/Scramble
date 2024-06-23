if(input_check_pressed("pause") and room == rGame)
{
	with(yui_document)
	{
		if(data_context == oSettings)
		{unpause_game();}
		else{pause_game();}
	}
}

