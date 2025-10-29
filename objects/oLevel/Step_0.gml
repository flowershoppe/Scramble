if(global.paused){exit;}
if(visible and active and mouse_check_button_pressed(mb_left) and 
	position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	tfx_set_effect("pixelize");
	tfx_set_duration(120);
	tfx_room_goto(rGame);
	oRun.current_level = id;
	instance_create_layer(0, 0, "Meta", opponent);
}

//hover		
if(position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	image_xscale = 1.15;
	image_yscale = 1.15;
}
else
{
	image_xscale = 1;
	image_yscale = 1;
}

if(room != rMap)
{
	visible = false;	
}
else
{
	visible = true;	
}