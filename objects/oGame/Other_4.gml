switch(room)
{
	case rm_game:
	
		//create game handlers

		instance_create_layer(0, 0, "Meta", oScorekeeper);
		instance_create_layer(0, 0, "Board", oBoard);
		instance_create_layer(room_width / 2, room_height / 2, "Meta", oCamera);
		instance_create_layer(0, 0, "Background", oBackground);
		instance_create_layer(room_width * 0.9, room_height * 0.75, "UI", oButton);
	
		//initialize player
		var _player = instance_create_layer(0, 0, "Meta", oPlayer);
		var _cursor = instance_create_layer(0, 0, "Meta", oCursor);
	
		_cursor.owner = _player;
	
		//initialize tilebag
		global.tilebag = instance_create_layer(300, 500, "Tilebag", oTilebag);
	
	
		break;
}