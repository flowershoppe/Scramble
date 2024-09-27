function save_game()
{
	var _saveData = array_create(0);
	
	//save Run
	with(oRun)
	{
		var _saveEntity =
		{
			object_name : object_get_name(object_index),
			layer_name: layer_get_name(layer),
			variables :
			{
				x : x,
				y : y,
				room_name : room,
				time : time,
				play_dialogue : play_dialogue
			}
		}
		array_push(_saveData, _saveEntity);
	}
	
	//save Player
	with(oPlayer)
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
				player_name : player_name,
				placed_tiles : placed_tiles,
				turn_spelled_words : turn_spelled_words,
				match_spelled_words : match_spelled_words
			}
		}
		array_push(_saveData, _saveEntity);
	}
	
	//save Match Stats
	with(oMatchManager)
	{
		var _saveEntity =
		{
			object_name : object_get_name(object_index),
			layer_name : layer_get_name(layer),
			variables:
			{
				x : x,
				y : y,
				last_play : last_play,
				last_words : last_words,
				spelled_words : spelled_words,
				turn_max : turn_max,
				turn_min : turn_min,
				point_max : point_max,
				point_min : point_min
			}		
		}
		array_push(_saveData, _saveEntity);
	}
	
	//save Hand
	with(oPlayerHand)
	{
		//save entity like the other objects
		var _saveEntity = 
		{
			object_name : object_get_name(object_index),
			layer_name : layer_get_name(layer),
			variables :
			{
				x : x,
				y : y,
				image_index : image_index,
				image_alpha : image_alpha,
				empty : empty,
				owner : owner,
				size: size,
				spr : spr
			}
		}		
		array_push(_saveData, _saveEntity);
	}
	
	//save Board
	with(oBoard)
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
				image_xscale : image_xscale,
				image_yscale : image_yscale,
				spr : spr,
				grid_width : grid_width,
				grid_height : grid_height
			}	
		}
		array_push(_saveData, _saveEntity);
	
	}	
	//save Tilebag
	with(oTilebag)
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
				spr : spr
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
				visible : visible,
				grabbable: grabbable,
				pointvalue : pointvalue,
				letter : letter,
				blank : blank,
				on_board : on_board,
				in_hand : in_hand,
				spr : spr,	
				highlight : highlight
			}		
		}
		array_push(_saveData, _saveEntity);
	}
	
	//save Holders
	with(oTileHolder)
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
				spr : spr,
				lmult : lmult,
				wmult : wmult,
				owner : owner,
				winspot : winspot,
				active : active,
				mult_spr : mult_spr
			}		
		}
		array_push(_saveData, _saveEntity);
	}
	
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);

	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, game_save_id + "gamesave.save");
	buffer_delete(_buffer);

	show_debug_message("Game successfully saved at " + game_save_id + " as " + _string)
}
