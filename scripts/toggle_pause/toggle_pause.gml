function toggle_pause()
{
	if(room == rPauseMenu or room == rSettings)
	{
		room_goto(global.previous_room);
		global.previous_room = -1;
	}
	else
	{
		global.previous_room = room;
		room_goto(rPauseMenu);	
	}
}