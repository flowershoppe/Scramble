function verify_word(_word)
{
	if(global.dictionary.check(_word)) 
	{
		show_message("\"" + _word + "\" is a valid English word.");
	}	
	else 
	{
		show_message("invalid word.");
	}
}