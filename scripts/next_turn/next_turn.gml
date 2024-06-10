function next_turn()
{	
	var _player = oPlayer;
	var _placed_tiles = _player.placed_tiles;
	
	with(oTile)
	{
		if(layer == layer_get_id("Tiles"))
		{
			grabbable = false;	
		}
	}
	
	//reset turn-dependent variables
	_player.turn_spelled_words = [];
	_player.placed_tiles = [];

	oMatchStats.turn ++;
	
	//refill hand until full if bag has tiles
	if(array_length(oTilebag.tiles) > 0)
	{
		var _count = 0;
		while(_count < oPlayer.hand_size)
		{
			add_tile_to_hand(oPlayer.hand, oTilebag);
			_count++
		}
	}
	
	check_end_match();
}