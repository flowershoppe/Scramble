switch(room)
{
	case rm_game:
	//create game handlers

	instance_create_layer(0, 0, "Meta", obj_scorekeeper);
	instance_create_layer(0, 0, "Board", obj_board);
	instance_create_layer(room_width / 2, room_height / 2, "Meta", obj_camera);
	instance_create_layer(0, 0, "Background", obj_background);
	instance_create_layer(room_width * 0.9, room_height * 0.75, "UI", obj_button);
	var _UI = instance_create_layer(0, 0, "UI", ui_players);
	var _player = instance_create_layer(0, 0, "Meta", obj_player);
	var _cursor = instance_create_layer(0, 0, "Meta", obj_cursor);
	_cursor.owner = _player;
	_UI.owner = _player;
	global.active_player = _player;
	global.players = [_player];
	
	global.tilebag = instance_create_layer(300, 500, "Tilebag", obj_tilebag);
	
	break;
}