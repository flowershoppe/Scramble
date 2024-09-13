function load_game()
{	
	if(file_exists("gamesave.save"))
	{
		var _buffer = buffer_load("gamesave.save");
		var _string = buffer_read(_buffer, buffer_string);
		
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
				
		//recreate instances
		with(oPlayer) instance_destroy();
		with(oTile) instance_destroy();
		with(oTileHolder) instance_destroy();
		with(oPlayerHand) instance_destroy();
		with(oTilebag) instance_destroy();
		
		for(var i = 0; i < array_length(_loadData); i++) //loop through data array
		{
			var _struct = _loadData[i];
			var _variables = _struct.variables; //get struct of an object from data array
			var _names = struct_get_names(_variables); //returns an array of all names in the struct
			var _len = array_length(_names);
			var _obj = asset_get_index(_loadData[i].object_name);
			var _inst = instance_create_layer(0, 0, _loadData[i].layer_name, _obj);
			
			//assign all recreated objects' standard variables
			for(var k = 0; k < _len; k++)
			{
				var _name = _names[k];
				
				_inst[$ _name] = _variables[$ _name];
			}	
			
			if(_struct.layer_name == "Tilebag" and _struct.object_name == "oTile")
			{
				array_push(oTilebag.tiles, _inst.id);	
			}
			
			if(_struct.layer_name == "Hand_Tile_Holders")
			{
				array_push(oPlayerHand.tile_holder_array, _inst);	
			}
		}
	}
	
	with(oTile)
	{
		var _holder = instance_nearest(x, y, oTileHolder);
		
		_holder.tile = id;		
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