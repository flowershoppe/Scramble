global.gui_scaling = window_get_width() / 960;

if(input_check_pressed("cancel") and room == rGame and array_length(oPlayer.placed_tiles) > 0)
{
	return_tiles();
}
if(input_check_pressed("cancel") and global.exchanging)
{
	global.exchanging = false;
}

if(input_check_pressed("pause"))
{
	toggle_pause();
}

if(input_check_pressed("special") and room == rGame)
{	
	exchange_tiles();	
}/*
if(input_keyboard_check_pressed(ord("1")))
{
	//with(oLevel){active = true;}
	cheat = !cheat;
}
if(input_keyboard_check_pressed(ord("2")))
{
	oMatchManager.total_points += 10;	
	oPlayer.money += 100;
	add_charm(oScales);
	add_charm(oSeedling);
}*/

if(instance_exists(oMatchManager))
{
	if(room == rGameOver and oMatchManager.victory and 
		!audio_is_playing(msVictory) and !audio_is_playing(msVictoryLoop))
	{
		global.music = msVictoryLoop
		audio_play_sound_on(oGame.emitter_MS, global.music, true, 1);
	}
	/*if(oMatchManager.victory and room != rGameOver and !audio_is_playing(msWin) and !audio_is_playing(msWinLoop))
	{
		global.music = msWinLoop;
		audio_play_sound_on(oGame.emitter_MS, global.music, true, 1);
	}*/
}