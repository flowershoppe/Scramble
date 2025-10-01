function start_match()
{		
	var _lvl = oRun.current_level.object_index;
	//UI
	instance_create_layer(0, 0, "Meta", oMatchGUI);
	instance_create_layer(0, 0, "YUI", yui_document, global.stMatchStats);	
	instance_create_layer(0, 0, "YUI", yui_document, global.stMatchButtons);
		
	//-----GAME ELEMENTS-----	
	var _hand = instance_create_layer(view_get_wport(0) / 2, 
				view_get_hport(0) - (sprite_get_height(oRun.hand_sprite) / 2), 
				"Hand", oPlayerHand,
				{
					size: 7				
				});	
	gen_board(_lvl);
	
	
	oTilebag.yui_tiles = oTilebag.match_tiles;
	array_copy(oTilebag.match_tiles, 0, oTilebag.tiles, 0, array_length(oTilebag.tiles));
	add_tile_to_hand(_hand.size);
	
	//run custom code
	with(oOpponent)
	{
		event_user(0);
	}
	
	oMatchManager.active = true
	broadcast("turn start");
	broadcast("match start");
	save_game();
	
}