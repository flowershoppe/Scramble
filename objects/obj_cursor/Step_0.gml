//follow the cursor
x = mouse_x;
y = mouse_y;

if(held_tile != noone)
{
	held_tile.x = x;
	held_tile.y = y;
	
}

//Press left click
#region
if(mouse_check_button_pressed(mb_left))
{
	//grab a tile
	if(place_meeting(x, y, obj_tile))
	{
		//hold the tile
		held_tile = instance_place(x, y, obj_tile);
		held_tile.layer = layer_get_id("Grabbed");
		held_tile.image_xscale = 1;
		held_tile.image_yscale = 1;
	
		audio_play_sound(place_sounds[irandom(array_length(place_sounds) - 1)],
						1, 0, 0.8, 0, 1.5);
		
		var _tile = held_tile;
		var _holder;
		//find tile holder holding the tile and remove it
		with(obj_tile_holder)
		{
			if(tile == _tile)
			{
				tile = noone;
			}
		}
	}	
}
#endregion

//Release left click
#region
if(mouse_check_button_released(mb_left))
{
	//if holding a tile
	if(held_tile != noone)
	{
		//check if hovering over player hand
		var _layer;
		if(place_meeting(x, y, owner.hand))
		{ _layer = layer_get_id("Hand_Tile_Holders"); }
		else
		{ _layer = layer_get_id("Board"); }
	
		var _nearest_holder = noone;
		var _nearest_dist = infinity;
	
		//find nearest tile holder that isn't holding a tile
		with(obj_tile_holder)
		{
			if(tile == noone and layer == _layer)
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
	
	
		//drop the tile
		held_tile.x = _nearest_holder.x;
		held_tile.y = _nearest_holder.y;
		_nearest_holder.tile = held_tile;
		audio_play_sound(place_sounds[irandom(array_length(place_sounds) - 1)],
						1, 0, 0.8, 0, 1);
	
		held_tile = noone;
	}
}
#endregion