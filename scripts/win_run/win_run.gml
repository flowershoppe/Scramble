function win_run()
{
	oStats.wins++;
	oRun.levels_completed++;
	audio_stop_sound(global.music);
	global.music = msVictory;
	audio_play_sound_on(global.emitterMS, global.music, false, 1);
	var _saveloc = "gamesave.save";
	file_delete(_saveloc);
	show_debug_message("Deleting save at " + _saveloc)	
}