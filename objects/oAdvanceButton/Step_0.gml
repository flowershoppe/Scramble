if(mouse_check_button_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	//advance dialogue
	with(oDialogue)
	{
		event_user(0);
	}
}

if(!instance_exists(oDialogue)){instance_destroy(self);}

x = 850;
y = 500;