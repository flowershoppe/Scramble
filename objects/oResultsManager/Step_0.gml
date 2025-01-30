if(input_check_pressed("confirm") or input_mouse_check_pressed(mb_left))
{
	//reset match manager and opponent
	instance_destroy(oMatchManager);
	instance_create_layer(0, 0, "Meta", oMatchManager);
	
	instance_destroy(oOpponent);
	
	//return to map
	room_goto(rMap);
}