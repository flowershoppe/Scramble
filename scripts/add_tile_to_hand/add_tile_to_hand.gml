//Add tile to hand

function add_tile_to_hand(_player, _israndom, _index)
{
	if(_israndom)
	{
		_player.tiles_in_hand = obj_tilebag.tiles[random_range(0, array_length(obj_tilebag.tiles) + 1)];
	}
	//may select individual tile
	else
	{
		_player.tiles_in_hand = obj_tilebag.tiles[_index];
	}
}