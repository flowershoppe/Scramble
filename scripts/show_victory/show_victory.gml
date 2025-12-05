function show_victory()
{
	oMatchManager.typist = 0;
	oTilebag.yui_tiles = oTilebag.tiles;
	reset_tilebag();
	room_persistent = false;
	audio_play_sound_on(oGame.emitter_SE, sdGrats, false, 1);
	instance_create_layer(0, 0, "YUI", yui_document,
	{
		data_context : oRun,
		yui_file : "YUI screens/victory.yui"
	});
}