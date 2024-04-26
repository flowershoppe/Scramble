function next_turn()
{
	var _active_player = global.active_player
	var _players = global.players
	var _player_index = array_get_index(_players, _active_player);

	//return to start of turn order if at end
	if(_player_index + 1 >= array_length(_players))
	{
		_active_player = array_get(_players, 0);
	}
	else
	{
		_active_player = array_get(global.players, _player_index + 1);
	}
}