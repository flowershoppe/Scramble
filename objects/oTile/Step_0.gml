var _tile = id;

//hover	
if(layer != true_layer & layer != layer_get_id("Grabbed"))
{
	true_layer = layer;	
}

if(oCursor.held_tile == noone and oCamera.dragging == false)
{
	if(grabbable and ((position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) and visible)
		or (place_meeting(x, y, oCursor) and on_board)))
	{
		if(oMatchManager.active){layer = layer_get_id("Grabbed");}
		xscale = 1.15;
		yscale = 1.15;
	}
	else
	{
		layer = true_layer;
		xscale = 1;
		yscale = 1;
	}
}

//exchanging
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
		if(array_contains(oPlayerHand.tile_holder_array, id))
		{
			tile.in_hand = true;
		}
	}
	
}

/*if(array_contains(oPlayerHand.tile_holder_array, holder) and blank)
{	
	//reset blank tile if in hand
	wait_for_input = false;
	letter = "_";
}

