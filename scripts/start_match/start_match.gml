function start_match(_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max)
{	
	instance_create_layer(0, 0, "Tilebag", oTilebag);
	instance_create_layer(0, 0, "Meta", oMatchGUI);

	oMatchManager.point_min = _point_min;
	oMatchManager.point_max = _point_max;	
	oMatchManager.turn_min = _turn_min;
	oMatchManager.turn_max = _turn_max;
	
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
	
	dist_standard(oTilebag);
	add_tile_to_hand(_hand, oTilebag, _hand.size);

}