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
//-----PICK UP-----
#region
if(mouse_check_button_pressed(mb_left))
{	
	//in hand check
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
	}
	else{ held_tile = noone; }

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
	held_tile.image_xscale = 1;
	held_tile.image_yscale = 1;
	held_tile.font_scale = 1;
	held_tile.on_board = false;
	held_tile.in_hand = false;
	held_tile.layer = layer_get_id("Grabbed");
		
	audio_play_sound_on(global.emitterSE, global.place_sounds[irandom(array_length(global.place_sounds) - 1)],
					false, 0);
		
	var _tile = held_tile;
	
	//find tile holder holding the tile and remove it
	with(oTileHolder)
	{
		if(tile == _tile)
		{
			tile = noone;
		}
	}
	if(oMatchManager.active)
	{
		if(array_length(_placed_tiles) > 0)
		{	
			valid_play();
		}
		else
		{
			debug = "Play some tiles!";	
		}	
	}

		
}
#endregion

//-----PLACE-----
#region
if(!mouse_check_button(mb_left))
{
	if(held_tile == noone){exit;}
	
	//if holding a tile
	if(held_tile != noone)
	{	
		var _nearest_holder = noone;
		var _nearest_dist = infinity;
	
		//find nearest tile holder of the same layer that isn't holding a tile		
		#region
		if(layer == layer_get_id("Hand"))
		{
			with(oTileHolder)
			{
				if(tile == noone and array_contains(oPlayerHand.tile_holder_array, id))
				{
					var _dist = point_distance(x, y, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))
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
				if(tile == noone and layer == layer_get_id("Board_Tile_Holders"))
				{
					var _dist = point_distance(x, y, other.x, other.y)
					if(_dist < _nearest_dist)
					{
						//save the id
						_nearest_holder = id;
						_nearest_dist = _dist;
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
				
		//validate play only if there are placed tiles
		if(oMatchManager.active)
		{
			if(array_length(_placed_tiles) > 0)
			{	
				valid_play();
			}
			else
			{
				debug = "Play some tiles!";	
			}
		}
		
		
		//_nearest_holder.tile = held_tile;
		
		audio_play_sound(global.place_sounds[irandom(array_length(global.place_sounds) - 1)],
						1, 0, global.volumeSE);
		
		held_tile = noone;
	}
}
#endregion

if(held_tile != noone)
{
	held_tile.x = device_mouse_x_to_gui(0);
	held_tile.y = device_mouse_y_to_gui(0);	
}

