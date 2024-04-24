//validate whether placed tiles constitute a valid play
function validate_play(_player)
{
	var i = 0;
	var _player_array = _player.placed_tiles;
	var _array_ids = [];
	var _array_letters = [];
	var _is_valid = false;
	
	var _first_tile = noone;
	var _next_tile = noone;
	var _current_tile = noone;
	
	var _test;
	
	//find top-left-most tile in player's placed_tiles array
	var _nearest_dist = infinity;
	with(obj_tile)
	{
		var _dist = point_distance(x, y, 0, 0)
		if(_dist < _nearest_dist and array_contains(_player_array, id))
		{
			//save the id
			_first_tile = id;
			_nearest_dist = _dist;
		}
	}
	
	_current_tile = _first_tile;
	
	//check horizontal
	#region
	//compile played tiles and tiles adjacent to the right of them
	while(_current_tile != noone)
	{
		//add tile letter and id to arrays
		array_push(_array_letters, _current_tile.letter);
		array_push(_array_ids, _current_tile);
						
		//tile immediately to right
		var _next_x = _current_tile.x + _current_tile.spr_size;
		var _c = noone;
		
		with(_current_tile)
		{
			_c = instance_place(_next_x, _current_tile.y, obj_tile);
		}
		_current_tile = _c;
	}
	
	//validate playability
	var j = 0;
	var _check = 0;
	
	for(j = 0; j < array_length(_player_array); j++)
	{
		//if player placed_tiles tiles all appear in id array...
		if(array_contains(_array_ids, _player_array[j]))
		{
			_check++;	
		}
	}
	
	if(_check == array_length(_player_array))
	{
		_is_valid = true;
	}
	#endregion
	
	//check vertical
	#region
	//if invalid horizontally, check vertically
	else
	{
		_current_tile = _first_tile;
	
		//compile played tiles and tiles adjacent to the right of them
		while(_current_tile != noone)
		{
			//add tile letter and id to arrays
			array_push(_array_letters, _current_tile.letter);
			array_push(_array_ids, _current_tile);
						
			//tile immediately to right
			var _next_y = _current_tile.y + _current_tile.spr_size;
			var _c = noone;
		
			with(_current_tile)
			{
				_c = instance_place(_current_tile.x, _next_y, obj_tile);
			}
			_current_tile = _c;
		}
	
		//validate playability
		j = 0;
		_check = 0;
	
		for(j = 0; j < array_length(_player_array); j++)
		{
			//if player placed_tiles tiles all appear in id array...
			if(array_contains(_array_ids, _player_array[j]))
			{
				_check++;	
			}
		}
	
		if(_check == array_length(_player_array))
		{
			_is_valid = true;
		}
	}
	#endregion
	
	if(_is_valid){ debug = "Play is valid"; }
	else{ debug = "Play is invalid"; }
	return _is_valid;
}