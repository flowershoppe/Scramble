if(mouse_check_button_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	screenTransition(rShop, , ST_CHECKER_DIAG_UL_TO_DR_Y);
}

if(place_meeting(x, y, oCursor))
{
	image_xscale = 1.15;
	image_yscale = 1.15;
}
else 
{
	image_xscale = 1;
	image_yscale = 1;
}