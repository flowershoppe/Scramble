if(global.paused){exit;}
x = mouse_x;
y = mouse_y;


if(!instance_exists(oMatchManager)){exit;}

if(oMatchManager.active)
{
	var _placed_tiles = oPlayer.placed_tiles;
}

layer = layer_get_id("Tiles");
if(instance_exists(oPlayerHand))
{		
	if(place_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oPlayerHand))
	{
		layer = layer_get_id("Hand");
	}
}

if(global.exchanging){exit;}

//-----TYPE TO PLACE-----
var _letter = "";
var _bool = true;
with(oTile)
{
	if(wait_for_input)
	{
		_bool = false;
	}
}


if(room == rGame and input_keyboard_check_pressed(vk_anykey) and layer == layer_get_id("Tiles") and _bool and ord("A") <= keyboard_key and keyboard_key <= ord("Z"))
{
	var _array = oPlayerHand.tile_holder_array;

	for(var i = 0; i < array_length(_array); i++)
	{
		if(_array[i].tile != noone)
		{
			if(string_upper(keyboard_lastchar) == _array[i].tile.letter)
			{
				_letter = string_upper(keyboard_lastchar);
				held_tile = _array[i].tile;
				break;
			}
		}
	}
}


//-----PICK UP-----
#region
if(mouse_check_button_pressed(mb_left) or _letter != "")
{	
	//in hand check
	if(_letter == "")
	{
		if(oMatchManager.active and position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oTile))
		{
			var _list = ds_list_create();
			var _num = instance_place_list(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oTile, _list, true);
			for(var _i = 0; _i < _num; _i++)
			{
				if(_list[| _i].in_hand)
				{
					held_tile = _list[| _i];
					break;
				}
				else
				{
					held_tile = noone;
				}
			}
			ds_list_destroy(_list);
			//held_tile = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oTile);
			//if(held_tile.on_board){ held_tile = noone; }
		}
		//on board check
		else if(place_meeting(x, y, oTile))
		{
			var _list = ds_list_create();
			var _num = instance_position_list(x, y, oTile, _list, true);
			for(var _i = 0; _i < _num; _i++)
			{
				if(_list[| _i].on_board)
				{
					held_tile = _list[| _i];
					break;
				}
				else
				{
					held_tile = noone;
				}
			}
			ds_list_destroy(_list);
		}
		else{ held_tile = noone; }
	}

	//case for in hand tile objects "actual" locations
	//if(held_tile != noone){if(held_tile.in_hand == true){held_tile = noone;}}
		
	//check if tile exists and is grabbable	
	if(held_tile == noone){exit;}
	else if(!held_tile.grabbable or !held_tile.visible){held_tile = noone; exit;}
		
	//grab a tile
	
	//remove from placed tiles array if picking up from board
	if(oMatchManager.active)
	{
		if(held_tile.on_board == true)
		{array_delete(_placed_tiles, array_get_index(_placed_tiles, held_tile), 1);}
	}
			
	//hold the tile;	
	if(held_tile.on_board)
	{
		old_layer = layer_get_id("Tiles");	
	}
	else if(held_tile.in_hand)
	{
		old_layer = layer_get_id("Hand");	
	}
	audio_play_sound_on(global.emitterSE, global.place_sounds[irandom(array_length(global.place_sounds) - 1)],
			false, 0);
	
	held_tile.image_xscale = 1;
	held_tile.image_yscale = 1;
	held_tile.font_scale = 1;
	held_tile.on_board = false;
	held_tile.in_hand = false;
	old_x = held_tile.x;
	old_y = held_tile.y;
	held_tile.layer = layer_get_id("Grabbed");
	
	held_tile.x = device_mouse_x_to_gui(0);
	held_tile.y = device_mouse_y_to_gui(0);	
		

		
	var _tile = held_tile;
	
	//find tile holder holding the tile and remove it
	with(oTileHolder)
	{
		if(tile == _tile)
		{
			tile = noone;
		}
	}	
}
#endregion

