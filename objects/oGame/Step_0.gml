if(keyboard_check_pressed(global.pause_button) and room != rSettings and room != rMainMenu)
{
	oSettings.prev_room = room;
	room_goto(rSettings);	
}