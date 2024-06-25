function room_change(_room)
{
	if(room != _room)
	{
		global.previous_room = room;
		room_goto(_room);	
	}
}