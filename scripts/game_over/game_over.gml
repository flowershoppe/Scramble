function game_over()
{
	oStats.losses ++;
	
	//sprite_create_from_surface(application_surface), 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
	audio_stop_all()
	audio_play_sound_on(oGame.emitter_MS, msGameOver, true, 1);
	oTilebag.yui_tiles = oTilebag.tiles;
	reset_tilebag();
	instance_create_layer(0, 0, "YUI", yui_document,
	{ 
		yui_file : "YUI screens/game_over.yui",
		data_context : 	oRun
	});
}