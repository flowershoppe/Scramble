if(mouse_check_button_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	audio_play_sound_on(global.emitterSE, sdSelect, false, 1);
	screenTransition(rShop, , ST_CHECKER_DIAG_UL_TO_DR_Y);
}

if(place_meeting(x, y, oCursor))
{
	if(image_xscale != 1.15)
	{
		audio_play_sound_on(global.emitterSE, sdCoin, false, 1);	
	}
	image_xscale = 1.15;
	image_yscale = 1.15;
}
else 
{
	image_xscale = 1;
	image_yscale = 1;
}
if(alarm_get(0) < 1 and instance_exists(oPlayer))
{
	if(oPlayer.money > 0)
	{
		alarm_set(0, 60);
	}	
}