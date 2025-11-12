if(global.paused){exit;}
if(visible and mouse_check_button_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	if(active)
	{
		screenTransition(rGame, , ST_CHECKER_DIAG_UL_TO_DR_Y);
		oRun.current_level = id;
		instance_create_layer(0, 0, "Meta", opponent);
		audio_play_sound_on(oGame.emitter_SE, sdSelect, false, 1)	
	}
	else
	{
		audio_play_sound_on(oGame.emitter_SE, sdBack, false, 1);	
	}
}

//hover		
if(visible and position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	image_xscale = 1.15;
	image_yscale = 1.15;
	if(!hover)
	{
		audio_play_sound_on(oGame.emitter_SE, sdHover, false, 1);
	}
	hover = true;
}
else
{
	image_xscale = 1;
	image_yscale = 1;
	hover = false;
}

if(room != rMap)
{
	visible = false;	
}
else
{
	visible = true;	
}