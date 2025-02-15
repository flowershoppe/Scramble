function load_game()
{	
	if(file_exists("gamesave.save"))
	{
		with(oPlayer) instance_destroy();
		with(oMatchManager) instance_destroy();
		with(oTile) instance_destroy();
		with(oTileHolder) instance_destroy();
		with(oPlayerHand) instance_destroy();
		with(oTilebag) instance_destroy();
		
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