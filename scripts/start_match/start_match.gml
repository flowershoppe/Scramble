function start_match(_board_w, _board_h, _point_min, _point_max, _turn_min, _turn_max)
{
	global.tilebag = instance_create_layer(room_width / 6, room_height /2 , "Tilebag", oTilebag);
	instance_create_depth(0, 0, -10, oMatchState);
	instance_create_depth(0, 0, -9, oMatchStats);
	instance_create_depth(0, 0, -8, oMatchGUI);
	
	//YUI ELEMENTS
	instance_create_layer(0, 96, "UI", yui_document,
	{
		image_xscale: 4,
		image_yscale: 4,
		yui_file: "YUI/match_stats.yui",
		data_context: oMatchStats,
		is_full_screen: false
	});
	
	instance_create_layer(750, 450, "UI", yui_document,
	{
		image_xscale: 3,
		image_yscale: 1.5,
		yui_file: "YUI/match_buttons.yui",
		data_context: oMatchGUI,
		is_full_screen: false
	});
	
	var _board = instance_create_layer(0, 0, "Board", oBoard, 
	{
		grid_width: _board_w,
		grid_height: _board_h
	});
	
	dist_standard(global.tilebag);
	
	var _count = 0;
	while(_count < 10)
	{
		add_tile_to_hand(oPlayerHand, global.tilebag);
		_count++;
	}

	oMatchStats.point_min = _point_min;
	oMatchStats.point_max = _point_max;	
	oMatchStats.turn_min = _turn_min;
	oMatchStats.turn_max = _turn_max;
}