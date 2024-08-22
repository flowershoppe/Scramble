if(mouse_check_button_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	room_goto(rGame);
}

//hover		
if(position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	image_xscale = 1.15;
	image_yscale = 1.15;
	depth = -1;
}
else
{
	image_xscale = 1;
	image_yscale = 1;
	depth = 0;
}
