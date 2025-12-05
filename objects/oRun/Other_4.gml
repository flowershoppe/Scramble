if(room == rMap or room == rResults)
{
	save_game();
}

if(room == rMap)
{
	if(!audio_is_playing(global.music_map))
	{
		switch(oRun.stage)
		{
			case 1:
				global.music_map = msMap;
			break;
				
			case 2:
				global.music_map = msMap2;
			break;
				
			case 3:
				global.music_map = msMap3;
			break;
		}
		audio_stop_sound(global.music);
		global.music = global.music_map;
		audio_play_sound_on(global.emitterMS, global.music_map, true, 1);
	}
}

if(room == rGameOver)
{
	alarm_set(3, 180);
}