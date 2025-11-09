function win_run()
{
	oStats.wins++;
	instance_create_layer(0, 0, "YUI", yui_document,
	{
		data_context : oRun,
		yui_file : "YUI screens/victory.yui"
	});
	audio_stop_all()
	audio_play_sound_on(global.emitterMS, msVictory, false, 1);
	var _saveloc = "gamesave.save";
	file_delete(_saveloc);
	show_debug_message("Deleting save at " + _saveloc)
}