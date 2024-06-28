function next_turn()
{	
	var _player = oPlayer;
	var _placed_tiles = _player.placed_tiles;
	var _hand = oPlayerHand;
	
	with(oTile)
	{
		if(array_contains(_placed_tiles, id))
		{
			grabbable = false;	
		}
	}
	
	//reset turn-dependent variables
	_player.turn_spelled_words = [];
	_player.placed_tiles = [];

	oMatchStats.turn++;
	
	//refill hand until full if bag has tiles
	
	add_tile_to_hand(_hand, oTilebag, _hand.size);	
	
	check_end_match();
}