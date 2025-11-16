//new run
instance_create_layer(100, 450, "Tilebag", oTilebag);
dist_standard(oTilebag);
	
//initialize handlers
instance_create_layer(0, 0, "Meta", oCharmManager);
instance_create_layer(0, 0, "Meta", oMatchManager);

//generate shop
with(oShop){event_user(0);}

//initialize player and cursor
instance_create_layer(0, 0, "Meta", oPlayer);	

create_levels(3, oLevel1);

save_game();

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