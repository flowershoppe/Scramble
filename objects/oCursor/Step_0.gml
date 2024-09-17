x = mouse_x;
y = mouse_y;

//do not run if match is inactive
if(instance_exists(oMatchState))
{
	if(oMatchState.active == false or global.exchanging){exit;}
}
else{exit;}


var _placed_tiles = oPlayer.placed_tiles;

if(instance_exists(oPlayerHand))
{	
	with(oPlayerHand)
	{
		if(position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
		{
			oCursor.layer = layer_get_id("Hand");
		}
		else
		{ oCursor.layer = layer_get_id("Tiles"); }	
	}
}

if(held_tile != noone)
{
	held_tile.x = device_mouse_x_to_gui(0);
	held_tile.y = device_mouse_y_to_gui(0);	
}

//-----PICK UP-----
#region
if(mouse_check_button_pressed(mb_left))
{		
	held_tile = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), oTile)
	
	if(held_tile == noone)
	{
		held_tile = instance_place(mouse_x, mouse_y, oTile);
	}
	
	//check if tile exists and is grabbable	
	if(held_tile == noone){exit;}
	else if(!held_tile.grabbable){held_tile = noone; exit;}
		
	//grab a tile
		
	//remove from placed tiles array if picking up from board
	if(held_tile.on_board == true)
	{array_delete(_placed_tiles, array_get_index(_placed_tiles, held_tile), 1);}
			
	//hold the tile;
	held_tile.image_xscale = 1;
	held_tile.image_yscale = 1;
	held_tile.font_scale = 1;
	held_tile.on_board = false;
	held_tile.in_hand = false;
		
	//Blank tile subroutine
	if(held_tile.blank == true)
	{
		held_tile.letter = "_";		
	}
		
	audio_play_sound(global.place_sounds[irandom(array_length(global.place_sounds) - 1)],
					1, 0, global.volumeSE);
		
	var _tile = held_tile;
	
	//find tile holder holding the tile and remove it
	with(oTileHolder)
	{
		if(tile == _tile)
		{
			tile = noone;
		}
	}
		
	if(array_length(_placed_tiles) > 0)
	{	
		valid_play();
	}
	else
	{
		debug = "Play some tiles!";	
	}	
		
}
#endregion

//-----PLACE-----
#region
if(mouse_check_button_released(mb_left))
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
		held_tile.layer = layer;
				
		if(layer == layer_get_id("Tiles"))
		{
			//place in array for checking play validity later
			array_push(_placed_tiles, held_tile);

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
		}
		held_tile.x = _nearest_holder.x;
		held_tile.y = _nearest_holder.y;
		
		_nearest_holder.tile = held_tile;
				
		//validate play only if there are placed tiles
		if(array_length(_placed_tiles) > 0)
		{	
			valid_play();
		}
		else
		{
			debug = "Play some tiles!";	
		}
		
		
		//_nearest_holder.tile = held_tile;
		
		audio_play_sound(global.place_sounds[irandom(array_length(global.place_sounds) - 1)],
						1, 0, global.volumeSE);
		
		held_tile = noone;
	}
}
#endregion

