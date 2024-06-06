function next_turn()
{	
	var _player = oPlayer;
	var _placed_tiles = _player.placed_tiles;
	var _turn = oMatchStats.turn;
	
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

	_turn ++;
}