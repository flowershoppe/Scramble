function post_load()
{	
	if(file_exists("gamesave.save"))
	{
		var _buffer = buffer_load("gamesave.save");
		var _string = buffer_read(_buffer, buffer_string);
		
		buffer_delete(_buffer);
		var _loadData = json_parse(_string);
				
		//recreate instances
		with(oPlayer) instance_destroy();
		with(oMatchManager) instance_destroy();
		with(oTile) instance_destroy();
		with(oTileHolder) instance_destroy();
		with(oPlayerHand) instance_destroy();
		with(oTilebag) instance_destroy();
		with(oCharmManager) instance_destroy();
		with(oCharm) instance_destroy();
		with(oDialogueManager) instance_destroy();
		with(oShop) instance_destroy();
		
		for(var i = 0; i < array_length(_loadData); i++) //loop through data array
		{
			var _struct = _loadData[i];
			var _variables = _struct.variables; //get struct of an object from data array
			var _names = struct_get_names(_variables); //returns an array of all names in the struct
			var _len = array_length(_names);
			var _obj = asset_get_index(_loadData[i].object_name);
			if(_obj == oBoard)
			{
				var _a = 1;	
			}
			var _inst = instance_create_layer(0, 0, _loadData[i].layer_name, _obj, _variables);
			/*
			//assign all recreated objects' standard variables
			for(var k = 0; k < _len; k++)
			{
				var _name = _names[k];
				
				_inst[$ _name] = _variables[$ _name];
			}		*/
		}
		
		with(oCharm)
		{
			if(isininventory)
			{
				oCharmManager.charms[index] = id;
			}
			//if in rResults and not a player's charm, add to rewards array
			if(room == rResults)
			{
				if(!array_contains(oCharmManager.charms, id))
				{
					array_push(oRewardsManager.array_rewards, id);
				}
				
			}
		}
		
		with(oLevel)
		{
			array_push(oRun.levels, id);
		}
		
		with(oRun)
		{
			current_level = oRun.levels[current_level_index];
		}
	
		with(oTile)
		{
			if(persistent)
			{
				array_push(oTilebag.tiles, id);				
			}
			
			if(layer_get_name(layer) == "Tilebag")
			{
				visible = false;
				array_push(oTilebag.match_tiles, id);
			}			
			else if(instance_exists(oTileHolder))
			{
				visible = true;
				var _holder = instance_nearest(x, y, oTileHolder);
		
				_holder.tile = id;	
			}
		}
		oTilebag.yui_tiles = oTilebag.match_tiles
		//sort the bag
		var _array = oTilebag.tiles;
		var _function = function(a, b)
		{
			return ord(a.letter) - ord(b.letter);
		}	

		array_sort(_array, _function);
		
		with(oTileHolder)
		{
			loading = true;
			if(layer_get_name(layer) == "Hand_Tile_Holders")
			{
				array_push(oPlayerHand.tile_holder_array, id);
			}
		}
		
		if(room == rResults)
		{
			instance_create_layer(0, 0, "Tilebag", yui_document,
			{
				data_context : oMatchManager,
				yui_file : "YUI screens/results.yui",
				is_full_screen : true
			});		
		}
		
		if(room == rGame)
		{
			//UI
			instance_create_layer(0, 0, "YUI", yui_document, global.stMatchStats);
	
			instance_create_layer(755, 384, "YUI", yui_document, global.stMatchButtons);		
		}
		
		if(oRewardsManager.rewarding)
		{
			with(oTile)
			{
				if(visible)
				{
					array_push(oRewardsManager.array_rewards, id);	
				}
			}
		}
	}
	oGame.loading = false;
}