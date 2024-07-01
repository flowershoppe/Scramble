var _tile = id;

if(array_contains(global.tilebag.tiles, id))
{
	visible = false;
}
else
{
	visible = true;	
}

if(array_contains(oPlayerHand.tile_holder_array, holder) and blank)
{	
	//reset blank tile if in hand
	wait_for_input = false;
	letter = "_";
}
	
if(position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)
	and input_mouse_check_pressed(mb_left) and global.exchanging
		and in_hand)
{
	selected = !selected;
}

with(oTileHolder)
{
	if(tile == _tile)
	{
		tile.holder = id;	
		
		if(array_contains(oPlayerHand.tile_holder_array, id))
		{
			tile.in_hand = true;
		}
	}
	
}

