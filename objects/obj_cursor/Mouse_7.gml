//if holding a tile
if(held_tile != noone)
{
	
	var _nearest_holder = noone;
	var _nearest_dist = infinity;
	
	//find nearest tile holder that isn't filled
	with(obj_tile_holder)
	{
		if(filled == false)
		{
			var _dist = point_distance(x, y, other.x, other.y)
			if(_dist < _nearest_dist)
			{
				//save the id and set to filled
				_nearest_holder = id;
				_nearest_dist = _dist;
				_nearest_holder.filled = true;
			}
		}
	}
	
	
	//drop the tile
	held_tile.grabbed = false;
	held_tile.x = _nearest_holder.x;
	held_tile.y = _nearest_holder.y;
	
	
	//place held tile id in tile array of nearest tile holder according to its coordinates
	_nearest_holder.owner.tile_array[_nearest_holder.x_coord][_nearest_holder.y_coord] = held_tile;
	
	debug = _nearest_holder.owner.tile_array[_nearest_holder.x_coord][_nearest_holder.y_coord].letter;
	
	
	held_tile = noone;
}
	
	
