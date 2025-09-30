function load_stats()
{
	if(file_exists("stats.save"))
	{
		var _buffer = buffer_load("stats.save");
		if (buffer_get_size(_buffer) == 0) 
		{
			show_debug_message("local app data stats.save empty")
		}
		var _string = buffer_read(_buffer, buffer_string);
		
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
		
		var _names = struct_get_names(_loadData); //returns an array of all names in the struct
		var _len = array_length(_names);
			
		for(var k = 0; k < _len; k++)
		{
			var _name = _names[k];
				
			oStats.id[$ _name] = _loadData[$ _name];
		}
	}
}
