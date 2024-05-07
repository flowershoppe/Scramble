var _player = global.active_player;

if(valid_play(_player))
{
	_player.score = calculate_points(_player);
	debug3 = calculate_points(_player);
}

