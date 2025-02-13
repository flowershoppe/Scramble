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
		}
		
		with(oTile)
		{
			if(layer_get_name(layer) == "Tilebag")
			{
				array_push(oTilebag.tiles, id);	
			}
			else 
			{
				var _holder = instance_nearest(x, y, oTileHolder);
		
				_holder.tile = id;	
			}	
		}
		
		with(oTileHolder)
		{
			if(layer_get_name(layer) == "Hand_Tile_Holders")
			{
				array_push(oPlayerHand.tile_holder_array, id);
			}
		}
		
		if(oMatchManager.active)
		{
			//UI
			instance_create_layer(0, 128, "YUI", yui_document,
			{
				data_context : oMatchManager,
				yui_file : "YUI screens/match_stats.yui",
				is_full_screen : false,
				image_xscale : 3,
				image_yscale : 3.5
			});
	
			instance_create_layer(755, 384, "YUI", yui_document,
			{
				data_context : 	oMatchGUI,
				yui_file : "YUI screens/match_buttons.yui",
				is_full_screen : false,
				image_xscale : 3.046,
				image_yscale : 2.609
			});				
		}
	}
}