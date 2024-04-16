var _overlap;
//if holding a tile
if(held_tile != noone)
{
	
	
	

	//if not overlapping with an ungrabbed tile
	if(_overlap == false)
	{
		//if touching a tile holder
		if(place_meeting(x, y, obj_tile_holder))
		{	
			//get id of tile holder
			var _tile_holder = instance_place(x, y, obj_tile_holder)
	
			if(place_meeting(x, y, obj_playerhand))
			{
				//store held tile's id in hand array according to tile holder coordinate
				obj_playerhand.tile_array[_tile_holder.x_coord] = held_tile.id;
			}
			else
			{
				var _other_tile = obj_board.tile_array[_tile_holder.x_coord][_tile_holder.y_coord];
				
				with(held_tile)
					{
						x = _tile_holder.x;
						y = _tile_holder.y;
						//move held tile to tile layer on the board tile
						layer = layer_get_id("Tiles");
						grabbed = false;
					}
			}
		}
	}

	//drop the tile
	held_tile.grabbed = false;
	held_tile = noone;
}
	
	