//-----PLACE-----
#region
if(!mouse_check_button(mb_left) or _letter != "")
{
	if(held_tile == noone){exit;}
	
	//if holding a tile
	if(held_tile != noone)
	{	
		var _nearest_holder = noone;
		var _nearest_dist = infinity;
		
		//find nearest tile holder of the same layer		
		#region
		if(layer == layer_get_id("Hand"))
		{
			var _touching = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oTileHolder);
			with(oTileHolder)
			{
				if(array_contains(oPlayerHand.tile_holder_array, id) and visible)
				{
					var _dist = point_distance(x, y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))
					if(_dist < _nearest_dist)
					{
						//if we are not touching a tile holder, then this holder must not have a tile
						if(!_touching)
						{
							if(id.tile == noone)
							{
								//save the id
								_nearest_holder = id;
								_nearest_dist = _dist;
							}
						}
						else
						{
							//save the id
							_nearest_holder = id;
							_nearest_dist = _dist;
						}
					}
				}
			}
		}
		
		else
		{
			var _touching = position_meeting(x, y, oTileHolder);
			if(_touching)
			{
				if(instance_position(x, y, oTileHolder) != noone)
				{
					if(!instance_position(x, y, oTileHolder).visible)
					{
						_touching = false;	
					}
				}
			}
			with(oTileHolder)
			{
				if(layer == layer_get_id("Board_Tile_Holders") and visible)
				{
					var _dist = point_distance(x, y, other.x, other.y)
					if(_dist < _nearest_dist)
					{
						//if we are not touching a tile holder, then this holder must not have a tile
						if(!_touching)
						{
							if(id.tile == noone)
							{
								//save the id
								_nearest_holder = id;
								_nearest_dist = _dist;
							}
						}
						else
						{
							//save the id
							_nearest_holder = id;
							_nearest_dist = _dist;
						}
					}
				}
			}	
		}
		#endregion
		
		//-----DROP TILE-----				
		if(layer == layer_get_id("Tiles"))
		{
			held_tile.layer = layer_get_id("Tiles");
			//place in array for checking play validity later
			if(oMatchManager.active)
			{
				array_push(_placed_tiles, held_tile);
			}
			//Blank tile subroutine
			if(held_tile.blank == true)
			{
				held_tile.wait_for_input = true;	
			}	
			held_tile.on_board = true;

		}
		else if(layer == layer_get_id("Hand"))
		{
			held_tile.in_hand = true;
			held_tile.layer = layer_get_id("Hand_Tiles");
		}
		held_tile.x = _nearest_holder.x;
		held_tile.y = _nearest_holder.y;
		
		_nearest_holder.tile = held_tile;
		
		audio_play_sound(global.place_sounds[irandom(array_length(global.place_sounds) - 1)],
						1, 0, global.volumeSE);
	
		//-----SWITCH-----
		var _switch_tile = noone;
		var _list = ds_list_create();
		
		if(layer != layer_get_id("Hand"))
		{
			var _num = instance_position_list(x, y, oTile, _list, true);
		}
		else if(layer == layer_get_id("Hand"))
		{
			var _num = instance_position_list(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oTile, _list, true);
		}
		if(_num > 1)
		{
			for(var i = 0; i < ds_list_size(_list); i++)
			{
				_switch_tile = _list[| i];
				var _switch_layer = layer_get_name(_switch_tile.layer);
				var _layer_name = layer_get_name(layer);
				if(_switch_tile.grabbable and _switch_tile != held_tile 
					and (((_layer_name != "Hand" and _switch_layer != "Hand_Tiles") or
					(_layer_name == "Hand" and _switch_layer == "Hand_Tiles"))))
				{
					break;
				}
				if(i == ds_list_size(_list) - 1)
				{
					_switch_tile = noone;	
				}				
			}
			
		}
		ds_list_destroy(_list);

		held_tile = noone;
		
		//SWITCH TILE
		#region
		if(_switch_tile != noone)
		{
			_switch_tile.x = old_x;
			_switch_tile.y = old_y;
			_switch_tile.layer = old_layer;		
			
			_nearest_holder = noone;
			_nearest_dist = infinity;
			if(old_layer == layer_get_id("Hand"))
			{
				_nearest_holder = instance_nearest(oCursor.old_x, oCursor.old_y, oTileHolder); 
				
				with(oTileHolder)
				{
					if(array_contains(oPlayerHand.tile_holder_array, id))
					{
						var _dist = point_distance(x, y, oCursor.old_x, oCursor.old_y)
						if(_dist < _nearest_dist)
						{
							//save the id
							_nearest_holder = id;
							_nearest_dist = _dist;
						}
					}
				}
			}
		
			else
			{			
				with(oTileHolder)
				{
					if(layer == layer_get_id("Board_Tile_Holders"))
					{
						var _dist = point_distance(x, y, oCursor.old_x, oCursor.old_y)
						if(_dist < _nearest_dist)
						{
							//save the id
							_nearest_holder = id;
							_nearest_dist = _dist;
						}
					}
				}	
			}
		
			//-----DROP TILE-----				
			if(old_layer == layer_get_id("Tiles"))
			{
				_switch_tile.layer = layer_get_id("Tiles");
				//Blank tile subroutine
				if(_switch_tile.blank == true)
				{
					_switch_tile.wait_for_input = true;	
				}	
				_switch_tile.on_board = true;
				_switch_tile.in_hand = false;

			}
			else if(old_layer == layer_get_id("Hand"))
			{
				_switch_tile.in_hand = true;
				_switch_tile.on_board = false;
				_switch_tile.layer = layer_get_id("Hand_Tiles");
				//place in array for checking play validity later
				if(oMatchManager.active and layer == layer_get_id("Tiles"))
				{
					array_delete(_placed_tiles, array_get_index(_placed_tiles, _switch_tile), 1);
				}
			}
			
			_nearest_holder.tile = _switch_tile;
		}
		#endregion
	}
}
#endregion


if(held_tile != noone)
{
	held_tile.x = device_mouse_x_to_gui(0);
	held_tile.y = device_mouse_y_to_gui(0);	
}

