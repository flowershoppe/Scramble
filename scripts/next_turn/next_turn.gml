function next_turn()
{	
	var _player = oPlayer;
	var _hand = oPlayerHand;
	
	//reset turn-dependent variables
	_player.turn_spelled_words = [];
	_player.placed_tiles = [];	
	
	//refill hand until full if bag has tiles
	
	if(check_end_match())
	{
		exit;	
	}
	
	add_tile_to_hand(_hand.size);	
	
	oMatchManager.turn++;
	
	if(!oMatchManager.loss and !oMatchManager.victory)
	{
		broadcast("turn start");
		save_game();
	}
}