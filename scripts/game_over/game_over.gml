function game_over()
{
	oMatchManager.loss = true;	
	oMatchManager.active = false;
	
	instance_destroy(oTilebag);
	instance_destroy(oTile);
	
	//sprite_create_from_surface(application_surface), 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
	audio_stop_all()
	audio_play_sound(msGameOver, 1, true);
	
	
	instance_create_layer(0, 0, "YUI", yui_document,
	{ 
		yui_file : "YUI screens/game_over.yui",
		data_context : 	oRun
	});
}