function start_match()
{		
	var _lvl;
	for(var _i = 0; _i < array_length(oRun.levels); _i++)
	{	
		with(oRun.levels[_i])
		{
			if(active){_lvl = object_index; break;}	
		}
	}
	//UI
	instance_create_layer(0, 0, "Meta", oMatchGUI);
	instance_create_layer(0, 0, "YUI", yui_document, global.stMatchStats);	
	instance_create_layer(0, 0, "YUI", yui_document, global.stMatchButtons);
		
	//-----GAME ELEMENTS-----	
	var _hand = instance_create_layer(view_get_wport(0) / 2, 
				view_get_hport(0) - (sprite_get_height(global.hand_sprite) / 2), 
				"Hand", oPlayerHand,
				{
					size: oPlayer.hand_size			
				});	
	gen_board(_lvl);
	
	
	oTilebag.yui_tiles = oTilebag.match_tiles;
	array_copy(oTilebag.match_tiles, 0, oTilebag.tiles, 0, array_length(oTilebag.tiles));
	add_tile_to_hand(_hand.size);
	
	oMatchManager.active = true
	broadcast("turn start");
	broadcast("match start");
	save_game();
	
}