function load_game()
{	
	if(file_exists("gamesave.save"))
	{
		var _buffer = buffer_load("gamesave.save");
		var _string = buffer_read(_buffer, buffer_string);
		
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
		
		var _struct = _loadData[0];
		var _variables = _struct.variables; //get struct of an object from data array
		
		room_goto(_variables.room_name);	
		
		with(oSaverLoader)
		{
			alarm_set(0, 1);	
		}
	}
}