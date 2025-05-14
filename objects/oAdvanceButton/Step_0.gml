if(global.paused){image_speed = 0; exit;}
else{image_speed = 1;}
if(mouse_check_button_released(mb_left) and 
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