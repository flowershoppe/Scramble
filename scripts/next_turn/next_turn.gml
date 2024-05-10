function next_turn()
{	
	var _player = oPlayer;
	var _turn = global.turn;
	
	//reset turn-dependent variables
	_player.turn_spelled_words = [];
	_player.placed_tiles = [];

	_turn ++;
}