function add_player(_name)
{
	var _player = instance_create_layer(0, 0, "Meta", obj_player);
	
	_player.player_name = _name;
	
	return _player;
}