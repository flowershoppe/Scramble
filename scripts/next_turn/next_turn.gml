function next_turn()
{	
	var _player = oPlayer;
	var _hand = oPlayerHand;
	
	//reset turn-dependent variables
	_player.turn_spelled_words = [];
	_player.placed_tiles = [];

	oMatchManager.turn++;
	
	//refill hand until full if bag has tiles
	
	add_tile_to_hand(_hand, oTilebag, _hand.size);	
	
	check_end_match();
	
	if(!oMatchManager.loss and !oMatchManager.victory)
	{
		save_game();
	}
}