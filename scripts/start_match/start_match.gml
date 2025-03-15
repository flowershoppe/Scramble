function start_match(_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max)
{		
	instance_create_layer(0, 0, "Meta", oMatchGUI);
	var _o = oMatchManager;
	
	_o.point_min = _point_min;
	_o.point_max = _point_max;	
	_o.turn_min = _turn_min;
	_o.turn_max = _turn_max;
	_o.active = true;
	
	
	//-----GAME ELEMENTS-----
	var _hand = instance_create_layer(view_get_wport(0) / 2, 
				view_get_hport(0) - (sprite_get_height(spPlank) / 2), 
				"Hand", oPlayerHand,
				{
					size: 7
				
				});
	
	var _board = instance_create_layer(0, 0, "Board", oBoard, 
	{
		grid_width: _board_w,
		grid_height: _board_h
	});
	
	//UI
	instance_create_layer(0, 0, "YUI", yui_document, global.stMatchStats);
	
	instance_create_layer(0, 0, "YUI", yui_document, global.stMatchButtons);
	
	oTilebag.yui_tiles = oTilebag.match_tiles;
	array_copy(oTilebag.match_tiles, 0, oTilebag.tiles, 0, array_length(oTilebag.tiles));
	add_tile_to_hand(_hand, oTilebag, _hand.size);
	
	broadcast("turn start");
	broadcast("match start");
	
}