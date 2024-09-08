function load_game()
{
	with(oTile) instance_destroy();
	with(oTileHolder) instance_destroy();
	
	if(file_exists("gamesave.save"))
	{
		var _buffer = buffer_load("gamesave.save");
		var _string = buffer_read(_buffer, buffer_string);
		
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
		
		
		for(var i = 0; i < array_length(_loadData); i++) //loop through data array
		{
			var _struct = _loadData[i].variables; //get struct of an object from data array
			var _names = struct_get_names(_struct); //returns an array of all struct names
			var _len = array_length(_names);
			var _obj = asset_get_index(_loadData[i].object_name);
			var _inst = instance_create_layer(0, 0, _loadData[i].layer_name, _obj);
			
			
			for(var k = 0; k < _len; k++)
			{
				var _name = _names[k];
				
				_inst[$ _name] = _struct[$ _name];
			}
		}
	}
}

		/*
		while(array_length(_loadData) > 0)
		{
			var _loadEntity = array_pop(_loadData);
			with(instance_create_layer(0, 0, "Tiles", oTile))
			{
				pointvalue = _loadEntity.pointvalue;
				letter = _loadEntity.letter;
				blank = _loadEntity.blank;
				holder = _loadEntity.holder;
				spr = _loadEntity.spr;
				in_hand = _loadEntity.in_hand;
				on_board = _loadEntity.on_board;
			}
		}*/