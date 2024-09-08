function save_game()
{
	var _saveData = array_create(0);
	
	//save Tiles
	with(oTile)
	{
		var _saveEntity = 
		{
			object_name : object_get_name(object_index),
			layer_name: layer_get_name(layer),
			variables :
			{			
				x : x,
				y : y,
				image_index : image_index,
				image_alpha : image_alpha,
				grabbable: grabbable,
				pointvalue : pointvalue,
				letter : letter,
				blank : blank,
				in_hand : in_hand,
				on_board : on_board,y
				spr : spr,	
			}		
		}
		array_push(_saveData, _saveEntity);
	}

	//save Tiles
	with(oTile)
	{
		var _saveEntity = 
		{
			object_name : object_get_name(object_index),
			layer_name: layer_get_name(layer),
			variables :
			{			
				x : x,
				y : y,
				image_index : image_index,
				image_alpha : image_alpha,
				grabbable: grabbable,
				pointvalue : pointvalue,
				letter : letter,
				blank : blank,
				in_hand : in_hand,
				on_board : on_board,y
				spr : spr,	
			}		
		}
		array_push(_saveData, _saveEntity);
	}
	
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);

	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "gamesave.save");
	buffer_delete(_buffer);

	show_debug_message("Game successfully saved as " + _string)
}

