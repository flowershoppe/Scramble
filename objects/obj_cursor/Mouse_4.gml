//grab a tile

if(place_meeting(x, y, obj_tile))
{
	held_tile = instance_place(x, y, obj_tile);
	held_tile.layer = layer_get_id("Grabbed");
	held_tile.grabbed = true;
	held_tile.in_hand = false;
	
	audio_play_sound(place_sounds[random_range(0, array_length(place_sounds))], 1, 0, 0.8, 0, 1.5)
	
	if(place_meeting(x, y, obj_playerhand))
	{
		var _f = function(_element, _index)
		{
			return (_element == held_tile);	
		}
	
		var _array = obj_playerhand.tile_array;
		var _index = array_find_index(_array, _f); 
	
		_array[_index] = noone;
	}
}